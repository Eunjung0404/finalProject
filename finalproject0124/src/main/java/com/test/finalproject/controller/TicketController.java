package com.test.finalproject.controller;

import java.lang.ProcessBuilder.Redirect;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.finalproject.service.ChapaymentService;
import com.test.finalproject.vo.TiketParameterVo;
import com.test.finalproject.vo.TiketSeatParameterVo;

@Controller
public class TicketController {
	@Autowired
	ChapaymentService service;

	@GetMapping("/ctrl")
	public String tiketPages() {

		return "ticket/theaterlist";
	}
	@GetMapping("/ctrl2")
	public String tiketPagesw() {

		return "ticket/theaterctrl";
	}

	
	@GetMapping("/ticket")
	public String tiketPage(Model m,@RequestParam(value="moviecode",defaultValue="0")int moviecode) {
		m.addAttribute("moviecode", moviecode);
		return "ticket/ticket.tiles";
	}

	@PostMapping("member/payment")
	public String paymentPage(RedirectAttributes redirect, TiketSeatParameterVo vo) {

		// 예약인서트
		service.reservationInsert(vo);
		// 예매번호 가져오기
		int reservationcode = service.getReservationCode();
		// 좌석예매하기
		HashMap<String, Object> rmap = new HashMap<String, Object>();
		rmap.put("RESERVATIONCODE", reservationcode);
		for (int i = 0; i < Integer.parseInt(vo.getCount()); i++) {
			rmap.put("SEATNAME", vo.getSeatname().get(i));
			service.reservationSeatInsert(rmap);
		}
		// 결제정보 인서트

		rmap.put("TOTALPRICE", vo.getTotalprice());
		rmap.put("PAYMENTTYPE", vo.getPaymenttype());
		service.paymentInsert(rmap);
		// seat-info 업데이트
		for (int i = 0; i < Integer.parseInt(vo.getCount()); i++) {
			service.seatInfoUpdate(Integer.parseInt(vo.getSeatcode().get(i)));
		}
		service.addCount(Integer.parseInt(vo.getMoviecode()));

		redirect.addFlashAttribute("vo", vo);
		return "redirect:/member/payment";

	}

	@GetMapping("member/payment")
	public String getpaymentPage(Model m, @ModelAttribute("vo") TiketSeatParameterVo vo) {

		// 예매번호 가져오기
		int reservationcode = service.getReservationCode();
		int paymentcode = service.getPaymentCode();

		SimpleDateFormat datefromat = new SimpleDateFormat("yyyy/MM/dd (E)요일");
		Date paymentdate = service.getPaymentData();
		String sDate = datefromat.format(paymentdate);
		m.addAttribute("vo", vo);

		m.addAttribute("reservationcode", reservationcode);
		m.addAttribute("paymentcode", paymentcode);
		m.addAttribute("paymentdate", sDate);
		return "ticket/payment.tiles";

	}

	@RequestMapping("member/seat")
	public String seatPage(Model m, TiketParameterVo vo) {
		if (vo.getScreencode() == null || vo.getScreencode() == "") {
			return "redirect:/ticket";
		}
		SimpleDateFormat datefromat = new SimpleDateFormat("yyyy/MM/dd (E)요일");
		String sDate = datefromat.format(vo.getScreendate());
		System.out.println(vo.getMoviename());
		m.addAttribute("vo", vo);
		m.addAttribute("screendate", sDate);

		return "ticket/seatSelect.tiles";
	}

}

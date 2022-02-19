package com.test.finalproject.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.finalproject.aop.annotation.AdminLevel;
import com.test.finalproject.service.TheaterService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/theater")
@RequiredArgsConstructor
public class AdminTheaterManageController {

	private final TheaterService service;
	
	@GetMapping("/ALL")
	@AdminLevel(1)
	public String allTheaterPage() {
		return "admin/theaters";
	}
	
	@GetMapping("/{theatername}")
	public String localTheaterPage(
				@PathVariable String theatername, Model model
			) {
		model.addAttribute("screen", service.getTheaterByName(theatername));
		return "admin/theater";
	}
	
	@GetMapping("/{theatername}/{screencode}")
	public String seatPage() {
		return "admin/seat";
	}
	
}

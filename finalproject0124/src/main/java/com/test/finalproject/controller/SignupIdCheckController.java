package com.test.finalproject.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.test.finalproject.service.MemberService; 


@Controller
public class SignupIdCheckController {
	@Autowired
	private MemberService service;

	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("mid") String mid) {
//		System.out.println("id:" + mid);
		int n = service.idCheck(mid);
//		System.out.println("n:" + n);
		return n;
		
	}
}

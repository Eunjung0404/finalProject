package com.test.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.service.MemberService;

@RestController
public class MemberTicketingCancleController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/member/ticketingCancle", method = RequestMethod.GET)
	public int ticketingCancle(int reservationcode) {
		int n = service.ticketingCancle(reservationcode);
		
		
		return n;
	}
	
}

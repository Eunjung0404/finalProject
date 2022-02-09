package com.test.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TicketHelpController {
	@GetMapping("qna/tickethelp")
	public String TimeHelpJsp() {
		return "qna/tickethelp.tiles";
	}
}

package com.test.finalproject.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.service.AdminService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value = "/admin", produces = { MediaType.APPLICATION_JSON_VALUE })
@RequiredArgsConstructor
public class AdminLoginAPIController {

	private final AdminService service;
	
	@PostMapping("/login")
	public Map<String, Object> login(@Valid @RequestBody AdminLoginForm form, 
									BindingResult bindingResult,
									HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("msg", "fail");
		if(bindingResult.hasErrors()) {
			log.info("form 검증 실패->{}", bindingResult);
			return map;
		}
		service.login(form).ifPresent(admin -> {
			request.getSession().setAttribute("admin", admin);
			log.info("관리자 로그인->{}",admin.getAid());
			map.put("msg", "success");
		});
		return map;
//		AdminVo admin = service.login(form);
//		if(service.) {
//			log.info("관리자 로그인 실패->{}", admin);
//			map.put("msg", "fail");
//			return map;
//		}
//		HttpSession session = request.getSession();
//		session.setAttribute("admin", admin);
//		log.info("관리자 로그인->{}", admin);
//		map.put("msg", "success");
//		return map;
	}
}

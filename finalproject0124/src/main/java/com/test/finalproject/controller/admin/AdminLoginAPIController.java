package com.test.finalproject.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.error.exception.FormBindException;
import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.form.ResultForm;
import com.test.finalproject.service.AdminService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminLoginAPIController {

	private final AdminService service;
	
	@PostMapping("/login")
	public ResultForm login(@Valid @RequestBody AdminLoginForm form, 
									BindingResult bindingResult,
									HttpServletRequest request) {
		
		if(bindingResult.hasErrors()) {
			log.info("form 검증 실패->{}", bindingResult);
			throw new FormBindException("공백은 허용되지 않습니다.");
		}
		
		ResultForm result = new ResultForm("fail", null);
		
		service.login(form).ifPresent(admin -> {
			request.getSession().setAttribute("admin", admin);
			log.info("관리자 로그인->{}",admin.getAid());
			result.setCode("success");
		});
		
		return result;
		
	}
}

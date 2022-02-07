package com.test.finalproject.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.finalproject.form.AdminLoginForm;
import com.test.finalproject.service.AdminService;
import com.test.finalproject.vo.AdminVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminLoginAPIController {

	private final AdminService service;
	
	@PostMapping(value = "/login", produces = { MediaType.APPLICATION_JSON_VALUE })
	public Map<String, Object> login(@Valid @ModelAttribute AdminLoginForm form, 
									BindingResult bindingResult){
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(bindingResult.hasErrors()) {
			log.info("form 검증 실패->{}", bindingResult);
			map.put("msg", "fail");
		}else {
			AdminVo admin = service.login(form);
			log.info("form 검증 통과->{}", admin);
			map.put("msg", "success");
		}
		return map;
	}
}

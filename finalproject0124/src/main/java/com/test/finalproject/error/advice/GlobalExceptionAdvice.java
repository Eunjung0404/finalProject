package com.test.finalproject.error.advice;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.test.finalproject.error.exception.AdminCheckException;
import com.test.finalproject.form.ResultForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class GlobalExceptionAdvice {

	@ExceptionHandler(Exception.class)
	public String allException(Exception ex, Model model) {
		log.error(ex.getMessage()+"##");
		ex.printStackTrace();
		model.addAttribute("result", new ResultForm("500","서버 오류입니다."));
		return "error/error.tiles";
	}
	
	@ExceptionHandler({NoHandlerFoundException.class, AdminCheckException.class})
	public String notFound(Exception ex, Model model) {
		log.error(ex.getMessage()+"##");
		model.addAttribute("result", new ResultForm("404","페이지를 찾을 수 없습니다."));
		return "error/error.tiles";
	}
	
	@ExceptionHandler(AccessDeniedException.class)
	public String denied(Exception ex, Model model) {
		log.error(ex.getMessage()+"##");
		model.addAttribute("result", new ResultForm("403","접근 권한이 없습니다"));
		return "error/error.tiles";
	}
}

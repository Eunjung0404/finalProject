package com.test.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.test.finalproject.error.exception.AdminCheckException;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AdminCheckInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		if(session==null || session.getAttribute("admin")==null) {
			log.warn("잘 못된 관리자 접근->{}", request.getRequestURI());
			throw new AdminCheckException("비정상적인 접근");
		}
		return true;
	}
}

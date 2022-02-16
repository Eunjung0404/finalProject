package com.test.finalproject.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;


public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		Cookie cookie = new Cookie("mid", request.getParameter("username"));
		cookie.setMaxAge(30*60); 	// 쿠키 유지시간(30초)
		cookie.setPath("/");
		response.addCookie(cookie);
//		System.out.println("id" + request.getParameter("username"));
		
		String path = request.getContextPath() + "/";
		List<String> roleName = new ArrayList<String>();
		authentication.getAuthorities().forEach(auth -> roleName.add(auth.getAuthority()));
		
		if(roleName.contains("ROLE_ADMIN")) {
			response.sendRedirect(path + "admin/login");
		}else {
			RequestCache requestCache = new HttpSessionRequestCache();
			SavedRequest savedRequest = requestCache.getRequest(request, response);
			if(savedRequest!=null) {
				path = savedRequest.getRedirectUrl();
			}
			response.sendRedirect(path);
		}
	}
}

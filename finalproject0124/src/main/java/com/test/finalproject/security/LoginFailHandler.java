package com.test.finalproject.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginFailHandler implements AuthenticationFailureHandler {
	 private final String DEFAULT_FAILURE_URL = "/member/result";

    	// 파라미터들의 getter / setter가 존재하지 않으면 <bean> 등록시 <property> 태그에 오류가 발생한다.
	 // RequestDispatcher로 페이지 이동을 하게 되면 isAnnonymous() 가 먹히지 않음. 새로고침이 되어야 반응함.
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {				
		
//		if(exception instanceof AuthenticationServiceException) {
//			request.setAttribute("LoginFailMessage", "죄송합니다. 시스템에 오류가 발생했습니다.");			
//		}
//		 if(exception instanceof BadCredentialsException) {
//			request.setAttribute("LoginFailMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
//		}
//		else if(exception instanceof DisabledException) {
//			request.setAttribute("LoginFailMessage", "현재 사용할 수 없는 계정입니다.");
//		}
//		else if(exception instanceof LockedException) {
//			request.setAttribute("LoginFailMessage", "현재 잠긴 계정입니다.");
//		}
//		else if(exception instanceof AccountExpiredException) {
//			request.setAttribute("LoginFailMessage", "이미 만료된 계정입니다.");
//		}
//		else if(exception instanceof CredentialsExpiredException) {
//			request.setAttribute("LoginFailMessage", "비밀번호가 만료된 계정입니다.");
//		}
//		else request.setAttribute("LoginFailMessage", "계정을 찾을 수 없습니다.");
//		
	//	RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
	//	dispatcher.forward(request, response);
		String LoginFailMessage="";
			if(exception instanceof AuthenticationServiceException) {		// null 값이 리턴 됐을 때 발생되는 예외
			LoginFailMessage = "아이디 또는 비밀번호가 맞지 않습니다.";			
			}
			else if(exception instanceof BadCredentialsException) {	 		// UserDetails 객체를 리턴했으나, 아이디 또는 비밀번호가 틀림
				LoginFailMessage= "아이디 또는 비밀번호가 맞지 않습니다.";
			}
			else if(exception instanceof DisabledException) {				// UserDetails 객체의 isEnabled() 메소드의 리턴값이 false 일 때
				LoginFailMessage = "이미 탈퇴한 계정입니다.";
			}
			else if(exception instanceof LockedException) {				// UserDetails 객체의 isAccountNonLocked() 메소드의 리턴값이 false일 때
				LoginFailMessage = "현재 사용할 수 없는 계정입니다. 관리자에 문의해주세요.";
			}
			else if(exception instanceof AccountExpiredException) {			// UserDetails 객체의 isAccountNonExpired() 메소드의 리턴값이 false일 때
				LoginFailMessage = "이미 만료된 계정입니다.";
			}
			else if(exception instanceof CredentialsExpiredException) {			// UserDetails 객체의 isCredentialsNonExpired() 메소드의 리턴값이 false일 때
				LoginFailMessage = "비밀번호가 만료된 계정입니다.";
			}
			else LoginFailMessage = "아이디 또는 비밀번호가 맞지 않습니다.";
			
		 response.sendRedirect(request.getContextPath()+"/login?LoginFailMessage=" + URLEncoder.encode(LoginFailMessage ,"utf-8"));
	    }	
}

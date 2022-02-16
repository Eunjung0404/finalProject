package com.test.finalproject.aop.advice;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.test.finalproject.aop.annotation.AdminLevel;
import com.test.finalproject.error.exception.AdminCheckException;
import com.test.finalproject.error.exception.AdminLevelCheckException;
import com.test.finalproject.vo.AdminVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect
@Component
public class AdminLevelCheckAdvice {

	@Before("@annotation(com.test.finalproject.aop.annotation.AdminLevel)")
	public void levelCheck(JoinPoint joinPoint) {
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder
				.currentRequestAttributes()).getRequest();
		
		Optional<HttpSession> session2 = Optional.ofNullable(request.getSession(false));
		AdminVo admin = session2
				.map(session -> (AdminVo)session.getAttribute("admin"))
				.orElseThrow(() -> new AdminCheckException("비정상적인 접근"));
		
		MethodSignature methodSignature = (MethodSignature)joinPoint.getSignature();
		int level = methodSignature.getMethod().getAnnotation(AdminLevel.class).value();
		
		if(admin.getAlevel() > level) {
			log.warn("잘 못된 관리자 접근->[{}, {}]"
					, request.getRequestURI(), admin.getAid());
			throw new AdminLevelCheckException("접근 권한이 없습니다.");
		}
		
	}
	
}

package com.test.finalproject.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.test.finalproject.service.MemberService;

public class CustomUserDetailService implements UserDetailsService {
	@Autowired
	private MemberService service;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetail userDetail = service.getAuths(username);
		return userDetail;
	}
	
	
}

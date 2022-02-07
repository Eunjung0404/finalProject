package com.test.finalproject.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.test.finalproject.vo.AuthoritiesVo;

public class CustomUserDetail implements UserDetails {
	// DB에서 가져와 저장
	private String mid;
	private String mpwd;
	private String enabled;
	
	// 가져 온 데이터 리스트로 담기
	private List<AuthoritiesVo> authList;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
		for(AuthoritiesVo vo:authList) {
			auths.add(new SimpleGrantedAuthority(vo.getAuthority()));
		}
		// 사용자 권한을 담은 컬렉션 객체를 리턴한다
		return auths;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return mpwd;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return mid;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		if (enabled.equals('0')) {
			return false;
		} else {
			return true;
		}		
	}

}

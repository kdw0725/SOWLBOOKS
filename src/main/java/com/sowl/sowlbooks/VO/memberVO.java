package com.sowl.sowlbooks.VO;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.ToString;

@ToString
public class memberVO implements UserDetails{
	
	private int 	member_no;
	private String  member_name;
	private String  member_id;
	private String  member_pw;
	private String  member_email;
	private String  member_authority;
	private boolean member_delflag;
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(member_authority));
		return auth;
	}

	@Override
	public String getPassword() {
		return member_pw;
	}
	public void setPassword(String member_pw) {
		this.member_pw = member_pw;
	}

	@Override
	public String getUsername() {
		return member_id;
	}
	
	public void setUsername(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return member_delflag;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}
	
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
}

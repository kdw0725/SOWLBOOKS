package com.sowl.sowlbooks.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.sowl.sowlbooks.DAO.memberDAO;
import com.sowl.sowlbooks.VO.memberVO;

public class memberService implements UserDetailsService{
	
	@Autowired
	memberDAO dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		memberVO user = dao.getUserById(username);
		if(user==null) {
			throw new UsernameNotFoundException(username);
		}
		return user;
	}

}
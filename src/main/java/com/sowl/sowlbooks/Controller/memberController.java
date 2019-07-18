package com.sowl.sowlbooks.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memberController {
	
	
	@RequestMapping(value="/member/logIn")
	public String logIn() throws Exception{
		return "/member/logIn";
	}
	
	@RequestMapping(value="/member/access_denied_page")
	public String accessDeniedPage() throws Exception{
		return "/member/access_denied_page";
	}
}

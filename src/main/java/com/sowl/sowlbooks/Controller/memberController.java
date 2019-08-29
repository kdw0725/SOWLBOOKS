package com.sowl.sowlbooks.Controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sowl.sowlbooks.Service.memberService;
import com.sowl.sowlbooks.VO.memberVO;

@Controller
public class memberController {
	
	@Autowired
	memberService service;
	
	@Inject
	BCryptPasswordEncoder passEncoder;
	
	@RequestMapping(value="/member/logIn")
	public String logIn() throws Exception{
		return "/member/logIn";
	}
	
	@RequestMapping(value="/member/signIn")
	public String signIn() throws Exception{
		return "/member/signIn";
	}
	
	@RequestMapping(value="/member/access_denied_page")
	public String accessDeniedPage() throws Exception{
		return "/member/access_denied_page";
	}
	
	@RequestMapping(value="/member/checkNo", method = RequestMethod.POST)
	@ResponseBody
	public int checkNo(int member_no) throws Exception{
		return service.checkNo(member_no);
	}
	
	@RequestMapping(value="/member/checkId", method = RequestMethod.POST)
	@ResponseBody
	public int checkId(String member_id) throws Exception{
		return service.checkId(member_id);
	}
	
	@RequestMapping(value="/member/signInDo", method = RequestMethod.POST)
	public String signInDo(Model model, memberVO vo,
			@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw
			) throws Exception {
		vo.setUsername(member_id);
		vo.setPassword(passEncoder.encode(member_pw));
		System.out.println(member_id);
		System.out.println(vo.toString());
		service.signIn(vo);
		return "redirect:/";
	}
}

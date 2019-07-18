package com.sowl.sowlbooks.Controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sowl.sowlbooks.Service.testService;

@Controller
public class testController {
	@Autowired
	testService service;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model) {
		model.addAttribute("list", service.test());
		return "/test";
	}
}

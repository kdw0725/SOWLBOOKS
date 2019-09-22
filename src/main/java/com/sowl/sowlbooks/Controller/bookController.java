package com.sowl.sowlbooks.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sowl.sowlbooks.Service.bookService;

@Controller
public class bookController {
	@Autowired
	bookService service;
	
	@RequestMapping(value="/book/bookSearch")
	public String bookSearch() {
		return "/book/bookSearch";
	}
	
	@RequestMapping(value="/book/bookList", method = RequestMethod.GET)
	public String bookList(Model model) {
		model.addAttribute("list",service.bookList());
		return "/book/bookList";
	}

}

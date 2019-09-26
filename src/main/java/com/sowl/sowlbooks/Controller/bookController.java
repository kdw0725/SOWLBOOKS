package com.sowl.sowlbooks.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sowl.sowlbooks.Service.bookService;
import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.PageMaker;
import com.sowl.sowlbooks.VO.SearchCriteria;

@Controller
public class bookController {
	@Autowired
	bookService service;
	
	@RequestMapping(value="/book/bookSearch")
	public String bookSearch() {
		return "/book/bookSearch";
	}
	
	@RequestMapping(value="/book/bookList", method = RequestMethod.GET)
	public String bookList(Model model, Criteria cri, SearchCriteria scri) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countBook(scri));
		model.addAttribute("list",service.bookList(scri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("keyword", scri.getKeyword());
		return "/book/bookList";
	}
	
	@RequestMapping(value="/book/bookInsert", method = RequestMethod.GET)
	public String bookInsert(Model model) throws Exception{
		return "/book/bookInsert";
	}

}

package com.sowl.sowlbooks.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sowl.sowlbooks.Service.noticeService;
import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.PageMaker;
import com.sowl.sowlbooks.VO.SearchCriteria;
import com.sowl.sowlbooks.VO.noticeVO;

@Controller
public class noticeController {
	
	@Autowired
	noticeService service;
	
	@RequestMapping(value="/notice/notice", method = RequestMethod.GET)
	public String notice(Model model, Criteria cri, SearchCriteria scri) throws Exception{
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.countNotice(scri));
		model.addAttribute("list", service.notice(scri));
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("keyword", scri.getKeyword());
		return "/notice/notice";
	}
	
	@RequestMapping(value="/notice/noticeInsert")
	public String noticeInsert() {
		return "/notice/noticeInsert";
	}
	
	@RequestMapping(value="/notice/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(Model model, int notice_no) throws Exception{
		model.addAttribute("list",service.selectNotice(notice_no));
		return "/notice/noticeDetail";
	}
	
	@RequestMapping(value="/notice/noticeInsertDo", method = RequestMethod.GET)
	public String noticeInsertDo(noticeVO vo) throws Exception{
		service.noticeInsert(vo);
		return "redirect:/notice/notice";
	}
	
	@RequestMapping(value="/notice/noticeUpdate", method = RequestMethod.GET)
	public String noticeUpdate(Model model, int notice_no) throws Exception {
		model.addAttribute("list",service.selectNotice(notice_no));
		return "/notice/noticeUpdate";
	}
	
	@RequestMapping(value="/notice/noticeUpdateDo", method = RequestMethod.GET)
	public String noticeUpdateDo(Model model, noticeVO vo) throws Exception{
		service.noticeUpdate(vo);
		return "redirect:/notice/noticeDetail?notice_no="+vo.getNotice_no();
	}
	
	@RequestMapping(value="/notice/noticeDelete", method = RequestMethod.GET)
	public String noticeDelete(int notice_no) throws Exception{
		service.noticeDelete(notice_no);
		return "redirect:/notice/notice";
	}
	
	
}

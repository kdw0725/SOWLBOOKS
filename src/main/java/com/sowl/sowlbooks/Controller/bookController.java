package com.sowl.sowlbooks.Controller;

import java.io.File;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sowl.sowlbooks.Service.bookService;
import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.PageMaker;
import com.sowl.sowlbooks.VO.SearchCriteria;
import com.sowl.sowlbooks.VO.bookVO;
import com.sowl.sowlbooks.VO.fileVO;

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
	
	@RequestMapping(value="/book/bookInsertDo", method = RequestMethod.POST)
	public String bookInsertDo(bookVO vo, fileVO fvo,
			@RequestParam("book_img") MultipartFile files
			) throws Exception{
		if(files.isEmpty()) {
			service.insertBook(vo);
		}else {
			String sourceFileName = files.getOriginalFilename();
			String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileURL = "C:\\dev\\sts-bundle\\sts-3.9.9.RELEASE\\workspace\\SOWLBOOKS\\src\\main\\webapp\\resources\\bootstrap\\images\\upload\\";
			
			do {
				destinationFileName = RandomStringUtils .randomAlphanumeric(32)+"."+sourceFileNameExtension;
				destinationFile = new File(fileURL+destinationFileName);
			}while(destinationFile.exists());
			
			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);
			service.insertBook(vo);
			
			fvo.setBook_no(vo.getBook_no());
			fvo.setFile_name(destinationFileName);
			fvo.setFile_ori_name(sourceFileName);
			fvo.setFile_url(fileURL);
			service.insertFile(fvo);
		}
		return "redirect:/book/bookList";
	}
	
	@RequestMapping(value="/book/bookDetail", method = RequestMethod.GET)
	public String bookDetail(Model model, bookVO vo, fileVO fvo) throws Exception{
		model.addAttribute("list", service.bookDetail(vo.getBook_no()));
		return "/book/bookDetail";
	}
	
	@RequestMapping(value="/book/bookDelete", method = RequestMethod.GET)
	public String bookDelete(fileVO fvo) throws Exception{
		service.bookDelete(fvo.getBook_no());
		service.fileDelete(fvo.getFile_no());
		return "redirect:/book/bookList";
	}

}

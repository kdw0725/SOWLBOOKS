package com.sowl.sowlbooks.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class boardController {
	@RequestMapping(value="/board/boardList")
	public String boardList() throws Exception{
		return "board/boardList";
	}
}

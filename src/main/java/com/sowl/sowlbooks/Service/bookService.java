package com.sowl.sowlbooks.Service;

import java.util.HashMap;
import java.util.List;

import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.bookVO;
import com.sowl.sowlbooks.VO.fileVO;

public interface bookService {
	public List<HashMap<String, Object>> bookList(Criteria cri);
	public int countBook(Criteria cri);
	public int insertBook(bookVO vo);
	public int insertFile(fileVO vo);
	public HashMap<String, Object> bookDetail(String book_no);
	public int bookDelete(String book_no);
	public int fileDelete(int file_no);
	
}

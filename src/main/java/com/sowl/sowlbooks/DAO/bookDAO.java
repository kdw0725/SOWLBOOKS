package com.sowl.sowlbooks.DAO;

import java.util.HashMap;
import java.util.List;

import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.bookVO;
import com.sowl.sowlbooks.VO.fileVO;

public interface bookDAO {
	public List<HashMap<String, Object>> bookList(Criteria cri);
	public int countBook(Criteria cri);
	public int insertBook(bookVO vo);
	public int insertFile(fileVO vo);
	public HashMap<String, Object> bookDetail(int book_no);
	
}

package com.sowl.sowlbooks.DAO;

import java.util.List;

import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.bookVO;
import com.sowl.sowlbooks.VO.fileVO;

public interface bookDAO {
	public List<bookVO> bookList(Criteria cri);
	public int countBook(Criteria cri);
	public int insertBook(bookVO vo);
	public int insertFile(fileVO vo);
}

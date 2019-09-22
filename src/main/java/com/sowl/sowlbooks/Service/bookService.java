package com.sowl.sowlbooks.Service;

import java.util.List;

import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.bookVO;

public interface bookService {
	public List<bookVO> bookList(Criteria cri);
	public int countBook(Criteria cri);

}

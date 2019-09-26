package com.sowl.sowlbooks.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sowl.sowlbooks.DAO.bookDAO;
import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.bookVO;
import com.sowl.sowlbooks.VO.fileVO;

@Service
public class bookServiceImpl implements bookService{
	@Autowired
	bookDAO dao;

	@Override
	public List<bookVO> bookList(Criteria cri) {
		return dao.bookList(cri);
	}

	@Override
	public int countBook(Criteria cri) {
		return dao.countBook(cri);
	}

	@Override
	public int insertBook(bookVO vo) {
		return dao.insertBook(vo);
	}

	@Override
	public int insertFile(fileVO vo) {
		return dao.insertFile(vo);
	}

}

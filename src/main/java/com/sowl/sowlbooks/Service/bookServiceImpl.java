package com.sowl.sowlbooks.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sowl.sowlbooks.DAO.bookDAO;
import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.bookVO;

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

}

package com.sowl.sowlbooks.Service;

import java.util.HashMap;
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
	public List<HashMap<String, Object>> bookList(Criteria cri) {
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

	@Override
	public HashMap<String, Object> bookDetail(String book_no) {
		return dao.bookDetail(book_no);
	}

	@Override
	public int bookDelete(String book_no) {
		return dao.bookDelete(book_no);
	}

	@Override
	public int fileDelete(int file_no) {
		return dao.fileDelete(file_no);
	}

}

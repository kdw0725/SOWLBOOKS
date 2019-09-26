package com.sowl.sowlbooks.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.bookVO;
import com.sowl.sowlbooks.VO.fileVO;

@Repository
public class bookDAOImpl implements bookDAO{
	private final String namespace = "com.sowl.sowlbooks.bookMapper";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<HashMap<String, Object>> bookList(Criteria cri) {
		return sqlSession.selectList(namespace+".bookList",cri);
	}

	@Override
	public int countBook(Criteria cri) {
		return sqlSession.selectOne(namespace+".countBook",cri);
	}

	@Override
	public int insertBook(bookVO vo) {
		return sqlSession.insert(namespace+".insertBook", vo);
	}

	@Override
	public int insertFile(fileVO vo) {
		return sqlSession.insert(namespace+".insertFile", vo);
	}

	@Override
	public HashMap<String, Object> bookDetail(int book_no) {
		return sqlSession.selectOne(namespace+".bookDetail", book_no);
	}

}

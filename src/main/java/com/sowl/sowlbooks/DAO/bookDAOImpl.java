package com.sowl.sowlbooks.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.bookVO;

@Repository
public class bookDAOImpl implements bookDAO{
	private final String namespace = "com.sowl.sowlbooks.bookMapper";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<bookVO> bookList(Criteria cri) {
		return sqlSession.selectList(namespace+".bookList",cri);
	}

	@Override
	public int countBook(Criteria cri) {
		return sqlSession.selectOne(namespace+".countBook",cri);
	}

}

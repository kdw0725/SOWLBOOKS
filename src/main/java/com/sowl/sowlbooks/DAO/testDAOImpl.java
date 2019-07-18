package com.sowl.sowlbooks.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sowl.sowlbooks.VO.testVO;

@Repository
public class testDAOImpl implements testDAO{
	
	private final String namespace = "com.sowl.sowlbooks.testMapper";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<testVO> test() {
		return sqlSession.selectList(namespace+".test");
	}

}

package com.sowl.sowlbooks.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sowl.sowlbooks.VO.memberVO;

@Repository
public class memberDAO {
	private final String namespace = "com.sowl.sowlbooks.memberMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public memberVO getUserById(String username) {
		return sqlSession.selectOne(namespace+".selectUserById",username);
	}
}

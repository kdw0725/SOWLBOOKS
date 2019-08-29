package com.sowl.sowlbooks.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import com.sowl.sowlbooks.VO.memberVO;

@Repository
public class memberDAO{
	private final String namespace = "com.sowl.sowlbooks.memberMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	public memberVO getUserById(String username) {
		return sqlSession.selectOne(namespace+".selectUserById",username);
	}
	
	public int checkNo(int member_no) throws Exception{
		return sqlSession.selectOne(namespace+".checkNo", member_no);
	}
	
	public int checkId(String member_id) throws Exception{
		return sqlSession.selectOne(namespace+".checkId", member_id);
	}
	
	public int signIn(memberVO vo) throws Exception{
		return sqlSession.insert(namespace+".signIn", vo);
	}
}

package com.sowl.sowlbooks.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sowl.sowlbooks.VO.noticeVO;

@Repository
public class noticeDAOImpl implements noticeDAO{
	private final String namespace = "com.sowl.sowlbooks.noticeMapper";
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<noticeVO> notice() throws Exception{
		return sqlSession.selectList(namespace+".notice");
	}

	@Override
	public noticeVO selectNotice(int notice_no) throws Exception{
		return sqlSession.selectOne(namespace+".selectNotice", notice_no);
	}

	@Override
	public int noticeInsert(noticeVO vo) throws Exception {
		return sqlSession.insert(namespace+".noticeInsert", vo);
	}

	@Override
	public int noticeUpdate(noticeVO vo) throws Exception {
		return sqlSession.update(namespace+".noticeUpdate", vo);
	}

	@Override
	public int noticeDelete(int notice_no) throws Exception {
		return sqlSession.update(namespace+".noticeDelete", notice_no);
	}

}

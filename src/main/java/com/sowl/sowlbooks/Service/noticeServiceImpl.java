package com.sowl.sowlbooks.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sowl.sowlbooks.DAO.noticeDAO;
import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.noticeVO;

@Service
public class noticeServiceImpl implements noticeService{
	
	@Autowired
	noticeDAO dao;

	@Override
	public List<noticeVO> notice(Criteria cri) throws Exception{
		return dao.notice(cri);
	}

	@Override
	public noticeVO selectNotice(int notice_no) throws Exception{
		return dao.selectNotice(notice_no);
	}

	@Override
	public int noticeInsert(noticeVO vo) throws Exception {
		return dao.noticeInsert(vo);
	}

	@Override
	public int noticeUpdate(noticeVO vo) throws Exception {
		return dao.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(int notice_no) throws Exception {
		return dao.noticeDelete(notice_no);
	}

	@Override
	public int countNotice(Criteria cri) throws Exception {
		return dao.countNotice(cri);
	}

}

package com.sowl.sowlbooks.DAO;

import java.util.List;

import com.sowl.sowlbooks.VO.Criteria;
import com.sowl.sowlbooks.VO.noticeVO;

public interface noticeDAO {
	public List<noticeVO> notice(Criteria cri) throws Exception;
	public noticeVO selectNotice(int notice_no) throws Exception;
	public int noticeInsert(noticeVO vo) throws Exception;
	public int noticeUpdate(noticeVO vo) throws Exception;
	public int noticeDelete(int notice_no) throws Exception;
	public int countNotice() throws Exception;

}

package com.sowl.sowlbooks.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sowl.sowlbooks.DAO.testDAO;
import com.sowl.sowlbooks.VO.testVO;

@Service
public class testServiceImpl implements testService{

	@Autowired
	testDAO dao;
	
	@Override
	public List<testVO> test() {
		return dao.test();
	}

}

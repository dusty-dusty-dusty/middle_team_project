package com.mid.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mid.common.model.AdminVO;
import com.mid.manager.repo.AdminLoginDAO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService{
	
	@Autowired
	private AdminLoginDAO adminLoginDAO;
	
	@Override
	public AdminVO loginCheck(AdminVO vo) {
		return adminLoginDAO.loginCheck(vo);
	}

}

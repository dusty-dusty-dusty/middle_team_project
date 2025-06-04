package com.mid.manager.repo;

import org.apache.ibatis.annotations.Mapper;

import com.mid.common.model.AdminVO;

@Mapper
public interface AdminLoginDAO {
	public AdminVO loginCheck(AdminVO vo);
}

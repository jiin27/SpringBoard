package org.sp.springapp.model.admin;

import org.apache.ibatis.session.SqlSession;
import org.sp.springapp.domain.Admin;
import org.sp.springapp.mybatis.MybatisConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisAdminDAO implements AdminDAO{
	@Autowired //스프링이 자동으로 메모리에 올려줌
	private MybatisConfig mybatisConfig; //쿼리문 실행해야 하기 때문에 mybatisConfig 필요
	
	@Override
	public Admin login(Admin admin) {
		SqlSession sqlSession = mybatisConfig.getSqlSession();
		Admin dto=sqlSession.selectOne("Admin.login", admin);
		mybatisConfig.release(sqlSession);
		
		return dto;
	}
	
}

package org.sp.springapp.model.admin;

import org.sp.springapp.domain.Admin;
import org.sp.springapp.exception.AdminException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO; //쿼리문 실행을 담당하는 dao를 보유해 해당 dao의 메서드를 호출

	@Override
	public Admin login(Admin admin) throws AdminException{
		Admin dto = adminDAO.login(admin);
		
		if(dto==null) { //로그인 쿼리 실행의 결과가 db와 입력값의 불일치로 실패할 수도 있다, 해당 경우 처리 로직을 넣어야 됨
			throw new AdminException("로그인 정보가 올바르지 않습니다");
		}
		
		return dto;
	}

	@Override
	public void signup(Admin admin) throws AdminException{
		adminDAO.signup(admin);
		
	}

	
}

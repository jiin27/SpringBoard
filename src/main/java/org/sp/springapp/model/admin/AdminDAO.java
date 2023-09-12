package org.sp.springapp.model.admin;

import org.sp.springapp.domain.Admin;

public interface AdminDAO {
	
	public Admin login(Admin admin); //로그인으로 입력값을 가지고 가야 하기 때문에 반환형 Admin형 명시
	
}

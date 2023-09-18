package org.sp.springapp.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.sp.springapp.domain.Admin;
import org.sp.springapp.exception.AdminException;
import org.sp.springapp.model.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService; //bean태그를 이용해 메모리에 올리지 않으면 null 상태
	
	//로그인 폼 요청처리
	@GetMapping("/signup")
	public ModelAndView loginform() {
		ModelAndView mav = new ModelAndView("admin/signup");
		
		return mav;
	}

	//관리자 메인 요청 처리
	@GetMapping("/main")
	public ModelAndView getMain() {
		ModelAndView mav = new ModelAndView("admin/index");
		return mav;
	}
	
	//로그인 요청 처리
	@PostMapping("/login")
	public ModelAndView login(Admin admin, HttpServletRequest request) {
		//3단계: 일치하는 관리자가 있는지 조회
		Admin dto = adminService.login(admin);
		
		//4단계: 일치하는 관리자가 있다면, 세션에 DTO를 담아서 서비스해준다
		HttpSession session=request.getSession();
		session.setAttribute("admin", dto);
		
		ModelAndView mav = new ModelAndView("redirect:/admin/main");
		
		return mav;
	}
	
	@PostMapping("/signup")
	public String signup(Admin admin, HttpServletRequest request) throws AdminException{
		adminService.signup(admin);
		System.out.println(admin.getAdmin_idx());
		System.out.println(admin.getId());
		System.out.println(admin.getName());
		
		//return "redirect:/admin/singup";
		
		return "admin/signup";
	}
	
	@ExceptionHandler(AdminException.class)
	public ModelAndView handle(AdminException e) {
		ModelAndView mav = new ModelAndView("error/result");
		mav.addObject("e", e);
		
		return mav;
	}
}

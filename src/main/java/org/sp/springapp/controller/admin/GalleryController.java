package org.sp.springapp.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.sp.springapp.domain.Gallery;
import org.sp.springapp.model.gallery.GalleryService;
import org.sp.springapp.util.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

//관리자 모드에서 갤러리와 관련된 요청을 처리하는 컨트롤러
@Controller
public class GalleryController {

	@Autowired
	private GalleryService galleryService;
	
	@Autowired
	private Pager pager;
	
	//갤러리 목록 요청 처리
	@GetMapping("/gallery/list")
	public ModelAndView getList(HttpServletRequest request) {
		
		//3단계: 모든 레코드 가져오기
		List galleryList = galleryService.selectAll();
		
		//4단계: 저장
		pager.init(galleryList, request);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("galleryList", galleryList); //View에 가져갈 데이터 변수명은 동일하게.
		mav.addObject("pager", pager);
		mav.setViewName("admin/gallery/list"); //접두어는 views/ 까지
		
		return mav;
	}
	
	//상세보기 요청 처리
	@GetMapping("/content")
	public ModelAndView getContent(int gallery_idx) {
		//3단계: 데이터 가져오기
		Gallery gallery = galleryService.select(gallery_idx);
		
		//4단계: 가져온 레코드 저장(jsp view로 가져가기 위해서)
		ModelAndView mav = new ModelAndView();
		mav.addObject("gallery", gallery);
		mav.setViewName("admin/content");
		
		return mav;
	}
}

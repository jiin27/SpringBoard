package org.sp.springapp.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Gallery {

	private int gallery_idx;
	private String title;
	private String writer;
	private String regdate;
	private int hit;
	private String content;
	
	//바이너리 파일을 받을 수 있는 자료형
	MultipartFile[] photo;
	
	//부모 테이블은 자식 테이블을 여럿 보유할 수 있다 → collection 개념 → List<자식DTO 형>로 보유!
	List<GalleryImg> galleryImgList; 
}

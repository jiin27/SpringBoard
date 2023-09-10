package org.sp.springapp.model.gallery;

import java.util.List;

import org.sp.springapp.domain.Gallery;
import org.sp.springapp.domain.GalleryImg;
import org.sp.springapp.exception.GalleryException;
import org.sp.springapp.exception.GalleryImgException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
//서비스 인터페이스를 구현한 하위 서비스 객체
public class GalleryServiceImpl implements GalleryService{

	//DAO는 Service에서 보유해야 한다. Model 영역의 업무이므로.
	//따라서 2개 이상의 테이블에 대한 DML에 있어 트랜잭션 처리도 Service 객체의 몫이다.
	@Autowired
	private GalleryDAO galleryDAO;
	
	@Autowired
	private GalleryImgDAO galleryImgDAO;
	
	//DAO로부터 전달받은 예외 객체는 service가 방치하지 말고 controller까지 전달해줘야
	//웹브라우저인 클라이언트에게 적절한 에러 화면을 제공할 수 있다.
	public void regist(Gallery gallery) throws GalleryException, GalleryImgException{
		//두 개의 DAO를 이용하여 글 등록 업무처리
		galleryDAO.insert(gallery); //mybatis 에 의해 gallery_idx 채워진다
		
		List<GalleryImg> imgList=gallery.getGalleryImgList();
		
		for(int i=0;i<gallery.getGalleryImgList().size(); i++ ) {
			GalleryImg galleryImg = imgList.get(i);
			galleryImgDAO.insert(galleryImg); //galleryImg 테이블에 inserts
		} 
	}

	@Override
	public List selectAll() {
		return galleryDAO.selectAll();
	}

	@Override
	public Gallery select(int gallery_idx) {
		return galleryDAO.select(gallery_idx);
	}

	@Override
	public void update(Gallery gallery) {
		
	}

	@Override
	public void delete(int gallery_idx) throws GalleryException, GalleryImgException{
		//galleryImg 삭제
		galleryImgDAO.deleteByGalleryIdx(gallery_idx);
		
		//gallery 삭제
		galleryDAO.delete(gallery_idx);
		
	}

}

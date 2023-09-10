package org.sp.springapp.model.gallery;

import java.util.List;

import org.sp.springapp.domain.Gallery;

public interface GalleryDAO {
	//CRUD
	public void insert(Gallery gallery);
	public List selectAll();
	public Gallery select(int gallery_idx); //한 건 조회 primary key 사용
	public void update(Gallery gallery);
	public void delete(int gallery_idx); //한 건 삭제 primary key 사용
}

package org.sp.springapp.exception;

//나만의 예외 객체 정의하기
public class GalleryException extends RuntimeException{
	
	//Throwable은 예외의 최상위 객체다 -> 예외의 원인을 전달할 때 사용
	public GalleryException(String msg) {
		super(msg);
	}
	
	public GalleryException(String msg, Throwable e) {
		super(msg, e);
	}
}

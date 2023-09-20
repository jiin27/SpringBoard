<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="org.sp.springapp.domain.Admin"%>
<%@page import="org.sp.springapp.domain.GalleryImg"%>
<%@page import="org.sp.springapp.domain.Gallery"%>
<%@page import="java.util.List"%>
<%@page import="org.sp.springapp.util.Pager"%>
<%
	Pager pager = (Pager)request.getAttribute("pager");
	Admin admin=(Admin)session.getAttribute("admin");
	List<Gallery> galleryList=(List)request.getAttribute("galleryList");
%>
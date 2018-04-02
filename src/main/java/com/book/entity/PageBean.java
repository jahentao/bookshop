package com.book.entity;

import java.util.List;
import java.util.Map;

public class PageBean<T>{
	//当前页
	private int page;
	//每页多少行
	private int pageCount=5;
	//总共多少行
	private int tolCount; 
	//总共多少页
	private int tolPage;
	//数据
	private List<T> pageDate;
	//存放查询条件 
	private Map<String,Object> map;
	//查询起始行
	private int beginCount;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTolCount() {
		return tolCount;
	}
	public void setTolCount(int tolCount) {
		this.tolCount = tolCount;
	}
	public int getTolPage() {
		if(tolCount%pageCount==0){
			tolPage=tolCount/pageCount;
		}else{
			tolPage=tolCount/pageCount+1;
		}
		return tolPage;
	}
	public void setTolPage(int tolPage) {
		this.tolPage = tolPage;
	}
	public List<T> getPageDate() {
		return pageDate;
	}
	public void setPageDate(List<T> pageDate) {
		this.pageDate = pageDate;
	}
	public Map<String, Object> getMap() {
		return map;
	}
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
	public int getBeginCount() {
		beginCount=(page-1)*pageCount;
		return beginCount;
	}
	public void setBeginCount(int beginCount) {
		this.beginCount = beginCount;
	}
}

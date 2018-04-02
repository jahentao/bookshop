package com.book.service.admin;

import java.util.List;

import com.book.entity.Admin;
import com.book.entity.PageBean;

public interface AdminService {
	public void addAdmin(Admin admin);
	public Admin login(Admin admin);
	//获取总共多少条记录
	public int getCount();
	//获取分页数据
	public List<Admin> getListByPage(PageBean<Admin> page);
	public PageBean<Admin> getListPage(PageBean<Admin> page);
	public void deleteById(int id);
	public Admin getById(int id);
	public void update(Admin admin);
}

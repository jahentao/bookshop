package com.book.service.admin.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.book.dao.AdminDao;
import com.book.entity.Admin;
import com.book.entity.PageBean;
import com.book.service.admin.AdminService;
@Service
public class AdminServiceImpl implements AdminService{
    @Resource
    private AdminDao  adminDao;
	public void addAdmin(Admin admin) {
		// TODO Auto-generated method stub
		adminDao.insert(admin);
	}
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.login(admin);
	}
	public int getCount() {
		// TODO Auto-generated method stub
		return adminDao.getCount();
	}
	public List<Admin> getListByPage(PageBean<Admin> page) {
		// TODO Auto-generated method stub
		return adminDao.getListByPage(page);
	}
	public PageBean<Admin> getListPage(PageBean<Admin> page) {
		// TODO Auto-generated method stub
		int count=this.getCount();
		List<Admin> list=this.getListByPage(page);
		page.setTolCount(count);
		page.setPageDate(list);
		return page;
	}
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		 adminDao.deleteById(id);
	}
	public Admin getById(int id) {
		// TODO Auto-generated method stub
		return adminDao.getById(id);
	}
	public void update(Admin admin) {
		// TODO Auto-generated method stub
		adminDao.update(admin);
	}

}

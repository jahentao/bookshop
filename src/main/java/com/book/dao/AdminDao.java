package com.book.dao;

import java.util.List;

import com.book.entity.Admin;
import com.book.entity.PageBean;

public interface AdminDao {
	public void insert(Admin admin);
	public Admin login(Admin admin);
	public int getCount();
	public List<Admin> getListByPage(PageBean<Admin> page);
    public void deleteById(int id);
    public Admin getById(int id);
    public void update(Admin admin);

}

package com.book.dao;

import java.util.List;
import java.util.Map;

import com.book.entity.Book;
import com.book.entity.PageBean;

public interface BookDao {
	public int insert(Book book);
	public int getCount(Map map);
	public List<Book> getBookList(PageBean<Book> page);
	public void delete(int id);
	public Book selectById(int id);
	public void update(Book book);
	public int getCountByTypeId(int typeid);
}

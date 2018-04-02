package com.book.dao;

import java.util.List;

import com.book.entity.BookType;
import com.book.entity.PageBean;

public interface BookTypeDao {
	public int insert(BookType bookType);
	public int getCount();
	public List<BookType> getList(PageBean<BookType> page);
	public void deleteById(int id);
	public BookType getBookTypeById(int id);
	public void update(BookType bt);
	public List<BookType> getAll();
}

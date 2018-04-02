package com.book.service.book;

import java.util.List;
import java.util.Map;

import com.book.entity.Book;
import com.book.entity.PageBean;

public interface BookService {
	public int addBook(Book book);
	public int getCount(Map map);
	public List<Book> getBookList(PageBean<Book> page);
	public PageBean<Book> getBookPage(PageBean<Book> page);
	public void delete(int id);
	public Book getBookById(int id);
	public void editBook(Book book);
	public int getCountByTypeId(int typeid);
}

package com.book.service.book.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.book.dao.BookDao;
import com.book.entity.Book;
import com.book.entity.BookType;
import com.book.entity.PageBean;
import com.book.service.book.BookService;
import com.book.service.booktype.BookTypeService;
@Service
public class BookServiceImpl implements BookService{
	@Resource
	private BookDao bookDao;
	@Resource
	private BookTypeService btc;
	public int addBook(Book book) {
		// TODO Auto-generated method stub
		return bookDao.insert(book);
	}
	public int getCount(Map map) {
		// TODO Auto-generated method stub
		return bookDao.getCount(map);
	}
	public List<Book> getBookList(PageBean<Book> page) {
	    return bookDao.getBookList(page);
	}
	public PageBean<Book> getBookPage(PageBean<Book> page) {
		// TODO Auto-generated method stub
		int count=this.getCount(page.getMap());
		page.setTolCount(count);
		List<Book> list =new ArrayList<Book>();
		list=this.getBookList(page);
		page.setPageDate(list);
		return page;
	}
	public void delete(int id) {
		// TODO Auto-generated method stub
		bookDao.delete(id);
	}
	public Book getBookById(int id) {
		// TODO Auto-generated method stub
		return bookDao.selectById(id);
	}
	public void editBook(Book book) {
		// TODO Auto-generated method stub
		bookDao.update(book);
	}
	public int getCountByTypeId(int typeid) {
		// TODO Auto-generated method stub
		return bookDao.getCountByTypeId(typeid);
	}

}

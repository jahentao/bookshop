package com.book.service.booktype.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.book.dao.BookTypeDao;
import com.book.entity.BookType;
import com.book.entity.PageBean;
import com.book.service.booktype.BookTypeService;
@Service
public class BookTypeServiceImpl implements BookTypeService{
	@Resource
	private BookTypeDao bookTypeDao;
	public int addBookType(BookType bookType) {
		// TODO Auto-generated method stub
		return bookTypeDao.insert(bookType);
	}
	public int getCount() {
		// TODO Auto-generated method stub
		return bookTypeDao.getCount();
	}
	public List<BookType> getList(PageBean<BookType> page) {
		// TODO Auto-generated method stub
		return bookTypeDao.getList(page);
	}
	public PageBean<BookType> getPage(PageBean<BookType> page) {
		// TODO Auto-generated method stub
		int count=this.getCount();
		page.setTolCount(count);
		List<BookType> list=this.getList(page);
		page.setPageDate(list);
		return page;
	}
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		bookTypeDao.deleteById(id);
	}
	public BookType getBookTypeById(int id) {
		// TODO Auto-generated method stub
		return bookTypeDao.getBookTypeById(id);
	}
	public void updateBookTypeById(BookType bt) {
		// TODO Auto-generated method stub
		bookTypeDao.update(bt);
	}
	public List<BookType> getAll() {
		// TODO Auto-generated method stub
		return bookTypeDao.getAll();
	}


}

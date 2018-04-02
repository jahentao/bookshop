package com.book.service.booktype;

import java.util.List;

import com.book.entity.BookType;
import com.book.entity.PageBean;

public interface BookTypeService {
	public int addBookType(BookType bookType);
	public int getCount();
	public List<BookType> getList(PageBean<BookType> page);
	public PageBean<BookType> getPage(PageBean<BookType> page);
	public void deleteById(int id);
	public BookType getBookTypeById(int id);
	public void updateBookTypeById(BookType bt);
	public List<BookType> getAll();
}

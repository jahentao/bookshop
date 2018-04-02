package com.book.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.book.entity.Book;
import com.book.entity.BookType;
import com.book.entity.JsResult;
import com.book.entity.PageBean;
import com.book.service.book.BookService;
import com.book.service.booktype.BookTypeService;

@Controller
@RequestMapping("book")
public class BookController {
	@Resource
	private BookTypeService btService;
	@Resource
	private BookService  bookService;
	@RequestMapping("toAdd")
	public ModelAndView toAdd(ModelAndView mv,HttpServletRequest request,HttpServletResponse response){
		List<BookType> list =new ArrayList<BookType>();
		list=btService.getAll();
		mv.addObject("list", list);
		mv.setViewName("jsp/book/add");
		return mv;
	}
	@RequestMapping("fileUpLoad")
	@ResponseBody
	public JsResult fileUpLoad(@RequestParam MultipartFile file,HttpServletRequest request,HttpServletResponse response){
		JsResult result =new JsResult();
		try {
			String name=file.getOriginalFilename();
			String lastName=name.substring(name.indexOf("."),name.length());
			name=System.currentTimeMillis()+lastName;
			String path=request.getSession().getServletContext().getRealPath("/");
			path=path.substring(0,path.indexOf("bookshop"))+"img"+File.separator+name;
			file.transferTo(new File(path));
			result.setCode(0);
			result.setStatus(JsResult.SUCCESS);
			result.setMsg("操作成功");
			result.setData(name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result.setCode(999);
			result.setStatus(JsResult.FAILED);
			result.setMsg("操作失败");
			e.printStackTrace();
		} 
		return result;
	}
	@RequestMapping("add")
	public ModelAndView add(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,Book book){
		bookService.addBook(book);
		mv.setViewName("jsp/book/list");
		return mv;
	}
	@RequestMapping("toList")
	public ModelAndView toList(ModelAndView mv,HttpServletRequest request,HttpServletResponse response){
		List<BookType> list =new ArrayList<BookType>();
		list=btService.getAll();
		mv.addObject("list", list);
		mv.setViewName("jsp/book/list");
		return mv;
	}
	@RequestMapping("getList")
	@ResponseBody
    public JsResult getList(HttpServletRequest request,HttpServletResponse response,int page,String name,String typeid){
	   JsResult result= new JsResult();
	   try{
		   PageBean<Book> pageBean =new PageBean<Book>();
		   Map <String,Object> map =new HashMap<String,Object>();
		   map.put("name",name);
		   if(!"".equals(typeid)&&typeid!=null){
			   map.put("typeid", Integer.parseInt(typeid));
		   }
		   pageBean.setPage(page);
		   map.put("typeid", typeid);
		   pageBean.setMap(map);
		   pageBean=bookService.getBookPage(pageBean);
		   result.setCode(0);
		   result.setData(pageBean);
		   result.setStatus(JsResult.SUCCESS);
		   result.setMsg("操作成功");
	   }catch(Exception e){
		   result.setCode(999);
		   result.setMsg("操作失败");
		   result.setStatus(JsResult.FAILED);
		   e.printStackTrace();
	   }
	   return result;
   }
	@RequestMapping("deletes")
	public ModelAndView deletes(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,String ids){
		if(ids!=null&&!"".equals(ids)){
			String id[]=ids.split(",");
			for(int i=0;i<id.length;i++){
				bookService.delete(Integer.parseInt(id[i]));
			}
		}
		mv.setViewName("jsp/book/list");
		return mv;
	}
	
	@RequestMapping("delete")
	public ModelAndView delete(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,int id){
	    bookService.delete(id);
		mv.setViewName("jsp/book/list");
		return mv;
	}
	@RequestMapping("toEdit")
	public ModelAndView toEdit(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,int id){
		Book book=new Book();
		book=bookService.getBookById(id);
		List<BookType> list =new ArrayList<BookType>();
		list=btService.getAll();
		mv.addObject("list", list);
		mv.addObject("book", book);
		mv.addObject("id",id);
		mv.setViewName("jsp/book/edit");
		return mv;
	}
	@RequestMapping("edit")
	public ModelAndView edit(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,Book book){
		List<BookType> list =new ArrayList<BookType>();
		list=btService.getAll();
		mv.addObject("list", list);
		bookService.editBook(book);
		mv.setViewName("jsp/book/list");
		return mv;
	}
	@RequestMapping("getBookCountByTypeId")
	@ResponseBody
	public JsResult getBookCountByTypeId(HttpServletRequest request,HttpServletResponse response,int typeid){
		JsResult  result= new JsResult();
		try{
			int count=0;
			count=bookService.getCountByTypeId(typeid);
			result.setData(0);
			result.setData(count);
			result.setMsg("操作成功");
			result.setStatus(JsResult.SUCCESS);
		}catch(Exception e){
			result.setData(999);
			result.setMsg("失败");
			result.setStatus(JsResult.FAILED);
			e.printStackTrace();
		}
		return result;
	}
	
	
}

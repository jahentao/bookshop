package com.book.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.book.entity.BookType;
import com.book.entity.JsResult;
import com.book.entity.PageBean;
import com.book.service.booktype.BookTypeService;

@Controller
@RequestMapping("bookType")
public class BookTypeController {
	@Resource
	private BookTypeService bookTypeService;
	@RequestMapping("toAdd")
	public ModelAndView toAdd(ModelAndView mv,HttpServletRequest request,HttpServletResponse response){
		mv.setViewName("jsp/booktype/add");
		return mv;
	}
	@RequestMapping("addBook")
	public ModelAndView addBook(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,BookType bookType){
		bookTypeService.addBookType(bookType);
		mv.setViewName("jsp/booktype/list");
		return mv;
	}
	@RequestMapping("toList")
	public ModelAndView toList(ModelAndView mv,HttpServletRequest request,HttpServletResponse response){
		mv.setViewName("jsp/booktype/list");
		return mv;
	}
	
	@RequestMapping("getList")
	@ResponseBody
	public JsResult getList(HttpServletRequest request,HttpServletResponse response,int page){
		JsResult result =new JsResult();
		try{
			PageBean<BookType> pages=new PageBean<BookType>();
			pages.setPage(page);
			pages=bookTypeService.getPage(pages);
			result.setData(pages);
			result.setCode(0);
			result.setMsg("操作成功");
			result.setStatus(JsResult.SUCCESS);
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
		String []id=ids.split(",");
		for(int i=0;i<id.length;i++){
			bookTypeService.deleteById(Integer.parseInt(id[i]));
			try {
				Thread.sleep(10);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 mv.setViewName("jsp/booktype/list");
		return mv;
	}
	@RequestMapping("delete")
	public ModelAndView delete(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,int id){
		 bookTypeService.deleteById(id);
		 mv.setViewName("jsp/booktype/list");
		 return mv;
	}
	@RequestMapping("toEdit")
	public ModelAndView toEdit(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,int id){
		BookType  bt =new BookType();
		bt=bookTypeService.getBookTypeById(id);
		mv.addObject("bookType", bt);
		mv.setViewName("jsp/booktype/edit");
		return mv;
	}
	@RequestMapping("edit")
	public ModelAndView edit(ModelAndView mv,HttpServletRequest reuqest,HttpServletResponse response,BookType bookType){
		bookTypeService.updateBookTypeById(bookType);
		mv.setViewName("jsp/booktype/list");
		return mv;
	}

}

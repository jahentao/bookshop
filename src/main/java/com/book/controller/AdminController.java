package com.book.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.book.entity.Admin;
import com.book.entity.JsResult;
import com.book.entity.PageBean;
import com.book.service.admin.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Resource
	private AdminService adminService;
	@RequestMapping("login")
	public ModelAndView login(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,String name,String pwd){
		Admin ad=new Admin();
		ad.setName(name);
		ad.setPwd(pwd);
		Admin rs=adminService.login(ad);
		if(rs!=null){
			mv.setViewName("index");
		}else{
			mv.addObject("fail", "用户名或者密码不正确！");
			mv.setViewName("login");
		}
		return mv;
	}
	@RequestMapping("getList")
	@ResponseBody
	public JsResult getList(HttpServletRequest request,HttpServletResponse response,int page){
		JsResult result =new JsResult();
		try{
			PageBean<Admin> pageBean=new PageBean<Admin>();
			pageBean.setPage(page);
			pageBean=adminService.getListPage(pageBean);
			result.setCode(0);
			result.setMsg("操作成功");
			result.setStatus(JsResult.SUCCESS);
			result.setData(pageBean);
		}catch(Exception e){
			result.setCode(999);
			result.setMsg("操作失败 ");
			result.setStatus(JsResult.FAILED);
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping("deleteAdminById")
	public ModelAndView deleteAdminById(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,int id){
		System.out.println("****"+id);
		adminService.deleteById(id);
		mv.setViewName("jsp/admin/list");
		return mv;
	}
	@RequestMapping("deleteAdminByIds")
	@ResponseBody
	public JsResult<String> deleteAdminByIds(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,String id){
		JsResult<String> result =new JsResult<String>();
		try{
			String [] strs=id.split(",");
			for(int i=0;i<strs.length;i++){
				adminService.deleteById(Integer.parseInt(strs[i]));
				Thread.sleep(100);
			}
			result.setCode(0);
			result.setMsg("操作成功");
			result.setStatus(JsResult.SUCCESS);
		}catch(Exception e){
			result.setCode(1001);
			result.setMsg("操作失败");
			result.setStatus(JsResult.FAILED);
			e.printStackTrace();
		}
		return result;
	}
	//跳转分页页面
	@RequestMapping("toList")
	public ModelAndView toList(ModelAndView mv,HttpServletRequest request,HttpServletResponse response){
		mv.setViewName("jsp/admin/list");
		return mv;
	}
	@RequestMapping("toAdd")
	public ModelAndView toAdd(ModelAndView mv,HttpServletRequest request,HttpServletResponse response){
		mv.setViewName("jsp/admin/add");
		return mv;
	}
	@RequestMapping("add")
	public ModelAndView add(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,Admin admin){
		mv.setViewName("jsp/admin/list");
		adminService.addAdmin(admin);
		return mv;
	}
	@RequestMapping("toEdit")
	public ModelAndView toEdit(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,int id){
	    Admin ad=adminService.getById(id);
	    mv.addObject("admin", ad);
		mv.setViewName("jsp/admin/edit");
		return mv;
	}
	
	@RequestMapping("edit")
	public ModelAndView edit(ModelAndView mv,HttpServletRequest request,HttpServletResponse response,Admin admin){
		adminService.update(admin);
		mv.setViewName("jsp/admin/list");
		return mv;
	}
}

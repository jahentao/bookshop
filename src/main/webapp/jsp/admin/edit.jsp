<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${basePath}css/pintuer.css">
    <link rel="stylesheet" href="${basePath}css/admin.css">
    <script src="${basePath}js/jquery.js"></script>
    <script src="${basePath}js/pintuer.js"></script> 
    <script src="${basePath}js/admin.js"></script>  
  </head>
  
  <body>
    <div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 添加管理员</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="admin/edit.do">
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员帐号：</label>
        </div>
        <div class="field">
             <input type="hidden" name="id" value="${admin.id}" />
             <input type="text" name="name" id="name" value="${admin.name}" placeholder="请输入用户名" class="input w50"/>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">密码：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" id="pwd" name="pwd" size="50" placeholder="请输入密码" data-validate="required:请输入原始密码" value="${admin.pwd}"/>       
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">性别：</label>
        </div>
        <div class="field" style="padding-top:8px;">
        <c:choose>
          <c:when test="${admin.sex==1}">
           <input type="radio"  name="sex"  value="1" checked="checked"/>男      
          <input type="radio"  name="sex"  value="2"/>女       
          </c:when>
          <c:otherwise>
          <input type="radio"  name="sex"  value="1" />男      
          <input type="radio"  name="sex"  value="2" checked="checked"/>女       
          </c:otherwise>
        </c:choose>
         
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${admin.email}" name="email" size="50" placeholder="请输入邮箱" data-validate="required:请输入邮箱" />          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>   
        </div>
      </div>      
  </body>
</html>

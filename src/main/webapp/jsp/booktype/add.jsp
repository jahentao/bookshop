<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <script src="${basePath}js/bookType.js"></script>  

  </head>
  
    <body>
  <div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 添加图书类型</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="bookType/addBook.do">
      <div class="form-group">
        <div class="label">
          <label for="sitename">图书名称：</label>
        </div>
        <div class="field">
             <input type="text" name="name" id="name" placeholder="请输入图书类型名称" class="input w50"/>
        </div>
      </div>         
      <div class="form-group">
        <div class="label">
          <label for="sitename">状态：</label>
        </div>
        <div class="field" style="padding-top:8px;">
          <input type="radio"  name="status"  value="1" checked="checked"/>可用      
          <input type="radio"  name="status"  value="2"/>禁用      
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">类型描述：</label>
        </div>
        <div class="field">
          <textarea rows="6" cols="50" id="detail" name="detail"></textarea>
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

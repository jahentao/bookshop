<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
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
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">图书类型管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search">
        <li>
          <button type="button" class="button border-yellow" onclick="window.location.href='bookType/toAdd.do'"><span class="icon-plus-square-o"></span> 添加内容</button>
          <button type="button" id="dels" onclick="deletes()" class="button border-red"><span class="icon-trash-o"></span> 批量删除</button>
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
       <tr>
      <td>
         <input type="checkbox" id="all">
      </td>
      <td>
                       类型名称
      </td>
       <td>
                        状态
      </td>
       <td>
                       描述
      </td>
        <td>
                    操作
      </td>
      </tr>
      <tbody id="bookTypeShow">
      </tbody>
    </table>
  </div>
                 <div style="margin-left: 550px;margin-top: 12px;">
					<input type="button" value="首页" id="first" />
					<input type="button" value="上一页" id="before" />
					<input type="button" value="下一页" id="next" />
					<input type="button" value="尾页" id="last" />
					当前页：
					<input type="text" id="page" style="width: 25px;" />
					总页：
					<input type="text" id="tolPage" style="width: 25px;" />
				</div>
</form>
<script type="text/javascript">
 getList(1);
</script>
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<script src="${basePath}js/book.js"></script>

	</head>
	<body>
	<input type="hidden" id="basepath" value="<%=basePath%>">
		<form method="post" action="">
			<div class="panel admin-panel">
				<div class="panel-head">
					<strong class="icon-reorder">图书管理</strong>
				</div>
				<div class="padding border-bottom">
					<ul class="search">
						<li>
							 <button type="button" class="button border-yellow" onclick="window.location.href='book/toAdd.do'"><span class="icon-plus-square-o"></span> 添加内容</button>
								
							</button>
							<button type="button" id="dels" onclick="deletes();" class="button border-red">
								<span class="icon-trash-o"></span> 批量删除
							</button>
						</li>
						<li>
							<select name="seachTypeid" id="seachTypeid" class="input"
								style="width: 200px; line-height: 17px;" onchange="">
								<option value="">
									请选择分类
								</option>
								<c:forEach items="${list}" var="bookType">
									<option value="${bookType.id}">
										${bookType.name}
									</option>
								</c:forEach>
							</select>
						</li>
						<li>
							<input type="text" placeholder="请输入搜索关键字" name="seachName" id="seachName"
								class="input"
								style="width: 250px; line-height: 17px; display: inline-block" />
							<a href="javascript:void(0)"
								class="button border-main icon-search" onclick="getList(1);">
								搜索</a>
						</li>
					</ul>
				</div>

				<table class="table table-hover text-center">
					<tr>
						<td>
							<input type="checkbox" id="all">
						</td>
						<td>
							书名
						</td>
						<td>
							所属类型
						</td>
						<td>
							图片
						</td>
						<td>
							作者
						</td>
						<td>
							价格
						</td>
						<td>
							操作
						</td>
					</tr>
					<tbody id="bookShow">
					</tbody>
				</table>
			</div>
			<div style="margin-left: 550px; margin-top: 12px;">
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

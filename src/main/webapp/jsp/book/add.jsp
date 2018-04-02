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
		<script src="${basePath}js/book.js"></script>
		<script src="${basePath}js/ajaxfileupload.js"></script>
	</head>

	<body>
	<input type="hidden" id="basepath" value="<%=basePath%>">
		<div class="panel admin-panel">
			<div class="panel-head" id="add">
				<strong><span class="icon-pencil-square-o"></span>增加图书</strong>
			</div>
			<div class="body-content">
				<form method="post" class="form-x" action="book/add.do">
					<div class="form-group">
						<div class="label">
							<label>
								图书名称：
							</label>
						</div>
						<div class="field">
							<input type="text" class="input w50" value="" name="name"
								data-validate="required:请输入图书名称" />
						   <input type="hidden" id="picture" name="picture">
							<div class="tips"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>
								作者：
							</label>
						</div>
						<div class="field">
							<input type="text" class="input w50" name="author" value="" />
							<div class="tips"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="label">
							<label>
								价格：
							</label>
						</div>
						<div class="field">
							<input type="text" class="input w50" name="price" value=""
								data-validate="member:只能为数字" />
							<div class="tips"></div>
						</div>
					</div>
					<div class="form-group">
          <div class="label">
            <label>书籍类型：</label>
          </div>
          <div class="field">
            <select name="bookType.id" id="bookType.id" class="input w50">
              <option value="0">请选择分类</option>
              <c:forEach items="${list}" var="bookType">
                  <option value="${bookType.id}">${bookType.name}</option>
              </c:forEach>
            </select>
            <div class="tips"></div>
          </div>
        </div>
					<div class="form-group">
						<div class="label">
							<label>
								图片：
							</label>
						</div>

						<div class="field">
							<div id="imgshow">
								<img  src="" id="img" width="80px" height="120px">
							</div>
							<input type="file" name="file" id="file"  style="width: 25%; float: left;" />
							<input type="button" class="button bg-blue margin-left"
							onclick="addPicture()"	id="image1" value="+ 浏览上传" style="float: left;">

						</div>
					</div>

					<div class="form-group">
						<div class="label">
							<label>
								描述：
							</label>
						</div>
						<div class="field">
							<textarea class="input" name="detail" style="height: 90px;"></textarea>
							<div class="tips"></div>
						</div>
					</div>


					<div class="form-group">
						<div class="label">
							<label></label>
						</div>
						<div class="field">
							<button class="button bg-main icon-check-square-o" type="submit">
								提交
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>

	</body>
</html>

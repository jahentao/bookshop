function addPicture(){
	var basepath=$("#basepath").val();
	basepath=basepath.replace("bookshop","img");

  	$.ajaxFileUpload({
  		url:"book/fileUpLoad.do",
  		secureuri: false,
  		fileElementId: "file",
  		dataType: "json",
  		success: function(data,status){
  		var result=JSON.parse(data);
  		$("#picture").val(result.data);
  		var path=basepath+result.data;
  		$("#img").attr("src",path);
		},
		error:function(data,status,e){
			
		}
  	});
  }



function getList(page){
 	var name=$("#seachName").val();
 	var typeid=$("#seachTypeid").val();
 	$.ajax({
 		type:"post",
 		url:"book/getList.do",
 		async:true,
 		dataType:"json",
 		data:{page:page,name:name,typeid:typeid},
 		success:function(data){
 			var str="";
 			if(data.data.pageDate!=null){
 				var basepath=$("#basepath").val();
 				basepath=basepath.replace("bookshop","img");
 				$.each(data.data.pageDate,function(index,item){
 					var imgpath=basepath+item.picture;
 					str=str+"<tr>"
 				           +"<td><input type='checkbox' id='cid' name='cid' value='"+item.id+"'/></td>"
 				           +"<td>"+item.name+"</td>"
 				           +"<td>"+item.bookType.name+"</td>"
 				           +"<td><img src='"+imgpath+"' width='40px' height='60px'></td>"
 				           +"<td>"+item.author+"</td>"
 				           +"<td>￥"+item.price+"</td>"
 				           +"<td><div class='button-group'>"
 				           +"<a class='button border-main' href='javascript:void(0)' onclick='return toEdit("+item.id+")'><span class='icon-edit'></span> 修改</a>"
						   +"<a class='button border-red' href='javascript:void(0)' onclick='return del("+item.id+")'><span class='icon-trash-o'></span> 删除</a> "
 				           +"</div></td>"
 					       +"</tr>"
 				});
 				$("#bookShow").html(str);
 				$("#tolPage").val(data.data.tolPage);
				$("#page").val(data.data.page);
 			}
 		},error:function (data) {
 			
 		}
 	});
 }

$(document).ready(function() {
	$("#all").click(function() {
		var all = $("#all").is(":checked");
		var ches = $("[name='cid']");
		$.each(ches, function(index, items) {
			$(items).attr("checked", all);
		});
	});
	$("#first").click(function(){
		 getList(1);
	});
	
	$("#before").click(function(){
		var page=$("#page").val();
		if(page<=1){
			page=1;
		}else{
			page=page-1;
		}
		getList(page);
	});
	$("#next").click(function(){
		var page=$("#page").val();
		var tolPage=$("#tolPage").val();
		if(page>=tolPage){
			page=tolPage;
		}else{
			page=parseInt(page)+1;
		}
		getList(page);
	});
	
	$("#last").click(function(){
		var tolPage=$("#tolPage").val();
		 getList(tolPage);
	});
	
});


function deletes(){
	var ids="";
	var ches = $("[name='cid']:checked");
	if(ches.length<1){
		alert("请选择要删除的数据");
		return false;
	}
	$.each(ches,function(index,item){
		ids=ids+$(item).val()+","
	});
	ids=ids.substring(0,ids.length-1);
	window.location.href="book/deletes.do?ids="+ids;
}


function del(id){
	window.location.href="book/delete.do?id="+id;
}

function toEdit(id){
	window.location.href="book/toEdit.do?id="+id;
}

function getBook(id){
	
}
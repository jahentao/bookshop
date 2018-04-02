

function getList(page) {
	$.ajax( {
				type : "post",
				url : "admin/getList.do",
				dataType : "json",
				data : {
					page : page
				},
				async : true,
				success : function(data) {
					var str;
					if (data.data != null) {
						if (data.data.pageDate != null) {
							str = "";
							$.each(data.data.pageDate,function(index, item) {
												str = str
														+ "<tr><td><input type='checkbox' name='cid' value='"
														+ item.id + "'/></td>"
														+ "<td>" + item.name
														+ "</td>" + "<td>"
														+ item.sex + "</td>"
														+ "<td>" + item.email
														+ "</td>"

														+"<td><div class='button-group'>"
														+"<a class='button border-main' href='javascript:void(0)' onclick='return toEdit("+item.id+")'><span class='icon-edit'></span> 修改</a>"
														+" <a class='button border-red' href='javascript:void(0)' onclick='return del("+item.id+")'><span class='icon-trash-o'></span> 删除</a> "
														+ "</div></td></tr>"

											});
						}
						$("#tolPage").val(data.data.tolPage);
						$("#page").val(data.data.page);
						$("#adminShow").html(str);
					}

				},
				error : function(data) {

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
	var ids=$("[name='cid']:checked");
	id="";
	if(ids.length<1){
		alert("请选择要删除的数据！");
		return false
	}else{
		$.each(ids,function(index,item){
			id=id+$(item).val()+",";
		});
		id=id.substring(0,id.length-1);
		$.ajax({
	    	type:"post",
	    	url:"admin/deleteAdminByIds.do",
	    	async:true,
	    	dataType:"json",
	    	data:{id:id},
	    	success:function(data){
	    	   alert(data.msg);
	    	   window.location.href="admin/toList.do";
	    	},
	    	error:function(){
	    		 alert(data.msg);
		    	  window.location.href="admin/toList.do";
	    	}
	    });
		
	}
}
















function DelSelect() {
	var Checkbox = false;
	$("input[name='id[]']").each(function() {
		if (this.checked == true) {
			Checkbox = true;
		}
	});
	if (Checkbox) {
		var t = confirm("您确认要删除选中的内容吗？");
		if (t == false)
			return false;
	} else {
		alert("请选择您要删除的内容!");
		return false;
	}
}



function del(id) {
	if (confirm("您确定要删除吗?")) {
		window.location.href="admin/deleteAdminById.do?id="+id;
	}
}

function toEdit(id){
	window.location.href="admin/toEdit.do?id="+id;
}
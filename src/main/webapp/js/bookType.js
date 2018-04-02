 

function getList(page){
		    $.ajax({
		    	type : "post",
		    	url : "bookType/getList.do",
		    	async : true,
		    	dataType : "json",
		    	data : { page : page },
		    	success : function(data){
		    		if(data.data!=null){
		    		   var dt="";
		    		   var sta="";
		    		   $.each(data.data.pageDate,function(index,item){
		    			   var detail;
		    			   if(item.detail.length>10){
		    				   detail=item.detail.substring(0,8)+"...";
		    			   }else{
		    				   detail=item.detail;
		    			   }
		    			   if(item.status==1){
		    				   sta="可用";
		    			   }else{
		    				   sta="禁用";
		    			   }
		    			   dt=dt+"<tr>"
		    			      +"<td><input name='cid' type='checkbox' value='"+item.id+"'/></td>"
		    			      +"<td>"+item.name+"</td>"
		    			      +"<td>"+sta+"</td>"
		    			      +"<td>"+detail+"</td>"
		    			      +"<td><div class='button-group'>"
		    			      +"<a class='button border-main' href='javascript:void(0)' onclick='return toEdit("+item.id+")'><span class='icon-edit'></span> 修改</a>"
		    			      +"<a class='button border-red' href='javascript:void(0)' onclick='return del("+item.id+")'><span class='icon-trash-o'></span> 删除</a>"
		    			      +"</div></td>"
		    			      +"</tr>"
		    		   });
		    		   $("#bookTypeShow").html(dt);
		    		   $("#page").val(data.data.page);
		    		   $("#tolPage").val(data.data.tolPage);
		    		}
		    	}
		    });
};

$(document).ready(function(){
	$("#all").click(function(){
		var all = $("#all").is(":checked");
		var ches = $("[name='cid']");
		$.each(ches,function(index,item){
			$(item).attr("checked", all);
		})
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
   		var tolPage= $("#tolPage").val();
   		if(page>=tolPage){
   			page=tolPage;
   		}else{
   			page=parseInt(page)+1;
   		}
   		getList(page);
   	});
   	$("#last").click(function(){
   		var page= $("#tolPage").val();
   		getList(page);
   	})
   });

function deletes(){
	var ids="";
	var ches = $("[name='cid']:checked");
	if(ches.length<1){
		alert("请选择要删除的数据");
		return false;
	}
	$.each(ches,function(insex,item){
		ids=ids+$(item).val()+","
	});
	ids=ids.substring(0,ids.length-1);
	window.location.href="bookType/deletes.do?ids="+ids;
}

function del(id){
	$.ajax({
		type : "post",
    	url : "book/getBookCountByTypeId.do",
    	async : true,
    	dataType : "json",
    	data : { typeid : id },
    	success : function(data){
    		if(data.data>0){
    			alert("类型被引用，不能删除！");
    		}
    		else{
    			window.location.href="bookType/delete.do?id="+id;
    		}
    	}
	});
	
}

function toEdit(id){
	window.location.href="bookType/toEdit.do?id="+id;
}

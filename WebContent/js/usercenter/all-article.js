$(function(){
	$(document).on('click','.delete-btn',function(){
		// 获取文章id
		var id = $(this).parents("td").find("input").val();
		var index = $(this).parents("tr").index();
		$("#mymodal").modal("toggle");
		$('.confirm').unbind("click");
		$(".confirm").click(function(){
			$.ajax({
				type:"post",
				url:"usercenter/delete-article",
				data:"id="+id,
				success:function(e){
					if(e>0){
						$("#body-box").find("tr").eq(index).remove();
					}
				}
			})
		})
	})
	$(document).on("click",".look-btn",function(){
		// 获取文章id
		var id = $(this).parents("td").find("input").val();
		window.open("portal/article/detail?id="+id);
	})
	$(".search").click(function(){
		var title = $(".search-input").val();
		$("#body-box").empty();
		$.ajax({
			type:"post",
			url:"usercenter/search-article",
			data:"title="+title,
			success:function(e){
				var json = eval("("+e+")");
				for(var i = 0;i<e.length;i++){
					var tr = '<tr>'+
					'<td>'+json[i].title+'</td>'+
					'<td>'+json[i].name+'</td>'+
					'<td>'+json[i].directory+'</td>'+
					'<td>'+json[i].discusses+'</td>'+
					'<td>'+json[i].date+'</td>'+
					'<td>'+json[i].views+'</td>'+
					'<td><input type="hidden" value="'+json[i].id+'">'+
					'		<button type="button" class="btn btn-primary delete-btn">删除</button>'+
					'		<button type="button" class="btn btn-primary look-btn">查看</button>'+
					'</td>'+
					'</tr>';
					$("#body-box").append(tr);
				}
			}
		})
	})
})
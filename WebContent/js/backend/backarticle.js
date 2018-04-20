$(function(){
	$(".look-btn").click(function(){
		var id = $(this).parents("td").parents("tr").find("td").eq(0).text();
		window.open("portal/article/detail?id="+id);
	})
	$(".delete-btn").click(function(){
		var index = $(this).parents("tr").index();
		var id = $(this).parents("td").parents("tr").find("td").eq(0).text();
		$("#mymodal").modal("toggle");
		$(".confirm").unbind("click");
		$(".confirm").click(function(){
			$.ajax({
				type:"post",
				url:"backend/delete-article",
				data:"id="+id,
				success:function(e){
					if (e > 0) {
						$("#body-box").find("tr").eq(index).remove();
					}
				}
			})
		})
	})
})
$(function(){
	$("#commit-comment").click(function(){
		var content = $(".comment-content").val();
		var aId = $("#hidden-article-id").val();
		if(content.trim()==""){
			$(".tip").text("评论不能为空");
		}else{
			$.ajax({
				type:"post",
				url:"portal/add-new-comment",
				data:"content="+content+"&aId="+aId,
				success:function(e){
					window.location.href="portal/article/detail?id="+aId;
				}
			});
		}
	})
})
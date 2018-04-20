$(function(){
	$.ajax({
		type:"post",
		url:"judge-login",
		success:function(e){
			if(e=="yes"){
				$("#btn-login").text("个人中心");
				$("#btn-login").attr("href","usercenter/main");
				$("#btn-register").text("");
			}
		}
	})
	$(".title").click(function(){
		var id = $(this).find("input").val();
		window.location.href="portal/article/detail?id="+id;
	})
})
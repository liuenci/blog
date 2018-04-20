$(function(){
	/**
	 * 查看站点
	 */
	$("#go-to-site").click(function(){
		window.open("myblog");
	})
	$("#nav-ol a li").click(function(){
		$("#nav-ol a li").css("background-color","#23282D");
		$(this).css("background-color","#4C535B");
	})
	$("#exit_btn").click(function(){
		 window.top.location.href = "backend/login";
	})
})
$(function(){
	/**
	 * 发布文章
	 */
	$("#release_id").click(function(){
		$("#write_article_form").submit();
	})
	/**
	 * 查看站点
	 */
	$("#go-to-site").click(function(){
		window.open("user/main");
	})
	/**
	 * 默认选中一个单选框
	 */
	$("input[name=a_type]:first").attr("checked","true");
})
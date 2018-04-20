$(function(){
	/**
	 * 默认选中一个单选框
	 */
	$("input[name=a_type]:first").attr("checked","true");
	/**
	 * 发布文章
	 */
	$("#release_id").click(function(){
		$("#write_article_form").submit();
	})
	/**
	 * 保存草稿
	 */
	$(".save_draft").click(function() {
		$("#write_article_form").attr("action", "usercenter/save-draft");
		$("#write_article_form").submit();
	})
})
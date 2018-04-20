$(function() {
	var id = $("#hidden-id").val();
	$("input[type=radio][value="+id+"]").attr("checked","true");
	
	// 获取草稿的 id
	var draftid = $("#draft-id").val();
	$.ajax({
		type : "post",
		url : "usercenter/get-tagid",
		data : "id=" + draftid,
		success : function(e) {
			var strs = e.split("/");
			for (var i = 0; i < strs.length; i++) {
				$("input[type=checkbox][value=" + strs[i] + "]").attr("checked", "checked");
			}

		}
	})
	/**
	 * 保存草稿
	 */
	$(".save_draft").click(function() {
		$("#write_article_form").attr("action", "usercenter/update-draft");
		$("#write_article_form").submit();
	})
	/**
	 * 发布草稿
	 */
	$(".release").click(function(){
		$("#write_article_form").attr("action", "usercenter/release-draft");
		$("#write_article_form").submit();
	})
	
})
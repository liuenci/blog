$(function() {
	/**
	 * 选中保存的单选框
	 */
	var id = $("#hidden-id").val();
	alert(id);
	$("input[value=" + id + "]").attr("checked", "true");
	// 获取草稿的 id
	var draftid = $("#draft-id").val();
	$.ajax({
		type : "post",
		url : "usercenter/get-tagid",
		data : "id=" + draftid,
		success : function(e) {
			var strs = e.split("/");
			for (var i = 0; i < strs.length; i++) {
				$("input[value=" + strs[i] + "]").attr("checked", "checked");
			}

		}
	})
	/**
	 * 选中保存的单选框
	 */
	var id = $("#hidden-id").val();
	$("input[value=" + id + "]").attr("checked", "true");
	/**
	 * 保存草稿
	 */
	$(".save_draft").click(function() {
		$("#write_article_form").attr("action", "usercenter/update-draft");
		$("#write_article_form").submit();
	})
})
/**
 * 添加标签脚本
 */
function addNewTag() {
	$("#add").submit();
}
$(function() {
	$(".deleteBtn").click(function() {
		// 获取标签序号
		var id = $(this).parents("td").find("input").val();
		$.ajax({
			type : "post",
			url : "usercenter/delete-tag",
			data : "id=" + id,
			success : function(e) {
				window.location = window.location;
			}
		})
	})
	$(".updateBtn").click(function() {
		var id = $(this).parents("td").find("input").val();
		var name = $(this).parents("td").parents("tr").find("td").eq(1).text();
		$("#tag-hidden-id").val(id);
		$("#tag-origin-name").val(name);
		$("#mymodal").modal("toggle");
		$("#save-tag").click(function() {
			$("#update-name-form").submit();
		})
	});
})

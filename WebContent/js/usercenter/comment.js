$(function() {
	$(".delete-btn").click(function() {
		var index = $(this).parents("tr").index();
		var id = $(this).parents("td").find("input").val();
		$("#mymodal").modal("toggle");
		$(".confirm").unbind("click");
		$(".confirm").click(function() {
			$.ajax({
				type : "post",
				url : "usercenter/comment",
				data : "id=" + id,
				success : function(e) {
					if (e > 0) {
						$(".body-box").find("tr").eq(index).remove();
					}
				}
			})
		})
	})
})
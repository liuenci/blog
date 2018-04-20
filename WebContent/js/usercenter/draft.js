$(function() {
	$(document).on('click', ".edit-btn", function() {
		var id = $(this).parents("td").find("input").val();
		window.location.href = "usercenter/edit-draft?id=" + id;
	})
	$(".draft-table").on('click', ".delete-btn", function() {
		var index = $(this).parents("tr").index();
		var id = $(this).parents("tr").find("input").val();
		$("#mymodal").modal("toggle");
		$('.confirm').unbind("click")
		$(".confirm").click(function() {
			$.ajax({
				type : "post",
				url : "usercenter/delete-draft",
				data : "id=" + id,
				success : function(e) {
					if (e > 0) {
						$(".body-box").find("tr").eq(index).remove();
					}
				}
			})
		})
	})
	$(".search-btn").click(function() {
						var title = $(".search-box").val();
						$(".body-box").empty();
						$.ajax({
									type : "get",
									url : "usercenter/search-draft",
									data : "title=" + title,
									success : function(e) {
										var json = eval("(" + e + ")");
										for (var i = 0; i < json.length; i++) {
											var tr = '<tr>' + '<td>'
													+ json[i].name
													+ '</td>'
													+ '<td>'
													+ json[i].title
													+ '</td>'
													+ '<td>'
													+ json[i].cate
													+ '</td>'
													+ '<td>'
													+ json[i].date
													+ '</td>'
													+ '<td>'
													+ json[i].cNum
													+ '</td>'
													+ '<td>'
													+ '<input type="hidden" value="'
													+ json[i].id
													+ '" class="hidden-draft-id">'
													+ '<button type="button" class="btn btn-primary edit-btn">编辑文章</button>'
													+ '<button type="button" class="btn btn-primary delete-btn">删除</button>'
													+ '</td>' + '</tr>';
											$(".body-box").append(tr);
										}
									}
								})
					})
})
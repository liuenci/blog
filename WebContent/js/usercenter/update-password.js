$(function(){
	$("#old-password").blur(function(){
		var old_password = $("#old-password").val();
		if(old_password.trim()==""){
			$(".old-ts").text("旧密码不能为空");
			$("#old-password").focus();
		}else{
			$(".old-ts").text("*");
		}
	})
	$("#new-password").blur(function(){
		var old_password = $("#new-password").val();
		if(old_password.trim()==""){
			$(".new-ts").text("新密码不能为空");
			$("#new-password").focus();
		}else{
			$(".new-ts").text("*");
		}
	})
	$("#repeat-password").blur(function(){
		var old_password = $("#new-password").val();
		var repeat_password = $("#repeat-password").val();
		if(repeat_password.trim()==""){
			$(".repeat-ts").text("新密码不能为空");
			$("#repeat-password").focus();
		}else if(old_password != repeat_password){
			$(".repeat-ts").text("两次密码不一致");
			$("#repeat-password").focus();
		}else{
			$(".repeat-ts").text("*");
		}
	})
	$(".btn-confirm").click(function(){
		$("#update-form").submit();
	})
})
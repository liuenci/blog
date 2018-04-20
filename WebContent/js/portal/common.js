//打开字滑入效果
window.onload = function(){
	$(".connect p").eq(0).animate({"left":"0%"}, 600);
	$(".connect p").eq(1).animate({"left":"0%"}, 400);
};
//jquery.validate表单验证
$(document).ready(function(){
	// 判断密码是否正确
	var msg = $(".msg").text();
	if(msg!=""){
		$(".msg").css("display","block");
		$(".msg").text("密码不正确");
	}
	// 判断注册是否成功
	var reg_msg = $(".reg-msg").text();
	if(reg_msg!=""){
		$(".msg").css("display","block");
	}
	// 验证用户名是否存在
	$(".username").blur(function(){
		var username = $(".username").val();
		// 检验用户名是否存在
		$.ajax({
			type:"post",
			url:"check_username",
			data:"name="+username,
			success:function(e){
				if(e=="yes"){
					$(".msg").css("display","none");
				}else{
					$(".msg").css("display","block");
					$(".msg").text("用户名不存在");
				}
			}
		})
	})
	// 判断用户名是否已被注册
	var reg_msg = $(".reg-msg").text();
	$(".username").blur(function(){
		// 获取用户名
		var username = $(".username").val();
		$.ajax({
			type:"post",
			url:"check_username",
			data:"name="+username,
			success:function(e){
				if(e=="no"){
					$(".reg-msg").css("display","none");
				}else{
					$(".reg-msg").css("display","block");
					$(".reg-msg").text("用户名已存在");
				}
			}
		})
	})
	// 判断手机号是否已被注册
	$(".phone_number").blur(function(){
		// 获取手机号
		var phone = $(".phone_number").val();
		$.ajax({
			type:"post",
			url:"check_userphone",
			data:"phone="+phone,
			success:function(e){
				if(e=="no"){
					$(".reg-msg").css("display","none");
				}else{
					$(".reg-msg").css("display","block");
					$(".reg-msg").text("手机号已注册");
				}
			}
		})
	})
	// 判断邮箱是否被注册
	$(".email").blur(function(){
		// 获取邮箱号
		var email = $(".email").val();
		$.ajax({
			type:"post",
			url:"check_useremail",
			data:"email="+email,
			success:function(e){
				if(e=="no"){
					$(".reg-msg").css("display","none");
				}else{
					$(".reg-msg").css("display","block");
					$(".reg-msg").text("邮箱号已注册");
				}
			}
		})
	})
	//登陆表单验证
	$("#loginForm").validate({
		rules:{
			username:{
				required:true,//必填
				minlength:2, //最少6个字符
				maxlength:32,//最多20个字符
			},
			password:{
				required:true,
				minlength:3, 
				maxlength:32,
			},
		},
		//错误信息提示
		messages:{
			username:{
				required:"必须填写用户名",
				minlength:"用户名至少为2个字符",
				maxlength:"用户名至多为32个字符",
				remote: "用户名已存在",
			},
			password:{
				required:"必须填写密码",
				minlength:"密码至少为3个字符",
				maxlength:"密码至多为32个字符",
			},
		},

	});
	//注册表单验证
	$("#registerForm").validate({
		rules:{
			username:{
				required:true,//必填
				minlength:1, //最少2个字符
				maxlength:32,//最多20个字符
				/*remote:{
					url:"http://kouss.com/demo/Sharelink/remote.json",//用户名重复检查，别跨域调用
					type:"post",
				},*/
			},
			password:{
				required:true,
				minlength:3, 
				maxlength:32,
			},
			email:{
				required:true,
				email:true,
			},
			confirm_password:{
				required:true,
				minlength:3,
				equalTo:'.password'
			},
			phone_number:{
				required:true,
				phone_number:true,//自定义的规则
				digits:true,//整数
			}
		},
		//错误信息提示
		messages:{
			username:{
				required:"必须填写用户名",
				minlength:"用户名至少为2个字符",
				maxlength:"用户名至多为32个字符",
				remote: "用户名已存在",
			},
			password:{
				required:"必须填写密码",
				minlength:"密码至少为3个字符",
				maxlength:"密码至多为32个字符",
			},
			email:{
				required:"请输入邮箱地址",
				email: "请输入正确的email地址"
			},
			confirm_password:{
				required: "请再次输入密码",
				minlength: "确认密码不能少于3个字符",
				equalTo: "两次输入密码不一致",//与另一个元素相同
			},
			phone_number:{
				required:"请输入手机号码",
				digits:"请输入正确的手机号码",
			},
		
		},
	});
	//添加自定义验证规则
	jQuery.validator.addMethod("phone_number", function(value, element) { 
		var length = value.length; 
		var phone_number = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/ 
		return this.optional(element) || (length == 11 && phone_number.test(value)); 
	}, "手机号码格式错误"); 
});

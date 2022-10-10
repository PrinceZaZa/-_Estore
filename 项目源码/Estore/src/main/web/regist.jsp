<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>注册页面</title>
	<link rel="stylesheet" href="css/index.css">
</head>
<body>
<div class="sign_background">
	<div class="sign_background_in">
		<div class="sign_background_no1">
			<a href="index.html"><img src="img/logo.jpg" alt=""></a>
		</div>
		<div class="sign_background_no2">注册小米帐号</div>
		<div class="sign_background_no3">

			<div class="sign_background_no5">
				<span style="color: red;">${msg}</span>
				<form  action="${pageContext.request.contextPath}/register/user" method="post" enctype="multipart/form-data">

					<table style="width: 500px;" border="0" cellspacing="0">
						<tr>
							<td width="25%" class="_left">姓名：</td>
							<td><input id="uname" type="text" name="uname"><span id="unameInfo"></span></td>
						</tr>
						<tr>
							<td width="25%" class="_left">性别：</td>
							<td>
								男<input name="gender" type="radio" value="1">
								女<input name="gender" type="radio" value="0">
							</td>
						</tr>
						<tr>
							<td width="25%" class="_left">电话号码：</td>
							<td><input id="phone" type="text" name="phone"><span id="phoneInfo"></span></td>
						</tr>
						<tr>
							<td width="25%" class="_left">所在地区：</td>
							<td><input id="area" type="text" name="area"><span id="areaInfo"></span></td>
						</tr>
						<tr>
							<td width="25%" class="_left">账号：</td>
							<td><input id="username" type="text" name="username"><span id="usernameInfo"></span></td>
						</tr>
						<tr>
							<td width="25%" class="_left">密码：</td>
							<td><input id="pwd" style="width: 220px; height: 30px;" type="password" name="password"><span id="pwdInfo"></span></td>
						</tr>
						<%--<tr>
							<td width="25%" class="_left">上传头像：</td>
							<td><input type="file" name="photo"></td>
						</tr>--%>
					</table>
					<div class="sign_background_no6" id="btn" onclick="sub()" >立即注册</div>
				</form>

			</div>
		</div>
		<div class="sign_background_no7">注册帐号即表示您同意并愿意遵守小米 <span>用户协议</span>和<span>隐私政策</span> </div>
	</div>
	<div class="sign_background_no8"><img src="img/sign01.jpg" alt=""></div>
</div>
</body>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	//姓名的非空校验
	$("#uname").blur(function() {
		//获取姓名
		var uname = $(this).val();
		if (uname == null || uname == "") {
			$("#unameInfo").text("姓名不能为空").css("color", "red");
		} else {
			$("#unameInfo").text("姓名可用").css("color", "green");
		}
	})
	//地区的非空校验
	$("#area").blur(function() {
		//获取地区
		var area = $(this).val();
		if (area == null || area == "") {
			$("#areaInfo").text("地区不能为空").css("color", "red");
		} else {
			$("#areaInfo").text("地区可用").css("color", "green");
		}
	})
	//密码的非空校验
	$("#pwd").blur(function() {
		//获取密码
		var pwd = $(this).val();
		if (pwd == null || pwd == "") {
			$("#pwdInfo").text("密码不能为空").css("color", "red");
		} else {
			$("#pwdInfo").text("密码符合规范").css("color", "green");
		}
	})

	//手机号码的校验
	$("#phone").blur(function() {
		//获取手机号
		var phone = $(this).val();
		//非空校验
		if (phone == null || phone == "") {
			$("#phoneInfo").text("手机号码不能为空").css("color", "red");
			$(this).focus();//输入错误聚焦输入框，重新输入
			return;
		}
		//正则校验
		if(!(/^1[3456789]\d{9}$/.test(phone))){
			$("#phoneInfo").text("手机号码格式不正确").css("color", "red");
			$(this).focus();//输入错误，重新输入
		} else {
			//唯一校验
			$.ajax({
				url: "${pageContext.request.contextPath}/user/register/checkPhoneOnly",
				type: "post",
				data: {"phone": phone},
				dataType: "json",
				success: function(isRegist) {
					/*
                        isRegist 为true代表已经注册
                        isRegist 为false代表可以注册
                    */
					if (!isRegist) {
						$("#phoneInfo").text("手机号码已被注册").css("color", "red");
						$("#phone").focus();//输入错误，重新输入
					} else {
						$("#phoneInfo").text("手机号可用").css("color", "green");
					}
				}
			})
		}
	})

	//用户名的校验
	$("#username").blur(function() {
		//获取用户名
		var username = $(this).val();
		//非空校验
		if (username == null || username == "") {
			$("#usernameInfo").text("用户名不能为空").css("color", "red");
			$(this).focus();
		} else {
			//唯一校验
			$.post(
					"${pageContext.request.contextPath}/user/register/checkUsernameOnly",
					{"username": username},
					function(isRegist) {
						console.log(isRegist)
						/*
                            isRegist为true代表已被注册
                            isRegist为false代表可以注册
                        */
						if (!isRegist) {
							$("#usernameInfo").text("用户名已被注册").css("color", "red");
							$("#username").focus();//输入错误重新输入
						} else {
							$("#usernameInfo").text("用户名正确").css("color", "green");
						}
					},
					"json"
			)
		}
	})

	//注册方法
	function sub() {
		//提交表单!!!
		$("form").submit();
	}

</script>
</html>















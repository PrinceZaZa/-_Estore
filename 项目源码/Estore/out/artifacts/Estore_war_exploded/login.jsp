<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-3.3.1.js"></script>
</head>
<body>
<div class="register_head_on">

</div>
<div class="register_head">
    <a href="index.html"><img src="img/logo.jpg" alt=""></a>
    <div class="register_head_right">
        <p class="register_head_right_p1">小 米 商 城</p>
        <p class="register_head_right_p2">让每个人都享受科技乐趣</p>
    </div>

</div>

<div class="register">
    <div class="register_boby">
        <div class="register_boby_min">
            <div class="register_boby_no1">
                <div class="register_boby_no1_in">
                    <span style="color: #ff6700">账号密码登录 </span>
                </div>
            </div>
            <form action="/login" method="post">
	            <div class="register_boby_no2">
	            	<span id="msg" style="color: red;font-size: 12px;margin-left: 20px;"></span>
	                <input id="username" name="username" type="text" placeholder="用户名" />
                    <td><span id="usernameInfo"></span></td>
	                <input id="password" name="password" type="password" placeholder="密码"/>
                    <td><span id="pwdInfo"></span></td>
	                <!-- 新增加 -->
	               <%-- <input id="zphone" type="button" value=" 获取手机验证码 " style="width: 138px;float: left;height: 53px;margin-left: 5px;" /> --%>
	                <div style="clear: both;">
		                <div id="loginDiv" class="register_boby_no2_div">
		                    <span id="sub">登录</span>
		                </div>
	            	</div>
	            </div>
            </form>
            
            <div class="register_boby_no3">
              <%--  <a href="javascript:void(0);" style="color: #ff6700">账号密码登录</a>--%>
                <span class="register_boby_no3_span">
                    <a href="regist.jsp">立即注册</a>
                    <span>|</span>
                    <a href="javascript:void(0);">忘记密码?</a>
                </span>

            </div>
            <div class="register_boby_no4">
                <img src="img/register02.jpg" alt="">
            </div>

        </div>
    </div>
</div>
<div class="register_foot">
    <img src="img/register03.jpg" alt="">
</div>
</body>
<script type="text/javascript">
    //姓名的非空校验
    $("#username").blur(function() {
        //获取姓名
        var username = $(this).val();
        if (username == null || username == "") {
            $("#usernameInfo").text("姓名不能为空").css("color", "red");
        } else {
            $("#usernameInfo").text("姓名可用").css("color", "green");
        }
    })

    //密码的非空校验
    $("#password").blur(function() {
        //获取密码
        var pwd = $(this).val();
        if (pwd == null || pwd == "") {
            $("#pwdInfo").text("密码不能为空").css("color", "red");
        } else {
            $("#pwdInfo").text("密码可用").css("color", "green");
        }
	})
	
	//登录方法
	$("#loginDiv").click(function() {
		//获取输入的手机号与输入的验证码
		var password = $("#password").val();
		var username = $("#username").val();

            $.ajax({
                url: "${pageContext.request.contextPath}/login",
                type: "post",
                data: {"password": password, "username": username},
                dataType: "json",
                success: function(isSuccess) {
                    if (isSuccess) {
                        //登录成功跳转小米商城首页面
                        window.location = "index";
                    } else {
                        $("#msg").text("用户名或者密码错误").css("color", "red");
                        $("#pwdInfo").text();
                        $("#usernameInfo").text();
                    }
                }
            })
	})
</script>
</html>



















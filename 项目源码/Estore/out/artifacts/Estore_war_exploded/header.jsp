<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.3.1.js"></script>
</head>
<body>

<div class="box">
      <div class="inner whiteGL">
          <div class="left">
              <a class="mix" href="">仿小米商城-学习专用</a>
          </div>
          <div class="right">
          		<c:if test="${user == null }">
          			 <a class="mix" href="login.jsp">登录</a>
              		 <a href="regist.jsp">注册</a>
          		</c:if>
             	<c:if test="${user != null }">
             		<span style="color: white;">欢迎${user.uname }来到小米商城</span>
             	</c:if>
              <a class="max"  href="">消息通知</a>
              <a href="${pageContext.request.contextPath}/findAllTrolley?uid=${sessionScope.user.uid}" onclick="findAllTrolley()">
              		购物车(<span style="color: white;" id="trolleyNumber">0</span>)
              </a>
          </div>
      </div>
  </div>
  <div class="logo">
      <div class="logo_left">
          <div>
              <a href="javascript:void(0);" title="小米官网"><img class="xiaomi" src="img/logo.jpg"></a>
          </div>
      </div>
      <ul class="logo_center orangeGL">
          <a href="">小米手机</a>
          <a href="">红米</a>
          <a href="">笔记本</a>
          <a href="">电视</a>
          <a href="">盒子</a>
          <a href="">新品</a>
          <a href="">路由器</a>
          <a href="">智能硬件</a>
          <a href="">服务</a>
          <a href="">社区</a>
      </ul>
      <form class="logo_right">
         <div class="logo_input">
         	 <input id="search" type="text">
             <div class="logo_input_div">
             </div>
         </div>
          <a class="logo_right_a"><img src="img/find.jpg"></a>
          <!--<a href="">红米5新品</a>-->
          <!--<a href="">小米Noto 3</a>-->
      </form>
  </div>
</body>
<script type="text/javascript">

	//点击购物车图标的方法
	function findAllTrolley() {
		//登录验证
		var user = "${sessionScope.user }";
		if (user != null && user != "") {
			window.location = "Trolley/findAllTrolley";
		} else {
			alert("小伙子请先登录吧~");
			window.location = "login.jsp";
		}
	}
	
	//强盗式执行js脚本，发送ajax请求
	var user = "${sessionScope.user }";
	if (user != null && user != "") {
		$.ajax({
			url: "trolley",
			type: "post",
			data: {"func": "selectTrolleyCount"},
			dataType: "text",
			success: function(count) {
				$("#trolleyNumber").text(count);
			}
		})
	}
	
	//点击搜索按钮的方法
	$(".logo_right_a").click(function() {
		//获取搜索的内容
		var search = $("#search").val();
		//非空判断
		if (search == null || search == "") {
			alert("请先输入搜索内容！");
		} else {
			//发送ajax请求
			$.ajax({
				url: "index",
				type: "post",
				data: {"func": "searchGoods", "search": search},
				dataType: "json",
				success: function(obj) {
					if (obj) {
						alert("生成Cookie成功");
					}
				}
			})
		}
	})

</script>
</html>













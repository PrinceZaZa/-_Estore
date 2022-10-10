<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 引入jstl的核心标签库core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 引入jstl的格式化库fmt -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//图片的访问路径
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() + "/Estore/img/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户信息</title>
<link href="<%=basePath %>admin/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.tablelist th {
		text-align: center;
	}
</style>
<script type="text/javascript" src="<%=basePath %>js/jquery-3.3.1.js"></script>

<script type="text/javascript">

// old write 
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});


</script>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">用户管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
	<form id="f2" method="post" action="${pageContext.request.contextPath}/deleteUsers">
    <div class="tools">
    	<ul class="toolbar">
        <li style="cursor: pointer;" onclick="batchDelete()"><span><img src="<%=basePath %>admin/images/t03.png" /></span>批量删除</li>
        </ul>

    </div>
    <table class="tablelist">
    	<thead>
	    	<tr>
		        <th><input name="" type="checkbox" value="" checked="checked"/></th>
		        <th>序号<i class="sort"><img src="<%=basePath %>admin/images/px.gif" /></i></th>
		        <th>姓名</th>
		        <th>性别</th>
		        <th>电话号码</th>
		        <th>所在地区</th>
		        <th>权限</th>
		        <th>账号</th>
		       	<th>头像</th>
		       	<th>注册时间</th>
		       	<th>操作</th>
	        </tr>
	    </thead>
        <tbody>
        	<c:forEach items="${pageInfo.list}" var="user" varStatus="i">
        		<tr style="text-align: center;">
			        <td><input class="one" name="ids" type="checkbox" value="${user.uid }" /></td>
			        <td>${i.count }</td>
			        <td>${user.uname }</td>
			        <td>
			        	<c:if test="${user.gender == 1 }">男</c:if>
			        	<c:if test="${user.gender == 0 }">女</c:if>
			        </td>
			        <td>${user.phone }</td>
			        <td>${user.area }</td>
			        <td>
			        	<c:if test="${user.manager == 1 }">普通用户</c:if>
			        	<c:if test="${user.manager == 0 }"><span style="color: green;">管理员</span></c:if>
			        </td>
			        <td>${user.username }</td>
			       	<td>
			       		<img src="${pageContext.request.contextPath}/admin/images/001.jpg" width="80" height="40" />
			       	</td>
			       	<td>
			       		<fmt:formatDate value="${user.create_time }" pattern="yyyy-MM-dd HH:mm:ss" />
			       	</td>
			       	<td>
			       		<c:if test="${user.manager == 1 }">
			       			<a style="color: green;" href="${pageContext.request.contextPath}/SzManager${user.uid }">设为管理员</a>
			       		</c:if>
			       		<c:if test="${user.manager == 0 }">
			       			<a style="color: red;" href="${pageContext.request.contextPath}/QxManager${user.uid }">撤销管理员</a>
			       		</c:if>
			       	</td>
		        </tr>
        	</c:forEach>
        </tbody>
    </table>
	</form>
   
    <div class="pagin">
    	<div class="message">
    		共<i class="blue">${pageInfo.list.size() }</i>条记录，
    		当前显示第&nbsp;<i class="blue">${pageInfo.pageNum }</i>页
    		总共&nbsp;<i class="blue">${pageInfo.pages }&nbsp;</i>页
    	</div>
        <ul class="paginList">
	         <li class="paginItem"><a href="${pageContext.request.contextPath}/findPageusers">首页</a></li>
	         <li class="paginItem"><a href="${pageContext.request.contextPath}/findPageusers?pageNum=${pageInfo.prePage }">上一页</a></li>
	         <li class="paginItem"><a href="${pageContext.request.contextPath}/findPageusers?pageNum=${pageInfo.nextPage }">下一页</a></li>
	         <li class="paginItem"><a href="${pageContext.request.contextPath}/findPageusers?pageNum=${pageInfo.pages }">尾页</a></li>
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    </div>
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
<script type="text/javascript">

	//点击批量删除之后的方法
	function batchDelete() {
		let length = $("input[name='ids']:checked").length;
		if (length==0){
			alert("请选择要删除的用户");
			return;
		}
		let sure = confirm("确定要删除吗？");
		if (sure){
			$("#f2").submit();
		}
	}
	
</script>
</html>






















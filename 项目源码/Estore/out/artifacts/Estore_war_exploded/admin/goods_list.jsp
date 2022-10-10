<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/Estore/img/";

%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>商品信息</title>
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
		<li><a href="#">商品管理</a></li>
	</ul>
</div>
<div class="rightinfo">
	<div class="tools">
		<ul class="toolbar">
			<li style="cursor: pointer;" onclick="add_goods()"><span><img src="<%=basePath %>admin/images/t01.png"  /></span>添加商品</li>
			<li style="cursor: pointer;" onclick="batchDelete()"><span><img src="<%=basePath %>admin/images/t03.png" /></span>批量删除</li>
		</ul>
	</div>
	<table class="tablelist">
		<thead>
		<tr>
			<th><input name="" type="checkbox" value="" checked="checked"/></th>
			<th>序号<i class="sort"><img src="<%=basePath %>admin/images/px.gif" /></i></th>
			<th>商品类别</th>
			<th>商品名称</th>
			<th>商品颜色</th>
			<th>商品价格</th>
			<th width="10%">简介</th>
			<th width="20%">详情</th>
			<th>商品展示图</th>
			<th>是否热推</th>
			<th>型号</th>
			<th>生产日期</th>
			<th>操作</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${pageTool.list}" var="goods" varStatus="i">
			<tr style="text-align: center;">
				<td><input class="one" name="" type="checkbox" value="${goods.gid}" /></td>
				<td>${i.count}</td>
				<td>${goods.category.cname}</td>
				<td>${goods.gname}</td>
				<td>${goods.color}</td>
				<td>${goods.price}</td>
				<td width="10%">${goods.description}</td>
				<td width="20%">${goods.full_description}</td>
				<td>
					<img width="80" height="80" src="<%=imgPath %>${goods.pic}" />
				</td>
				<td>
					<c:if test="${goods.state == 0}">正常</c:if>
					<c:if test="${goods.state == 1}">热门产品</c:if>
					<c:if test="${goods.state == 2}">为你推荐</c:if>
					<c:if test="${goods.state == 3}">新品</c:if>
					<c:if test="${goods.state == 4}">小米明星单品</c:if>
				</td>
				<td>${goods.version}</td>
				<td>
					<fmt:formatDate value="${goods.product_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
						<%--<fmt:formatDate value="${goods.productDate}" pattern="yyyy-MM-dd HH:mm:ss" />--%>
				</td>
				<td>
					<a style="color: green;" href="<%=basePath %>preupdate?id=${goods.gid}">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagin">
		<div class="message">
			共<i class="blue">${pageTool.totalRecord }</i>条记录，
			当前显示第&nbsp;<i class="blue">${pageTool.pageNum }&nbsp;</i>页
			共&nbsp;<i class="blue">${pageTool.totalPage }&nbsp;</i>页
		</div>
		<ul class="paginList">
			<li class="paginItem"><a href="<%=basePath %>getgoodPage?pageNum=1">首页</a></li>
			<li class="paginItem"><a href="<%=basePath %>getgoodPage?pageNum=${pageTool.prePage}">上一页</a></li>
			<li class="paginItem"><a href="<%=basePath %>getgoodPage?pageNum=${pageTool.nextPage}">下一页</a></li>
			<li class="paginItem"><a href="<%=basePath %>getgoodPage?pageNum=${pageTool.totalPage}">尾页</a></li>
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

	//点击添加商品的方法
	function add_goods(){
		/*
            我们此时应该请求商品的servlet，来调用分类的service、dao来得到商品分类数据
        */
		//window.location = "goods_add.jsp";
		window.location = "<%=basePath%>addpage";
	}

	//点击批量删除之后的方法
	function batchDelete() {
		//定义一个变量来保存id字符串
		var ids = "";
		//获取所有id值
		$(".one:checked").each(function () {
			//拼接id
			ids += "," + $(this).val();
		})
		if (ids == "") {
			alert("请先选择再删除吧");
			return;
		} else {
			ids = ids.substring(1);
		}
		console.log(ids)
		// 将ids传入后台servlet
		if (confirm("您确定要删除吗？")) {
			window.location = "${pageContext.request.contextPath}/goodsDelete?ids=" + ids;
		}
	}
</script>
</html>













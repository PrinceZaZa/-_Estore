<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/img/";
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>修改商品</title>
	<link href="<%=basePath %>admin/css/style.css" rel="stylesheet" type="text/css" />
	<script language="javascript" type="text/javascript" src="<%=basePath %>admin/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">修改商品</a></li>
	</ul>
</div>
<div class="formbody">
	<div class="formtitle"><span>商品信息</span></div>
	<form action="<%=basePath%>update" method="post" enctype="multipart/form-data">
		<!-- 修改的功能方法 -->
		<input type="hidden" name="func" value="updateGoods" />
		<!-- 修改的商品主键id -->
		<input type="hidden" name="gid" value="${goods.gid}" />
		<ul class="forminfo">
			<!-- 商品分类信息 -->
			<li>
				<label>商品分类</label>
				<select name="cid" class="dfinput">
					<option value="0">===请选择===</option>
					<c:forEach items="${cates}" var="cate">
						<option <c:if test="${goods.cid == cate.cid}">selected</c:if> value="${cate.cid}">${cate.cname }</option>
					</c:forEach>
				</select>
			</li>
			<li><label>商品名称</label><input value="${goods.gname}" name="gname" type="text" class="dfinput" /><i>商品名称不能超过30个字符</i></li>
			<li><label>颜色</label><input value="${goods.color}" name="color" type="text" class="dfinput" /></li>
			<li><label>规格尺寸</label><input value="${goods.size}" name="size" type="text" class="dfinput" /></li>
			<li><label>单价</label><input value="${goods.price }" name="price" type="text" class="dfinput" /></li>
			<li><label>简介</label>
				<textarea name="description" cols="10" rows="10" class="textinput" style="height: 80px">${goods.description }</textarea>
			</li>
			<li><label>完整介绍</label>
				<textarea name="full_description" cols="10" rows="10" class="textinput" style="height: 80px">${goods.full_description }</textarea>
			</li>
			<li><label>商品展示图</label>
				<input name="pic" type="file"/><font style="color: red">${msg}</font>
				<!-- 显示当前的商品图片 -->
				<img src="<%=imgPath%>${goods.pic}" width="80" height="80" />
				<!-- 将之前的图片名称存放在隐藏域中，不显示，但是后台可以接收 -->
				<input type="hidden" name="oldPic" value="${goods.pic}" />
			</li>
			<li><label>商品小类别</label>
				<cite>
					<input <c:if test="${goods.state == 0 }">checked</c:if> name="state" type="radio" value="0" />正常&nbsp;&nbsp;&nbsp;&nbsp;
					<input <c:if test="${goods.state == 1 }">checked</c:if> name="state" type="radio" value="1" />热门产品
					<input <c:if test="${goods.state == 2 }">checked</c:if> name="state" type="radio" value="2" />为你推荐
					<input <c:if test="${goods.state == 3 }">checked</c:if> name="state" type="radio" value="3" />新品
					<input <c:if test="${goods.state == 4 }">checked</c:if> name="state" type="radio" value="4" />小米明星单品
				</cite>
			</li>
			<li><label>型号</label><input value="${goods.version}" name="version" type="text" class="dfinput" /></li>
			<li><label>生产日期</label>
				<input value="<fmt:formatDate value="${goods.productDate}" pattern="yyyy-MM-dd HH:mm:ss" />" class="Wdate" style="width: 345px;height: 32px;line-height: 32px;" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="product_date"  class="dfinput" />
			</li>
			<li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存"/></li>
		</ul>
	</form>
</div>
</body>
</html>

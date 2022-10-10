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
    String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/xmpic/";

%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>订单信息</title>
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
        <li><a href="#">订单管理</a></li>
    </ul>
</div>
<div class="rightinfo">
    <table class="tablelist">
        <thead>
        <tr>
            <th><input name="" type="checkbox" value="" checked="checked"/></th>
            <th>序号<i class="sort"><img src="<%=basePath %>admin/images/px.gif"/></i></th>
            <th>订单名称</th>
            <th>订单编号</th>
            <th>数量</th>
            <th>总价</th>
            <th>生成日期</th>
            <th>所属用户</th>
            <th>订单状态</th>
        </tr>
        </thead>
        <tbody>
        <%--@elvariable id="orders" type="java.util.List"--%>
        <c:forEach items="${orders}" var="orders" varStatus="i">
            <tr style="text-align: center;">
                <td><input class="one" name="" type="checkbox" value="${orders.orders_number}" /></td>
                <td>${i.count}</td>
                <td>${orders.orders_name}</td>
                <td>${orders.orders_number}</td>
                <td>${orders.goods_count}</td>
                <td>${orders.sum_price}</td>
                <td>${orders.create_time}</td>
                <td>${orders.uid}</td>
                <td>${orders.state}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>
</body>
</html>
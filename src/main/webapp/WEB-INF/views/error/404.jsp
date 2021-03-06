<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<title>404</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="static/favicon.ico" type="image/x-icon" >
<link rel="stylesheet" href="<%=basePath%>webjars/layui/css/layui.css">
</head>
<style>
.error-page {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}
.error-page-img {
	min-width: 300px;
	max-width: 100%;
	max-height: 300px;
}
.error-page-info {
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	padding-left: 30px;
}
.error-page-info h1 {
	color: #434e59;
	font-size: 72px;
	font-weight: 600;
	margin-bottom: 10px;
}
.error-page-info-desc {
	color: #777;
	font-size: 20px;
	line-height: 28px;
	margin-bottom: 16px;
}
</style>
<body>
  <div class="error-page">
    <img class="error-page-img" src="<%=basePath%>/static/images/ic_404.svg">
    <div class="error-page-info">
      <h1>404</h1>
      <h1>${message}</h1>
      <div class="error-page-info-desc">啊哦，你访问的页面不存在(⋟﹏⋞)</div>
    </div>
  </div>
</body>
</html>
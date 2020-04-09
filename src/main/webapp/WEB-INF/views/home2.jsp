<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
      xmlns:shiro="http://www.pollix.at/thymeleaf/shiro">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"></meta>
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="renderer" content="webkit" />
<link rel="icon" type="image/x-icon" href="static/favicon.ico">
<link rel="stylesheet" href="webjars/layui/css/layui.css">
<link rel="stylesheet" href="webjars/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="static/css/zadmin.css">
<link rel="stylesheet" href="static/css/common.css">
</head>
<body>
<div class="z-body animated fadeIn">
	<blockquote class="layui-elem-quote">欢迎：
    <span><shiro:principal property="username"/></span>！当前时间: 2019</blockquote>
    <fieldset class="layui-elem-field">
            <legend>最近登录</legend>
            <div class="layui-field-box">
                <div id="main" style="width: 100%;height:400px;"></div>
            </div>
        </fieldset>
    </div>
  <script src="webjars/jquery/jquery.min.js"></script>
  <script src="webjars/layui/layui.all.js"></script>
  <script src="static/js/custom.js"></script>

</body>
</html>
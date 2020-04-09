<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"></meta>
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="renderer" content="webkit" />
<link rel="icon" type="image/x-icon" href="static/favicon.ico">
<link rel="stylesheet" href="<%=basePath%>webjars/layui/css/layui.css">
<link rel="stylesheet" href="<%=basePath%>webjars/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>static/css/zadmin.css" media="all">
<link rel="stylesheet" href="<%=basePath%>static/css/dtree.css">
<link rel="stylesheet" href="<%=basePath%>static/css/common.css">
<link rel="stylesheet" href="<%=basePath%>static/css/font.css">
</head>
<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">
    <!-- 导航栏 -->
    <div class="layui-header">
      <!-- logo 区域 -->
      <a href="#" class="layui-logo">
        <span class="layui-logo-mini">TIMO</span>
        <span class="layui-logo-lg">TIMO 后台</span>
      </a>
      <a class="side-toggle layui-layout-left" href="#"> 
        <i class="layui-icon layui-icon-shrink-right"></i> 
        <i class="layui-icon layui-icon-spread-left"></i>
      </a>
      <ul class="layui-nav layui-layout-right">
        <li class="layui-nav-item">
          <a href="#"> 
            <i class="fa fa-bell-o fa-lg"></i>
          </a>
        </li>
        <li class="layui-nav-item">
          <a class="timo-screen-full" href="#"> 
            <i class="fa layui-icon layui-icon-screen-full"></i>
          </a>
        </li>
        <li class="layui-nav-item timo-nav-user">
          <a class="timo-header-nickname">TIMO</a>
          <div class="layui-nav-child">
            <div class="timo-nav-child-box">
              <div>
                <a class="open-popup" data-title="个人信息" data-url="" data-size="680,464">
                  <!-- -->
                  <i class="fa fa-user-o"></i> 个人信息
                </a>
              </div>
              <div>
                <a class="open-popup" data-title="修改密码" data-url="" data-size="456,296">
                  <!-- -->
                  <i class="fa fa-lock" style="font-size: 17px; width: 12px;"></i>修改密码
                </a>
              </div>
              <div>
                <a href=""><i class="fa fa-power-off"></i>退出登录</a>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <!-- 左侧导航区域 -->
    <div class="layui-side layui-bg-black">
      <div class="layui-side-scroll">
        <div class="layui-side-user">
          <img class="layui-side-user-avatar open-popup" data-size="680,464"
            src="static/images/security.png" alt="logo" />
          <div>
            <p class="layui-side-user-name">超级管理员</p>
            <p class="layui-side-user-designation">在线</p>
          </div>
        </div>
        <!-- 导航区域 -->
        <ul class="layui-nav layui-nav-tree" lay-filter="layui-nav-side">
          <li class="layui-nav-item layui-this">
            <a lay-url="home"> 
              <i class="layui-icon layui-icon-home"></i><span class="layui-nav-title">主页</span>
            </a>
          </li>
          <li class="layui-nav-item">
              <a lay-id="#" lay-url="#"> <i class="iconfont layui-icon-picker-securityscan"></i>
                <span class="layui-nav-title">人事管理</span>
              </a>
              <dl class="layui-nav-child">
                <dd>
                  <a lay-url="employeeList" href="javascript:;"><span class="layui-nav-title">雇员管理</span></a>
                </dd>
                <dd>
                  <a lay-url="departmentList" href="javascript:;"><span class="layui-nav-title">部门管理</span></a>
                </dd>
              </dl>
          </li>
        </ul>
      </div>
    </div>
    <!-- 主体区域 -->
   
    <div class="layui-body layui-tab" lay-unauto lay-allowclose="true" lay-filter="iframe-tabs">
      <!-- 标签栏 -->
      <ul class="layui-tab-title">
        <li lay-id="home" lay-url="home" class="layui-this">
          <i class="layui-icon layui-icon-home"></i> 主页  
        </li>
      </ul>
      <!-- 内容区域-->
      <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
          <iframe src="home" class="layui-layout-iframe" style="border: none;"></iframe>
        </div>
      </div> 
    </div>

    <!-- 底部固定区域 -->
    <div class="layui-footer">copyright © 2019 Z-Admin all rights reserved.</div>

    <!-- 移动端遮罩 -->
    <div class="site-mobile-shade"></div>
  </div>
  <script src="<%=basePath%>webjars/jquery/jquery.min.js"></script>
  <script src="<%=basePath%>webjars/layui/layui.all.js"></script>
  <script src="<%=basePath%>static/js/zadmin.js"></script>
  <script src="<%=basePath%>static/js/custom.js"></script>
  <script src="<%=basePath%>static/js/dtree.js"></script>
</body>
</html>
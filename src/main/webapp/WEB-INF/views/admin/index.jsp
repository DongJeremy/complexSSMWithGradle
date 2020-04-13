<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"></meta>
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="renderer" content="webkit" />
<title>后台管理系统</title>
<link rel="icon" type="image/x-icon" href="<%=basePath%>static/favicon.ico">
<link rel="stylesheet" href="<%=basePath%>webjars/layui/css/layui.css">
<link rel="stylesheet" href="<%=basePath%>webjars/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>static/css/zadmin.css" media="all">
<link rel="stylesheet" href="<%=basePath%>static/css/dtree.css">
<link rel="stylesheet" href="<%=basePath%>static/css/common.css">
<link rel="stylesheet" href="<%=basePath%>static/css/font.css">
<script type="text/javascript">
	var basePath = "<%=basePath%>";
	localStorage.setItem('basePath', basePath)
</script>
</head>
<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">
    <!-- 导航栏 -->
    <div class="layui-header">
      <!-- logo 区域 -->
      <a href="admin#" class="layui-logo">
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
                <a onclick="logout()"><i class="fa fa-power-off"></i>退出登录</a>
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
          <img class="layui-side-user-avatar open-popup" data-size="680,464" src="<%=basePath%>static/images/security.png" alt="logo" />
          <div>
            <p class="layui-side-user-name">超级管理员</p>
            <p class="layui-side-user-designation">在线</p>
          </div>
        </div>
        <!-- 导航区域 -->
        <ul class="layui-nav layui-nav-tree" lay-filter="layui-nav-side">
          <li class="layui-nav-item layui-this">
            <a lay-url="welcome"> 
              <i class="layui-icon layui-icon-home"></i>&emsp;<span class="layui-nav-title">主页</span>
            </a>
          </li>
          <c:forEach items="${menus}" var="menu">
          <li class="layui-nav-item">
            <a lay-id="${menu.url}" lay-url="${menu.url}">
              <i class="layui-icon iconfont ${menu.icon}" ></i>&emsp;<span class="layui-nav-title">${menu.menuName}</span>
            </a>
            <c:if test="${menu.children!=null && fn:length(menu.children)>0 }">
            <dl class="layui-nav-child">
              <c:forEach items="${menu.children}" var="child">
              <dd>
                <a lay-url="${child.url}" href="javascript:;"><span class="layui-nav-title">${child.menuName}</span>
                </a>
              </dd>
              </c:forEach>
            </dl>
            </c:if>
          </li>
          </c:forEach>
        </ul>
      </div>
    </div>
    
    <div class="layui-body layui-tab" lay-unauto lay-allowclose="true" lay-filter="iframe-tabs">
      <!-- 标签栏 -->
      <ul class="layui-tab-title">
        <li lay-id="welcome" lay-url="welcome" class="layui-this">
          <i class="layui-icon layui-icon-home"></i> 主页  
        </li>
      </ul>
      <!-- 内容区域-->
      <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
          <iframe src="admin/welcome" class="layui-layout-iframe" style="border: none;"></iframe>
        </div>
      </div> 
    </div>

    <!-- 底部固定区域 -->
    <div class="layui-footer">copyright © 2019 Z-Admin all rights reserved.</div>

    <!-- 移动端遮罩 -->
    <div class="site-mobile-shade"></div>
  </div>

  <!-- jQuery 3 -->
  <script src="<%=basePath%>webjars/jquery/jquery.min.js"></script>
  <script src="<%=basePath%>webjars/layui/layui.all.js"></script>
  <script src="<%=basePath%>static/js/common.js"></script>
  <script src="<%=basePath%>static/js/zadmin.js"></script>
  <script src="<%=basePath%>static/js/dtree.js"></script>
  <script>
	function logout() {
		sessionStorage.removeItem("tabs");
		sessionStorage.removeItem("currentTabId");
		$.post('logout', function(result) {
			if (result.code == 0) {
				window.location.href = '<%=basePath%>login';
			}
		}, 'json');
	}
  </script>
</body>
</html>
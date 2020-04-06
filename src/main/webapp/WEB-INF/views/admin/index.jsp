<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
        <!-- Main Header -->
        <div class="layui-header">
            <!-- logo åºå -->
            <div class="layui-logo">
                
                <cite>&nbsp;PESTLE&emsp;</cite>
            </div>

            <!-- å¤´é¨åºå -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item" lay-unselect>
                    <a lay-event="flexible" title="ä¾§è¾¹ä¼¸ç¼©">
                        <i class="layui-icon layui-icon-shrink-right"></i>
                    </a>
                </li>
                <!-- é¢åå± -->
                <span class="layui-breadcrumb layui-anim layui-anim-up">
                    <a><cite>é¦é¡µ</cite></a>
                </span>
            </ul>

            <!-- å¤´ååºå -->
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a>
                        <img th:src="@{/static/images/avatar.png}" class="layui-nav-img" alt="å¤´å">
                        <cite><shiro:principal property="username"/></cite>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child layui-anim layui-anim-upbit">
<!--                        <dd lay-unselect>-->
<!--                            <a href="#">ä¸ªäººä¸­å¿</a>-->
<!--                        </dd>-->
<!--                        <dd lay-unselect>-->
<!--                            <a href="#">ä¿®æ¹å¯ç </a>-->
<!--                        </dd>-->
<!--                        <hr>-->
                        <dd lay-unselect>
                            <a onclick="logout()">éåº</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
        
        <!-- å·¦ä¾§å¯¼èªåºå -->
        <div class="layui-side">
            <div class="layui-side-scroll">
                <div class="layui-side-user">
                    <img class="layui-side-user-avatar open-popup" data-size="680,464" th:src="@{/static/images/security.png}" alt="logo"/>
                    <div>
                        <p class="layui-side-user-name">è¶çº§ç®¡çå</p>
                        <p class="layui-side-user-designation">å¨çº¿</p>
                    </div>
                </div>
                <ul class="layui-nav layui-nav-tree" lay-filter="lay-nav" lay-accordion="true">
                    <li class="layui-nav-item layui-this">
                        <a lay-url="welcome" lay-id="home">
                            <i class="layui-icon layui-icon-home"></i>&emsp;
                            <cite>é¦é¡µ</cite>
                        </a>
                    </li>

                    <li class="layui-nav-item" th:each="menu:${menus}">
                        <a data-th-lay-id="${menu.url}" data-th-lay-url="${menu.url}">
                            <i class="iconfont" th:classappend="${menu.icon}"></i>&emsp;
                            <cite th:text="${menu.menuName}"></cite>
                        </a>
                        <dl th:if="${!#lists.isEmpty(menu.children)}" class="layui-nav-child">
                            <dd th:each="child:${menu.children}">
                                <a data-th-lay-id="${child.url}" data-th-lay-url="${child.url}">
                                    <cite th:text="${child.menuName}"></cite>
                                </a>
                                <th:block th:unless="${#lists.isEmpty(child.children)}" th:include="admin/common/public::menu(${child})" />
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>
                
        <div class="layui-body">
            <div class="layui-pagetabs">
                <div class="layui-icon admin-tabs-control layui-icon-refresh-3" lay-event="refresh"></div>
                <div class="layui-tab" lay-unauto lay-allowclose="true" lay-filter="lay-tab">
                    <ul class="layui-tab-title">
                        <li lay-id="home" lay-url="welcome" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <iframe src="/admin/welcome" class="layui-iframe"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- åºé¨åºå®åºå -->
        <div class="layui-footer">
            copyright Â© 2019 Z-Admin all rights reserved.
        </div>

        <!-- ç§»å¨ç«¯é®ç½© -->
        <div class="site-mobile-shade"></div>
    </div>

    <!-- jQuery 3 -->
    <script th:src="@{/webjars/jquery/3.4.1/jquery.min.js}"></script>
    <script th:src="@{/webjars/layui/2.4.5/layui.js}"></script>
    <script th:src="@{/static/js/common.js}"></script>
    
    <script>
        function logout() {
            sessionStorage.removeItem("tabs");
            sessionStorage.removeItem("currentTabId");
            $.post('/admin/logout', function(result) {
                if (result.code==0) {
                    window.location.href = '/admin/login';
                }
            }, 'json');
        }
    </script>
</body>
</html>
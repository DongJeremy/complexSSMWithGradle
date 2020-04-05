<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"></meta>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"></meta>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
    <meta name="renderer" content="webkit" />
    <title>用户添加</title>
    <link rel="stylesheet" href="<%=basePath%>/webjars/layui/css/layui.css" />
    <link rel="stylesheet" href="<%=basePath%>webjars/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/css/common.css">
    <link rel="stylesheet" href="<%=basePath%>static/css/animate.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/css/formSelects-v4.css">
</head>
<body class="animated fadeIn timo-layout-page">
    <div class="z-body animated fadeIn">
        <form action="" method="post" class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <label for="deptName" class="layui-form-label">
                    部门名称
                </label>
                <div class="layui-input-block">
                    <input type="text" id="name" name="name" value="${department.name}"
                           lay-verify="required" lay-vertype="tips"
                           autocomplete="off" placeholder="请输入部门名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="description" class="layui-form-label">
                    部门描述
                </label>
                <div class="layui-input-block">
                    <input type="text" id="description" name="description" value="${department.description}"
                           lay-verify="required" lay-vertype="tips" autocomplete="off" 
                           placeholder="请输入部门描述" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left:0;text-align:center;">
                    <input type="hidden" name="id" value="${department.id}">
                    <button type="submit" class="layui-btn layui-btn-normal btn-w100" 
                            lay-submit <c:if test="${department == null}" var="flag" scope="session">lay-filter="add"</c:if>
                    <c:if test="${not flag}">lay-filter="edit"</c:if>><c:if test="${department == null}" var="flag" scope="session">增加</c:if>
                    <c:if test="${not flag}">修改</c:if></button>
                </div>
            </div>
        </form>
    </div>

    <script src="<%=basePath%>webjars/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>webjars/layui/layui.all.js"></script>
    <script src="<%=basePath%>static/js/common.js"></script>

    <script>
        layui.config({
            base: '/static/js/'
        }).use(['form', 'layer'], function () {
            var $ = layui.jquery,
                form = layui.form,
                layer = layui.layer;
            var index = parent.layer.getFrameIndex(window.name);
            $("#parentName").on("click",function(){
                $(this).toggleClass("layui-form-selected");
                $("#parentTreeDiv").toggleClass("layui-show layui-anim layui-anim-upbit");
            });
            //监听提交
            form.on('submit(add)', function (form) {
                ajaxJsonRequest("POST", '<%=basePath%>api/department', JSON.stringify(form.field), function (result) {
                    handlerResult(result, addDone)
                });
                return false;
            });
            //监听提交
            form.on('submit(edit)', function (form) {
                ajaxJsonRequest("PUT", '<%=basePath%>api/department', JSON.stringify(form.field), function (result) {
                    handlerResult(result, editDone)
                });
                return false;
            });
            function addDone(data) {
                parent.layer.close(index); 
                layer.msg("添加成功", {icon: 6});
            }
            function editDone(data) {
                parent.layer.close(index); 
                layer.msg("修改成功", {icon: 6});
            }
        });
    </script>
</body>
</html>
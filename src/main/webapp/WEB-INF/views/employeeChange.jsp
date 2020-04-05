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
                <label for="username" class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" id="name" name="name" value="${employee.name}" lay-verify="required" 
                            lay-vertype="tips" placeholder="姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="address" class="layui-form-label">地址 </label>
                <div class="layui-input-block">
                    <input type="text" id="address" name="address" value="${employee.address}" lay-verify="required" 
                            lay-vertype="tips" placeholder="地址" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="age" class="layui-form-label">年龄</label>
                <div class="layui-input-block">
                    <input type="text" id="age" name="age" value="${employee.age}" lay-verify="required" 
                            lay-vertype="tips" placeholder="年龄" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="tel" class="layui-form-label">手机</label>
                <div class="layui-input-block">
                    <input type="text" id="tel" name="tel" value="${employee.tel}" lay-verify="required"  lay-vertype="tips" 
                            autocomplete="off" placeholder="手机" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label for="tel" class="layui-form-label">工资</label>
                <div class="layui-input-block">
                    <input type="text" id="salary" name="salary" value="${employee.salary}" lay-verify="required"  lay-vertype="tips" 
                            autocomplete="off" placeholder="工资" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">部门</label>
                <div class="layui-input-block">
                    <select name="department" lay-verify="tips" >
                        <option value="">请选择</option>
                        <c:forEach items="${departmentList}" var="department">
                            <option value="${department.id}" 
                            <c:if test="${department.id == employee.department.id}">selected = "selected"</c:if>
                            >${department.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left:0;text-align:center;">
                    <input type="hidden" name="id" value="${employee.id}">                   
                    <button type="submit" class="layui-btn layui-btn-normal btn-w100" 
                            lay-submit <c:if test="${employee == null}" var="flag" scope="session">lay-filter="add"</c:if>
                    <c:if test="${not flag}">lay-filter="edit"</c:if>><c:if test="${employee == null}" var="flag" scope="session">增加</c:if>
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
            base: '<%=basePath%>static/js/'
          }).extend({
              formSelects: 'formSelects-v4'
          }).use(['form', 'layer', 'formSelects'], function () {
              $ = layui.jquery;
              var index = parent.layer.getFrameIndex(window.name);
              
              var form = layui.form
                , layer = layui.layer
                  , formSelects = layui.formSelects;
            form.on('submit(add)', function (form) {
                form.field.role = formSelects.value('role-select', 'val');
                ajaxJsonRequest("POST", '<%=basePath%>api/employee/', JSON.stringify(form.field), function (result) {
                    handlerResult(result, addDone)
                });
                  return false;
              });
    
              //监听提交
              form.on('submit(edit)', function (form) {
                  form.field._method = 'PUT';
                  form.field.role = formSelects.value('role-select', 'val');
                  ajaxJsonRequest("PUT", '<%=basePath%>api/employee/', JSON.stringify(form.field), function (result) {
                    handlerResult(result, editDone)
                });
                  return false;
              });
              
              form.on('submit(cancel)', function (form) {
                    parent.layer.close(index); 
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
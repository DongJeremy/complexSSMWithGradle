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
<base href="<%=basePath%>">
<meta charset="utf-8"></meta>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"></meta>
<meta http-equiv="X-UA-Compatible" content="IE=edge"></meta>
<meta name="renderer" content="webkit" />
<link rel="icon" href="<%=basePath%>static/favicon.ico" type="image/x-icon" />
<title>重置密码</title>
<link rel="stylesheet" href="<%=basePath%>webjars/layui/css/layui.css" />
<link rel="stylesheet" href="<%=basePath%>webjars/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=basePath%>static/css/common.css">
<link rel="stylesheet" href="<%=basePath%>static/css/animate.min.css">
</head>
<body>
  <div class="layui-form timo-compile user-info-page">
    <div class="user-info">
      <div class="user-avatar-box">
        <img class="user-avatar" src="<%=basePath%>static/images/security.png" alt="头像"> <span
          class="edit-avatar" attr="data-url=<%=basePath%>userPicture">修改头像</span>
      </div>
      <ul class="detail-info">
        <li>账号：<span>${user.username}</span></li>
        <li>昵称：<span>${user.nickname}</span></li>
        <li>性别：<span>${user.sex}</span></li>
        <li>电话：<span>${user.phone}</span></li>
        <li>邮箱：<span>${user.email}</span></li>
      </ul>
    </div>
    <form class="user-edit" action="" method="post" >
      <input type="hidden" name="id" value="${user.id}">
      <div class="layui-form-item">
        <label class="layui-form-label">用户昵称</label>
        <div class="layui-input-inline">
          <input class="layui-input" type="text" name="nickname" placeholder="请输入用户昵称" value="${user.nickname}">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">电话号码</label>
        <div class="layui-input-inline">
          <input class="layui-input" type="text" name="phone" placeholder="请输入电话号码" value="${user.phone}">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
          <input class="layui-input" type="text" name="email" placeholder="请输入邮箱" value="${user.email}">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">选择性别</label>
        <div class="layui-input-inline">
          <input type="radio" name="sex" value="1" title="男" checked>
          <div class="layui-unselect layui-form-radio layui-form-radioed">
            <i class="layui-anim layui-icon"></i>
            <div>男</div>
          </div>
          <input type="radio" name="sex" value="2" title="女" th:checked="${user.sex} eq 2">
          <div class="layui-unselect layui-form-radio">
            <i class="layui-anim layui-icon"></i>
            <div>女</div>
          </div>
        </div>
      </div>
      <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
          <textarea placeholder="请输入内容" class="layui-textarea" name="remark">${user.remark}</textarea>
        </div>
      </div>
      <div class="layui-form-item timo-finally">
        <button class="layui-btn" lay-filter="save" lay-submit=""><i class="fa fa-check-circle"></i> 保存</button>
        <a class="layui-btn btn-secondary close-popup"><i class="fa fa-times-circle"></i> 关闭</a>
      </div>
    </form>
  </div>

  <script src="<%=basePath%>webjars/jquery/jquery.min.js"></script>
  <script src="<%=basePath%>webjars/layui/layui.all.js"></script>
  <script src="<%=basePath%>static/js/common.js"></script>
  <script src="<%=basePath%>static/js/custom.js"></script>

  <script>
  layui.use(['jquery', 'form', 'layer'], function () {
      var $ = layui.jquery;
      var form = layui.form
       , layer = layui.layer;
      form.on('submit(save)', function (form) {
          var data = form.field;
          ajaxJsonRequest("POST", '<%=basePath%>api/user/userInfo', JSON.stringify(data), function(result) {
              handlerResult(result, function (data) {
                  layer.msg("更新成功", {icon: 6});
                  parent.layer.close(window.parent.layerIndex);
              });
          });
          return false;
      });
  });
  </script>
</body>
</html>
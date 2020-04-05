<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <title>雇员管理</title>
    <link rel="stylesheet" href="<%=basePath%>webjars/layui/css/layui.css" />
    <link rel="stylesheet" href="<%=basePath%>webjars/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>static/css/zadmin.css">
    <link rel="stylesheet" href="<%=basePath%>static/css/common.css">
    <link rel="stylesheet" href="<%=basePath%>static/css/animate.min.css">
</head>
<body class="animated fadeIn timo-layout-page">
    <div class="page-loading">
        <div class="rubik-loader"></div>
    </div>
    <div class="animated fadeIn layui-card">
        <div class="layui-card-header timo-card-header">
            <span><i class="fa fa-bars"></i> 用户管理</span>
            <i class="layui-icon layui-icon-refresh refresh-btn"></i>
        </div>
        <div class="layui-card-body">
            <form class="layui-form">
            <div class="layui-row timo-card-screen put-row">
                <div class="pull-right screen-btn-group">
                    <div class="pull-left layui-form-pane timo-search-box">
                        <div class="layui-inline">
                            <label class="layui-form-label">部门</label>
                            <div class="layui-input-block timo-search-status">
                                <select class="timo-search-select" name="deptId" lay-verify="tips" >
                                    <option value="">请选择</option>
                                    <c:forEach items="${departmentList}" var="department">
                                        <option value="${department.id}">${department.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input id="dataReload" name="id" value="" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button class="layui-btn timo-search-btn" id="searchBtn" data-type="reload">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                    <div class="btn-group-right">
                        <button class="layui-btn open-popup" id="add_btn"><i class="fa fa-plus"></i> 添加</button>
                        <button class="layui-btn open-popup" data-type="getCheckData" id="del_btn"><i class="fa fa-trash"></i> 删除</button>
                    </div>
                </div>
            </div>
            </form>
            <div class="timo-table-wrap">
                <table class="layui-hide timo-table" id="user-table" lay-filter="allAttr"></table>
            </div>
        </div>
    </div>

    <script type="text/html" id="column-toolbar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    </script>

    <script src="<%=basePath%>webjars/jquery/jquery.min.js"></script>
    <script src="<%=basePath%>webjars/layui/layui.all.js"></script>
    <script src="<%=basePath%>static/js/zadmin.js"></script>
    <script src="<%=basePath%>static/js/common.js"></script>

    <script>
    layui.use(['table', 'element', 'form'], function () {
        var table = layui.table
        , $ = layui.$
        , form = layui.form;

        table.render({
            elem: '#user-table'
            , url: '<%=basePath%>api/employee/list'
            , page: true
            , id: 'userTable'
            , limits:[10,20,50]
            , cols: [
                [
                    {checkbox: true}
                    , {field: 'id', title: 'ID', width: "10%", hide: true}
                    , {field: 'name', title: '用户名', width: "15%"}
                    , {field: 'department', title: '部门', width: "15%",templet:'<span>{{ d.department.name }}</span>'}
                    , {field: 'address', title: '地址', width: "15%"}
                    , {field: 'age', title: '年龄', width: "10%"}
                    , {field: 'tel', title: '手机', width: "14%"}
                    , {field: 'salary', title: '工资'}
                    , {title: '操作', fixed: 'right', align: 'center', toolbar: '#column-toolbar', width: "15%"}
                ]
            ]
        });
        
        $("#searchBtn").on("click",function(){
            var dataReload = $('#dataReload')
            , deptId = $('.timo-search-select');
            var index = layer.msg('查询中，请稍后...', {icon: 16, time: false, shade: 0});
            setTimeout(function() {
                table.reload('userTable', {
                    page: {
                        curr: 1
                    }
                    , where: {
                    	department: deptId.val()
                        , username: dataReload.val()
                    }
                });
                layer.close(index);
            }, 800);
            return false;
        });
            
        $("#add_btn").on("click",function(){
            layer.open({
                content: "employeeChange",
                title: "新增用户",
                area: ['500px', '500px'],
                type: 2,
                maxmin: true,
                shadeClose: true,
                end: function () {
                    table.reload('userTable');
                }
            });
            return false;
        });
            
        $("#del_btn").on("click",function(){
            var checkStatus = table.checkStatus('userTable')
            ,checkData = checkStatus.data;
            if (checkData.length === 0) {
            	layer.msg('请选择数据');
                return false;
            }
            layer.confirm('确定删除吗?', function (index) {
                var reqBody = checkData.reduce(function(acc, cur) {
                    acc.push(cur.id);
                    return acc;
                }, []);
                ajaxJsonRequest("POST", '<%=basePath%>api/employee/delete',  JSON.stringify(reqBody), function (data) {
                    layer.close(index);
                    handlerResult(data, deleteDone)
                });
            });
            return false;
        });

        // 行点击事件
        table.on('tool', function (obj) {
            var data = obj.data;
            var event = obj.event;
            if (event === 'edit') {
                edit(data.id);
            } else if (event === 'del') {
                del(obj);
            }
        });

        function edit(id) {
            layer.open({
                content: '<%=basePath%>employeeChange/' + id,
                title: "编辑",
                area: ['500px', '500px'],
                type: 2,
                maxmin: true,
                shadeClose: true,
                end: function () {
                    table.reload('userTable');
                }
            });
        }

        function del(obj) {
            layer.confirm("确定删除用户吗?", {icon: 3, title: '提示'}, function (index) {//确定回调
                var id = obj.data.id;
                ajaxJsonRequest("DELETE", '<%=basePath%>api/employee/' + id, null, function (data) {
                    layer.close(index);
                    handlerResult(data, deleteDone)
                });
            }, function (index) {//取消回调
                layer.close(index);
            });
        }

        function deleteDone(data) {
            parent.layer.msg("删除成功", {icon: 6});
            table.reload('userTable', {});
        }
    });
    </script>
</body>
</html>
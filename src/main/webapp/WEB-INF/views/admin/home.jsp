<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="common/header.jsp"/>
</head>
<body>
  <div class="animated fadeIn">
    <blockquote class="layui-elem-quote">
      欢迎：<span><shiro:principal property="username" /></span>！当前时间:
      <c:set var="now" value="<%=new java.util.Date()%>" />
      <fmt:formatDate type="both" value="${now}" />
    </blockquote>
    <fieldset class="layui-elem-field">
      <legend>数据统计</legend>
      <div class="layui-field-box">
        <div class="layui-col-md12">
          <div class="layui-card">
            <div class="layui-card-body">
              <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 90px;">
                <div carousel-item="">
                  <ul class="layui-row layui-col-space10 layui-this">
                    <li class="layui-col-xs2"><a href="#" onclick="openTab('用户管理', '/user/index')" class="x-admin-backlog-body">
                      <h3>用户数</h3>
                      <p><cite>${userCount}</cite></p>
                    </a></li>
                    <li class="layui-col-xs2"><a href="#" onclick="openTab('角色管理', '/role/index')" class="x-admin-backlog-body">
                      <h3>角色数</h3>
                      <p><cite>${roleCount}</cite></p>
                    </a></li>
                    <li class="layui-col-xs2"><a href="#" onclick="openTab('菜单管理', '/menu/index')" class="x-admin-backlog-body">
                      <h3>菜单数</h3>
                      <p><cite>${menuCount}</cite></p>
                    </a></li>
                    <li class="layui-col-xs2"><a href="#" onclick="openTab('登录日志', '/log/login/index')" class="x-admin-backlog-body">
                      <h3>登录日志</h3>
                      <p><cite>${loginLogCount}</cite></p>
                    </a></li>
                    <li class="layui-col-xs2"><a href="#" onclick="openTab('操作日志', '/log/sys/index')" class="x-admin-backlog-body">
                      <h3>操作日志</h3>
                      <p><cite>${sysLogCount}</cite></p>
                    </a></li>
                    <li class="layui-col-xs2"><a href="#" onclick="openTab('system', '/systemInfo')" class="x-admin-backlog-body">
                        <h3>system</h3>
                        <p>
                          <cite>${userOnlineCount}</cite>
                        </p>
                    </a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </fieldset>
    <fieldset class="layui-elem-field">
      <legend>最近登录</legend>
      <div class="layui-field-box">
        <div id="main" style="width: 100%; height: 400px;"></div>
      </div>
    </fieldset>
  </div>

  <jsp:include page="common/footer.jsp"/>
  <script src="<%=basePath%>webjars/echarts/echarts.min.js"></script>
  <script type="application/javascript">
        layui.use('element', function(){
            layui.$("#main").css("width", (window.innerWidth - 100) +'px');
         	// 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));
         	// 指定图表的配置项和数据
            option = {
                title: {
                	text: '近七天登陆次数统计图',
                    left: 'center'
                },
                tooltip: {
                	trigger: 'axis',
                    axisPointer: { // 坐标轴指示器，坐标轴触发有效
                        type: 'none' // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                xAxis: {
                    type: 'category',
                    data:  getWeekList()
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    data: [],
                    type: 'line'
                }]
            };
            layui.$.get('weekLoginCount', function (data) {
            	option.series[0].data = data;
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            });
        });
  </script>
</body>
</html>
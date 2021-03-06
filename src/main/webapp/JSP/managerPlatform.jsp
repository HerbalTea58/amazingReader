<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %><%--
  Created by IntelliJ IDEA.
  User: hxl
  Date: 18-6-20
  Time: 13:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>layui/css/layui.css"/>
    <script src="<%=basePath%>layui/layui.js"></script>
<%--
    <link type="text/css" rel="stylesheet" href="<%=basePath%>bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
--%>
    <script src="<%=basePath%>JS/echarts.js"></script>
    <script type="text/javascript" src="<%=basePath%>jquery-1.11.2.js"></script>
<%--
    <script type="text/javascript" src="<%=basePath%>bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
--%>
    <title>惊鸿书院后台</title>
    <link rel="shortcut icon" href="<%=basePath%>Picture/惊鸿图标.jpg"/>
</head>

<body class="layui-layout-body">

<script>
    $(function(){

        $("#test1").click(function(){
            $("#woman").toggleClass("layui-nav-itemed");
        })
    })
    $(function(){

        $("#test2").click(function(){
            $("#man").toggleClass("layui-nav-itemed");
        })
    })

    <%--window.onload()--%>
    <%--{--%>
<%--//        var options=$("#day option:selected");--%>
<%--//        var val=options.val();--%>
            <%--$.ajax({--%>
                <%--type: 'post',--%>
                <%--url: '<%=basePath%>manager/platformIncome.action?showYear=2017',--%>
                <%--dataType: 'json',--%>
                <%--async: false,--%>
                <%--success: function (obj) {--%>
                    <%--//    for (var i = 0; i < obj.length; i++) {--%>

                    <%--myChart.setOption({--%>
                        <%--series: [{--%>
                            <%--data: obj.man--%>
                        <%--},--%>
                            <%--{--%>
                                <%--data: obj.woman--%>
                            <%--}--%>
                        <%--]--%>
                    <%--});--%>

                <%--}--%>
            <%--})--%>
    <%--}--%>

</script>
<%
    String datetime=new SimpleDateFormat("yyyy").format(Calendar.getInstance().getTime()); //获取系统时间
    int day=Integer.parseInt(datetime);
%>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="color: white;"><strong>惊鸿书院后台管理</strong></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
       <%-- <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>manager/bookManage.action">书籍管理</a></li>
            <li class="layui-nav-item"><a href="<%=basePath%>writerManage/countWriterIncome.action">作者管理</a></li>
            <li class="layui-nav-item"><a href="<%=basePath%>JSP/managerPlatform.jsp">平台收益管理</a></li>

        </ul>--%>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="<%=basePath%>${sessionScope.manager.managerPortrait}" class="layui-nav-img">
                    ${ sessionScope.manager.managerNeckname}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>

            </li>
            <c:if test="${ empty sessionScope.manager}">
                <li class="layui-nav-item"><a href="<%=basePath%>JSP/managerLogin.jsp">登录</a></li>
            </c:if>
            <li class="layui-nav-item"><a href="<%=basePath%>managerExit.action">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item ">
                    <a href="javascript:;">举报处理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=basePath%>manager/getToDealReportChapter.action" id="chapter_report_to_deal">待处理章节举报</a></dd>
                        <dd><a href="<%=basePath%>manager/getToDealReportComment.action" id="comment_report_to_deal">待处理评论举报</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>writerManage/countWriterIncome.action">作者管理</a>
                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>manager/bookManage.action">书籍管理</a>

                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>manager/bookDownShelf.action">下架管理</a>

                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>JSP/managerPlatform.jsp">平台收益管理</a>

                </li>
                <li class="layui-nav-item ">
                    <a href="<%=basePath%>manager/toCheckChaptersManage.action">章节审核</a>
                </li>

            </ul>
        </div>
    </div>
   <div style="width: 600px;height:30px;padding-left: 50px;margin-top:30px;margin-left: 190px;">
       <span>请选择要查询的年份</span>
       <select id="day" class="select">
           <option value="2016">2016</option>
           <option value="2017">2017</option>
           <option value="2018">2018</option>

       </select>
       <button type="button" onclick="selectData()" >查询</button>

   </div>

    <div id="main" style="width: 600px;height:390px;padding: 50px;margin-left: 240px;border: 1px solid black">



    </div>
    <script type="text/javascript">
       function selectData() {
            var options=$("#day option:selected");
            var val=options.val();
            $.ajax({
                type: 'post',
                url: '<%=basePath%>manager/platformIncome.action?showYear='+val,
                dataType: 'json',
                async: false,
                success: function (obj){
                //    for (var i = 0; i < obj.length; i++) {

                        myChart.setOption({
                            series:[{
                                data:obj.man
                            },
                                {
                                    data:obj.woman
                                }
                            ]
                        });

                }
            })
        }
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        var /*option = {
            xAxis: {
                type: 'category',
                data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
            },
            yAxis: {
                type: 'value'
            },
            series: [{
                data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
                type: 'bar'
            }]
        };
*/
       option = {
        title : {
            text: '惊鸿书院年度收入图表',

        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            data:['女频','男频']
        },
        toolbox: {
            show : true,
            feature : {
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        xAxis : [
            {
                type : 'category',
                data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
            }
        ],
        yAxis : [
            {
                type : 'value'
            }
        ],
        series : [
            {
                name:'女频',
                type:'bar',

                data:[],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                },
                markLine : {
                    data : [
                        {type : 'average', name: '平均值'}
                    ]
                }
            },
            {
                name:'男频',
                type:'bar',
                data:[],
                markPoint : {
                    data : [
                        {type : 'max', name: '最大值'},
                        {type : 'min', name: '最小值'}
                    ]
                    /*data : [
                        {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
                        {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
                    ]*/
                },
                markLine : {
                    data : [
                        {type : 'average', name : '平均值'}
                    ]
                }
            }
        ]
    };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    <script>
       /* alert(${day})*/
        $.ajax({
            type: 'post',
            url: '<%=basePath%>manager/platformIncome.action?showYear=2018',
            dataType: 'json',
            async: false,
            success: function (obj) {
                //    for (var i = 0; i < obj.length; i++) {

                myChart.setOption({
                    series: [{
                        data: obj.man
                    },
                        {
                            data: obj.woman
                        }
                    ]
                });

            }
        })
    </script>
</div>
</body>
</html>

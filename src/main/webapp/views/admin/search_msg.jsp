<%@ page import="com.njust.eds.model.Admin" %>
<%@ page import="com.njust.eds.model.User" %>
<%@ page import="com.njust.eds.model.Message" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:set value="" var="ctx"></c:set>
    <meta name="renderer" content="web${pageContext.request.contextPath }kit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="format-detection" content="telephone=no">
    <link type="text/css" rel="stylesheet" href="${ctx}/resources/css/H-ui.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/resources/css/H-ui.admin.css"/>
    <link type="text/css" rel="stylesheet" href="${ctx}/resources/fonts/font-awesome.min.css"/>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link href="assets/css/codemirror.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/typeahead-bs2.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="assets/layer/layer.js" type="text/javascript"></script>
    <script src="assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${ctx}/resources/js/jquery.min.js"></script>
    <script src="${ctx}/resources/js/bootstrap.min.js"></script>
    <script src="${ctx}/resources/new/js/jquery-1.9.1.min.js"></script>
    <script src="${ctx}/resources/new/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/resources/new/assets/js/typeahead-bs2.min.js"></script>
    <script src="${ctx}/resources/new/assets/js/jquery.dataTables.min.js"></script>
    <script src="${ctx}/resources/new/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${ctx}/resources/new/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${ctx}/resources/new/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${ctx}/resources/new/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${ctx}/resources/new/assets/laydate/laydate.js" type="text/javascript"></script>
    <script>
        jQuery(function ($) {
            var oTable1 = $('#sample-table').dataTable({
                //"aaSorting": [[1, "desc"]],//默认第几个排序
                "bStateSave": true,//状态保存
                "aoColumnDefs": [
                    //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                    {"orderable": false, "aTargets": [0, 2, 3, 6]}// 制定列不参与排序
                ]
            });
            $('table th input:checkbox').on('click', function () {
                var that = this;
                $(this).closest('table').find('tr > td:first-child input:checkbox')
                    .each(function () {
                        this.checked = that.checked;
                        $(this).closest('tr').toggleClass('selected');
                    });

            });
        });
        //面包屑返回值
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.iframeAuto(index);
        $('.Refund_detailed').on('click', function () {
            var cname = $(this).attr("title");
            var chref = $(this).attr("href");
            var cnames = parent.$('.Current_page').html();
            var herf = parent.$("#iframe").attr("src");
            parent.$('#parentIframe').html(cname);
            parent.$('#iframe').attr("src", chref).ready();
            parent.$('#parentIframe').css("display", "inline-block");
            parent.$('.Current_page').attr({"name": herf, "href": "javascript:void(0)"}).css({
                "color": "#4c8fbd",
                "cursor": "pointer"
            });
            parent.layer.close(index);
        });
    </script>
    <script>
        $(function () {
            $(".meun-item").click(function () {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function () {
                    var items = $(this).attr("src");
                    items = items.replace("_grey.png", ".png");
                    items = items.replace(".png", "_grey.png");
                    $(this).attr("src", items);
                });
                var attrObj = $(this).find("img").attr("src");
                attrObj = attrObj.replace("_grey.png", ".png");
                $(this).find("img").attr("src", attrObj);
            });
            $("#topAD").click(function () {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function () {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function () {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function () {
                $("#leftMeun").toggleClass("show");
                $("#rightContent").toggleClass("pd0px");
            })
        })
    </script>
    <link href="${ctx}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/slide.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/flat-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/jquery.nouislider.css">
    <title>EDS文件管理系统</title>

    <script type="text/javascript">
        function logoutEDS() {
            window.location.href = "${ctx}/admin/logout";
        }
    </script>
</head>
<body>
<%
    Admin admin = (Admin) session.getAttribute("loginAdmin");


    if (admin != null) {
%>
<div id="wrap">

    <!-- 右侧栏目块 -->
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
        </div>
        <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l"><a href="javascript:;" onClick="datadel()" class="btn btn-danger radius"><i class="icon-trash"></i> 批量删除</a>
    </span>
            <span class="r">共有消息：<strong>${Messagelist.size()}</strong> 条</span>
        </div>
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="80">消息发送者</th>
                <th width="80">消息发送者</th>
                <th width="80">类型</th>
                <th width="500">消息内容</th>
                <th width="40">发送时间</th>

                <th width="70">是否已读</th>
                <th width="100">操作</th>
            </tr>
            </thead>


            <tbody>
            <c:forEach items="${Messagelist}" var="item"  varStatus="loop" >

                <tr class="text-c">
                    <td><input type="checkbox" value="1" name=""></td>
                    <td>${item.msgSender}</td>
                    <td>${Namelist[loop.count-1]}</td>
                    <td>
                        <c:choose>
                            <c:when test="${item.msgSender<=10000}">管理员</c:when>
                            <c:when test="${item.msgSender>10000}">用户</c:when>
                        </c:choose>

                    </td>
                    <td>${item.msgData}</td>
                    <td>${item.msgSendtime}</td>

                    <td class="user-status"><span class="label label-success"><c:choose>
                        <c:when test = "${item.isRead==0}">未读</c:when>
                        <c:when test = "${item.isRead==1}">已读</c:when>
                    </c:choose>
                            </span>
                    </td>
                    <td class="f-14 user-manage"><a style="text-decoration:none" onClick="user_stop(this,'10001')"
                                                    href="javascript:;" title="停用"><i
                            class="icon-hand-down"></i></a> <a
                            title="编辑" href="javascript:;" onClick="user_edit('4','550','','编辑','user-add.html')"
                            class="ml-5"
                            style="text-decoration:none"><i class="icon-edit"></i></a> <a
                            style="text-decoration:none"
                            class="ml-5"
                            onClick="user_password_edit('10001','370','228','修改密码','user-password-edit.html')"
                            href="javascript:;"
                            title="修改密码"><i
                            class="icon-key"></i></a> <a title="删除" href="javascript:;" onClick="user_del(this,'1')"
                                                         class="ml-5" style="text-decoration:none"><i
                            class="icon-trash"></i></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div id="pageNav" class="pageNav"></div>
    </div>

</div>
</div>

<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/layer/layer.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/pagenav.cn.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/H-ui.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/H-ui.admin.js"></script>
<script type="text/javascript">
    window.onload = (function () {
        // optional set
        pageNav.pre = "&lt;上一页";
        pageNav.next = "下一页&gt;";
        // p,当前页码,pn,总页面
        pageNav.fn = function (p, pn) {
            $("#pageinfo").text("当前页:" + p + " 总页: " + pn);
        };
        //重写分页状态,跳到第三页,总页33页
        pageNav.go(1, 13);
    });
    $('.table-sort').dataTable({
        "lengthMenu": false,//显示数量选择
        "bFilter": false,//过滤功能
        "bPaginate": false,//翻页信息
        "bInfo": false,//数量信息
        "aaSorting": [[1, "desc"]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable": false, "aTargets": [0]}// 制定列不参与排序
        ]
    });
</script>
<%
} else {
%>
<script>
    alert("未登录!");
    window.location.href = "${ctx}/admin/tologin";
</script>
<%
    }
%>
</div>
</body>
</html>
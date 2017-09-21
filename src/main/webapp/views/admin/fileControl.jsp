<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/11
  Time: 上午11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.njust.eds.model.Admin" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
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
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="EDS管理系统" src="${ctx}/resources/images/logo.png"><span>EDS管理系统</span></p>
        </div>
        <div id="personInfor">
            <p id="userName">${sessionScope.loginAdmin.adminName}</p>
            <p><span>${sessionScope.loginAdmin.adminEmail}</span></p>
            <p>
                <a onclick="logoutEDS()">退出登录</a>
            </p>
        </div>
        <div class="meun-title ">普通管理</div>
        <%
            int Power = admin.getAdminPower();
            if (Power == 3 || Power == 1) {
        %>
        <div id="wj" class="meun-item meun-item-active"><img
                src="${ctx}/resources/images/icon_source.png">文件管理
        </div>
        <%
            }
            if (Power == 4 || Power == 1) {
        %>
        <div id="yh" class="meun-item" onclick="window.location.href='${ctx}/admin/UserControl'"><img
                src="${ctx}/resources/images/icon_chara_grey.png">用户管理
        </div>
        <%
            }
        %>
        <div id="xx" class="meun-item" onclick="window.location.href='${ctx}/admin/MessageControl'"><img
                src="${ctx}/resources/images/icon_user_grey.png">消息管理
        </div>
        <div id="gr" class="meun-item" onclick="window.location.href='${ctx}/admin/PersonalSettings'"><img
                src="${ctx}/resources/images/icon_change_grey.png">个人设置
        </div>
        <div class="meun-title">系统管理</div>
        <div id="xt" class="meun-item" onclick="window.location.href='${ctx}/admin/SystemInfo'"><img
                src="${ctx}/resources/images/icon_house_grey.png">系统信息
        </div>

        <%
            if (Power == 1) {
        %>
        <div id="mj" class="meun-item" onclick="window.location.href='${ctx}/admin/SecretLeveControl'"><img
                src="${ctx}/resources/images/icon_rule_grey.png">密级管理
        </div>
        <%
            }
            if (Power == 1 || Power == 2) {
        %>
        <div id="gly" class="meun-item" onclick="window.location.href='${ctx}/admin/AdminControl'"><img
                src="${ctx}/resources/images/icon_card_grey.png">管理员
        </div>
        <%
            }
        %>
    </div>
    <!-- 右侧栏目块 -->
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
            <nav class="Hui-breadcrumb"><i class="icon-home"></i> 首页 <span class="c-gray en">&gt;</span> 文件管理
                <a class="btn btn-success radius r mr-20"
                   style="line-height:1.6em;margin-top:3px"
                   href="javascript:location.replace(location.href);" title="刷新"><i
                        class="icon-refresh"></i></a></nav>
            <div class="pd-20">
                <div class="text-c">
                    <select name="type" id="type">
                        <option value="0">文件名</option>
                        <option value="1">用户名</option>
                        <option value="3">文件类型</option>
                    </select>
                    <input type="text" class="input-text" style="width:250px" placeholder="输入文件名 用户名" id="name"
                           name="name">
                    <button type="submit" class="btn btn-success" id="" name=""
                            onclick="search_file('${ctx}/views/admin/search_file.jsp')"><i class="icon-search"></i> 搜文件
                    </button>

                </div>
                <div class="cl pd-5 bg-1 bk-gray mt-20">
                    <span class="l"><a href="javascript:;" onClick="datadel_file()" class="btn btn-danger radius"><i
                            class="icon-trash"></i> 批量删除</a></span>
                    <span class="r">共有文件：<strong>${size}</strong> 个</span>
                </div>
                <table class="table table-border table-bordered table-hover table-bg table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" name="" value=""></th>
                        <th width="100">用户名</th>
                        <th width="100">文件名</th>
                        <th width="40">文件大小</th>
                        <th width="60">查看次数</th>
                        <th width="40">下载次数</th>
                        <th width="40">文件类型</th>
                        <th width="300">文件摘要</th>
                        <th width="130">上传时间</th>
                        <th width="70">文件密级</th>
                        <th width="100">操作</th>
                    </tr>
                    </thead>


                    <tbody>
                    <c:forEach items="${Userfiles}" var="Useritem" varStatus="loop">


                        <c:forEach items="${Useritem}" var="Fileitem">
                            <tr class="text-c">
                                <td><input type="checkbox" value="${Fileitem.fileId}" name="chckBox"></td>
                                <td>${Namelist[loop.count-1]}</td>
                                <td><u style="cursor:pointer" class="text-primary"
                                       onclick="user_show('${Fileitem.fileName}','800','800','${Fileitem.fileName}的详细信息','${ctx}/views/admin/user-show.jsp')"> ${fn:substring(Fileitem.fileName, 0, 10)}...
                                </u></td>
                                <td>${Fileitem.fileSize}</td>
                                <td>${Fileitem.fileViewtimes}</td>
                                <td>${Fileitem.fileDownloadtimes}</td>
                                <td class="text-l">${Fileitem.fileType}</td>
                                <td>${Fileitem.fileAbstrcat}</td>
                                <td>${Fileitem.fileLoadTime}</td>
                                <td class="user-status"><span class="label label-success">
                                <c:choose>
                                    <c:when test="${Fileitem.fileSecretLevel==1}">普通</c:when>
                                    <c:when test="${Fileitem.fileSecretLevel==2}">内部</c:when>
                                    <c:when test="${Fileitem.fileSecretLevel==3}">C级</c:when>
                                    <c:when test="${Fileitem.fileSecretLevel==3}">B级</c:when>
                                    <c:when test="${Fileitem.fileSecretLevel==3}">A级</c:when>
                                </c:choose>
                            </span>
                                </td>
                                <td class="f-14 user-manage">
                                    <a style="text-decoration:none" onClick="file_download(this,${Fileitem.fileId})"
                                       href="javascript:;" title="认证"><i class="icon-hand-down"></i></a>
                                    <a title="编辑" href="javascript:;"
                                       onClick="file_edit(${Fileitem.fileId},'550','','编辑','${ctx}/views/admin/file-edit.jsp')"
                                       class="ml-5" style="text-decoration:none"><i class="icon-edit"></i></a>
                                    <a title="删除" href="javascript:;"
                                       onClick="file_del(this,${Fileitem.fileId})"
                                       class="ml-5" style="text-decoration:none"><i
                                            class="icon-trash"></i></a>
                                </td>
                            </tr>

                        </c:forEach>

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
                {"orderable": false, "aTargets": [0, 8, 9]}// 制定列不参与排序
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
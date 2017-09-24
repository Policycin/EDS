<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/20
  Time: 下午1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" isELIgnored="false" contentType="text/html; utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
    <title>EDS</title>

    <!-- Bootstrap core CSS -->
    <link href="${ctx}/resources/css/userbootstrap.css" rel="stylesheet">
    <link href="${ctx}/resources/css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="${ctx}/resources/fonts/css/font-awesome.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="${ctx}/resources/css/userstyle.css" rel="stylesheet">
    <link href="${ctx}/resources/css/userstyle2.css" rel="stylesheet">
    <link href="${ctx}/resources/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->


</head>
<c:choose>
    <c:when test="${!empty sessionScope.loginUser}">
        <section id="container">
            <!-- **********************************************************************************************************************************************************
            TOP BAR CONTENT & NOTIFICATIONS
            *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right"
                         data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="#" class="logo" onclick="window.location.href='${ctx}/user/index'"><b>EDS</b></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  通知 start -->
                    <ul class="nav top-menu">
                        <!-- 文件评论 start -->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-tasks"></i>
                                <span class="badge bg-theme">${fn:length(sessionScope.notReadFileComments)}</span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">你有 ${fn:length(sessionScope.notReadFileComments)} 条新评论</p>
                                </li>
                                <c:forEach items="${sessionScope.notReadFileComments}" var="comment" end="4"
                                           varStatus="loop">
                                    <li>
                                            <%--查看--%>
                                        <a href="#"
                                           onclick="window.location.href='${ctx}/user/readComment-${comment.comId}'">
                                                <%--头像--%>
                                            <span class="photo">
                                            <img alt="avatar"
                                                 src="${sessionScope.notReadFileCommentsSender[loop.count-1].userPictureUrl}">
                                        </span>
                                            <span class="subject">
                                            <%--名字--%>
                                            <span class="from">${sessionScope.notReadFileCommentsSender[loop.count-1].userName}</span>
                                            <%--时间--%>
                                            <span class="time">
                                                <fmt:formatDate value="${comment.comTime}" type="time"
                                                                timeStyle="medium"/>
                                            </span>
                                        </span>
                                                <%--内容--%>
                                            <span class="message">
                                            <c:choose>
                                                <c:when test="${fn:length(comment.comData) <= 14}">
                                                    ${comment.comData}
                                                </c:when>
                                                <c:otherwise>
                                                    ${fn:substring(comment.comData, 0, 14)}...
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                        </a>
                                    </li>
                                </c:forEach>
                                <li class="external">
                                    <a href="#"
                                       onclick="window.location.href='${ctx}/user/notReadFileComment'">查看所有未读评论</a>
                                </li>
                            </ul>
                        </li>
                        <!-- 文件评论 end -->
                        <!-- inbox dropdown start-->
                        <li id="header_inbox_bar" class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-theme">${fn:length(sessionScope.notReadMessages)}</span>
                            </a>
                            <ul class="dropdown-menu extended inbox">
                                <div class="notify-arrow notify-arrow-green"></div>
                                <li>
                                    <p class="green">你有 ${fn:length(sessionScope.notReadMessages)} 条新消息</p>
                                </li>
                                <c:forEach items="${sessionScope.notReadMessages}" var="Message" end="4"
                                           varStatus="loop">
                                    <li>
                                            <%--查看--%>
                                        <a href="#">
                                                <%--头像--%>
                                            <span class="photo">
                                                <img alt="avatar"
                                                     src="${sessionScope.notReadMessagesSender[loop.count-1].userPictureUrl}">
                                            </span>
                                            <span class="subject">
                                            <%--名字--%>
                                            <span class="from">${sessionScope.notReadMessagesSender[loop.count-1].userName}</span>
                                            <%--时间--%>
                                            <span class="time">
                                                <fmt:formatDate value="${Message.msgSendtime}" type="time"
                                                                timeStyle="medium"/>
                                            </span>
                                        </span>
                                                <%--内容--%>
                                            <span class="message">
                                            <c:choose>
                                                <c:when test="${fn:length(Message.msgData) <= 14}">
                                                    ${Message.msgData}
                                                </c:when>
                                                <c:otherwise>
                                                    ${fn:substring(Message.msgData, 0, 14)}...
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                        </a>
                                    </li>
                                </c:forEach>
                                <li>
                                    <a href="#"
                                       onclick="window.location.href='${ctx}/user/notReadMessages'">查看所有未读消息</a>
                                </li>
                            </ul>
                        </li>
                        <!-- inbox dropdown end -->
                    </ul>
                    <!--  通知 end -->
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="#" onclick="window.location.href='${ctx}/user/logout'">注 销</a></li>
                    </ul>
                </div>
            </header>
            <!--header end-->

            <!-- **********************************************************************************************************************************************************
            MAIN SIDEBAR MENU
            *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            <aside>
                <div id="sidebar" class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">
                        <!--头像-->
                        <p class="centered">
                            <a href="#" onclick="window.location.href = '${ctx}/user/userPicture'">
                                <c:choose>
                                    <c:when test="${empty sessionScope.loginUser.userPictureUrl}">
                                        <img src="${ctx}/resources/img/ui-sam.jpg" class="img-circle" width="60">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${sessionScope.loginUser.userPictureUrl}" class="img-circle"
                                             width="60">
                                    </c:otherwise>
                                </c:choose>
                            </a>
                        </p>
                        <!--用户名-->
                        <h5 class="centered">${sessionScope.loginUser.userName}</h5>

                        <!--主页-->
                        <li class="mt">
                            <a class="active" href="#" onclick="window.location.href='${ctx}/user/index'">
                                <i class="fa fa-home"></i>
                                <span>主  页</span>
                            </a>
                        </li>
                        <!--消息-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-comments-o"></i>
                                <span>我的消息</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/findMessage'">搜索消息</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/notReadMessages'">未读消息</a>
                                </li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/allMessages'">所有消息</a></li>
                            </ul>
                        </li>
                        <!--共享文件-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-globe"></i>
                                <span>共享文件</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/webRecentFile'">近期文件</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/findWebFile'">搜索文件</a></li>
                            </ul>
                        </li>
                        <!--文件-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-th"></i>
                                <span>我的文件</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/newFile'">新建文件</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/findMyFile'">搜索文件</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/recentFile'">近期文件</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/enjoyFile'">共享文件</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/privateFile'">私人文件</a></li>
                            </ul>
                        </li>
                        <!--文件评论-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-tasks"></i>
                                <span>文件评论</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/findComment'">搜索评论</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/notReadFileComment'">未读评论</a>
                                </li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/allFileComment'">所有评论</a>
                                </li>
                            </ul>
                        </li>
                        <!--日志系统-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-book"></i>
                                <span>我的日志</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/myLog'">我的日志</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/myFileLog'">文件日志</a></li>
                            </ul>
                        </li>
                        <!--个人信息-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>个人信息</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/userInfo'">信息查看</a>
                                </li>
                            </ul>
                        </li>
                        <!--系统信息-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-desktop"></i>
                                <span>系统信息</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/EDS'">系统介绍</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/EDSUser'">作者介绍</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/donate'">捐赠作者</a></li>
                            </ul>
                        </li>
                        <!--设置-->
                        <li class="sub-menu">
                            <a href="javascript:;">
                                <i class="fa fa-cogs"></i>
                                <span>设  置</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/changePasswordTwo'">密码修改</a>
                                </li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/userPicture'">头像修改</a></li>
                                <li><a href="#" onclick="window.location.href='${ctx}/user/changeUserInfo'">信息修改</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->
            <!-- **********************************************************************************************************************************************************
                        MAIN CONTENT
                        *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper site-min-height">
                    <h3><i class="fa fa-angle-right"></i> ${requestScope.ThisUser.userName}的信息</h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="col-lg-5">
                                <!--widget start-->
                                <aside class="profile-nav alt green-border">
                                    <section class="panel">
                                        <div class="user-heading alt green-bg">
                                            <a href="#">
                                                <img alt="" src="${requestScope.ThisUser.userPictureUrl}">
                                            </a>
                                            <h1>${requestScope.ThisUser.userName}</h1>
                                            <p>${requestScope.ThisUser.userEmail}</p>
                                        </div>

                                        <ul class="nav nav-pills nav-stacked">
                                            <li><a href="javascript:;"> <i class="fa fa-github-alt"></i> 性别：
                                                <c:choose>
                                                    <c:when test="${requestScope.ThisUser.userSex == 0}">
                                                        女
                                                    </c:when>
                                                    <c:when test="${requestScope.ThisUser.userSex == 1}">
                                                        男
                                                    </c:when>
                                                    <c:otherwise>
                                                        未知
                                                    </c:otherwise>
                                                </c:choose>
                                            </a></li>
                                            <li><a href="javascript:;"> <i class="fa fa-phone"></i>
                                                电话：${requestScope.ThisUser.userTel}</a></li>
                                            <li><a href="javascript:;"> <i class="fa fa-building"></i>
                                                单位：${requestScope.ThisUser.userCompany}</a></li>
                                            <li><a href="javascript:;"> <i class="fa fa-gift"></i>
                                                生日：${requestScope.ThisUser.userBirthday}</a></li>
                                            <li><a href="javascript:;"> <i class="fa fa-key"></i> 密级：
                                                <c:choose>
                                                    <c:when test="${requestScope.ThisUser.userSecretLevel == 5}"> A</c:when>
                                                    <c:when test="${requestScope.ThisUser.userSecretLevel == 4}"> B</c:when>
                                                    <c:when test="${requestScope.ThisUser.userSecretLevel == 3}"> C</c:when>
                                                    <c:when test="${requestScope.ThisUser.userSecretLevel == 2}"> 内部</c:when>
                                                    <c:otherwise> 普通</c:otherwise>
                                                </c:choose>
                                            </a></li>
                                            <li><a href="javascript:;"> <i class="fa fa-calendar"></i>
                                                注册日期：${fn:substring(requestScope.ThisUser.userCreateTime, 0, 11)}</a>
                                            </li>
                                            <li><a href="javascript:;"> <i class="fa fa-tag"></i>
                                                个人简介：${requestScope.ThisUser.userProfile} </a></li>
                                        </ul>

                                    </section>
                                </aside>
                                <!--widget end-->
                            </div>
                            <div class="col-lg-6">
                                <section class="panel">
                                    <header class="panel-heading">
                                        最近消息
                                    </header>
                                    <div class="panel-body profile-activity">
                                            <%--<h5 class="pull-right">12 August 2013</h5>--%>
                                        <c:choose>
                                        <c:when test="${fn:length(sessionScope.aUserMessage) <= 5}">
                                            <c:set value="0" var="begin"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:set value="${fn:length(sessionScope.aUserMessage) - 5}" var="begin"/>
                                        </c:otherwise>
                                        </c:choose>
                                        <c:forEach items="${sessionScope.aUserMessage}" var="message" begin="${begin}">
                                        <c:choose>
                                        <c:when test="${message.msgSender == requestScope.ThisUser.userId}">
                                        <div class="activity blue">
                                            <span>
                                                <img src="${requestScope.ThisUser.userPictureUrl}" class="img-circle"
                                                     width="50">
                                            </span>
                                            <div class="activity-desk">
                                                <div class="panel">
                                                    <div class="panel-body">
                                                        <div class="arrow"></div>
                                                            <%--<i class="fa fa-clock-o"></i>--%>
                                                        <h4>${fn:substring(message.msgSendtime, 5, 16)}</h4>
                                                        <p>${message.msgData}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </c:when>
                                        <c:otherwise>
                                        <div class="activity alt green">
                                                <span>
                                                    <img src="${sessionScope.loginUser.userPictureUrl}"
                                                         class="img-circle" width="50">
                                                </span>
                                            <div class="activity-desk">
                                                <div class="panel">
                                                    <div class="panel-body">
                                                        <div class="arrow-alt"></div>
                                                            <%--<i class="fa fa-clock-o"></i>--%>
                                                        <h4>${fn:substring(message.msgSendtime, 5, 16)}</h4>
                                                        <p>${message.msgData}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </c:otherwise>
                                        </c:choose>
                                        </c:forEach>
                                        <div class="chat-form">
                                            <form>
                                                <div class="input-cont ">
                                                    <input type="text" id="msg" name="msg"
                                                           class="form-control col-lg-12"
                                                           placeholder="在这里输入你的消息...">
                                                </div>
                                                <div class="form-group">
                                                    <div class="pull-right chat-features" style="margin-top: 10px">
                                                        <a class="btn btn-danger"
                                                           onclick="Msg_send(${ThisUser.userId})">发 送</a>
                                                    </div>
                                                </div>
                                                <div class="pull-left chat-features" style="margin-top: 10px">
                                                    <a class="btn btn-info"
                                                       onclick="window.location.href='${ctx}/user/userMessage-${requestScope.ThisUser.userId}'">查看所有消息</a>
                                                </div>
                                            </form>

                                        </div>
                                </section>
                            </div>

                        </div>
                    </div>
                </section>
                <! --/wrapper -->
            </section>
            <!-- /MAIN CONTENT -->


            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2017 - Limit. three silly
                    <a href="#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
        </section>
    </c:when>
    <c:otherwise>
        <script>
            window.location.href = "${ctx}/user/tologin";
        </script>
    </c:otherwise>
</c:choose>

<!-- js placed at the end of the document so the pages load faster -->
<script src="${ctx}/resources/js/jquery.js"></script>
<script src="${ctx}/resources/js/userbootstrap.min.js"></script>
<script src="${ctx}/resources/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${ctx}/resources/js/jquery.ui.touch-punch.min.js"></script>
<script class="include" type="text/javascript" src="${ctx}/resources/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="${ctx}/resources/js/jquery.scrollTo.min.js"></script>
<script src="${ctx}/resources/js/jquery.nicescroll.js" type="text/javascript"></script>
<script src="${ctx}/resources/js/jquery-knob/js/jquery.knob.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/H-ui.user.js"></script>

<!--common script for all pages-->
<script src="${ctx}/resources/js/common-scripts.js"></script>

<!--script for this page-->

<script>
    //custom select box

    $(function () {
        $('select.styled').customSelect();
    });

</script>
</body>
</html>




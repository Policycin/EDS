<%--
  Created by IntelliJ IDEA.
  User: tomato
  Date: 2017/9/19
  Time: 上午11:34
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
    <!--external css-->
    <link href="${ctx}/resources/fonts/css/font-awesome.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="${ctx}/resources/css/userstyle.css" rel="stylesheet">
    <link href="${ctx}/resources/css/style-responsive.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/Search/css/demo.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/Search/css/style5.css"/>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<style> .radio-check {
    position: relative;
    height: 35px;
}

.radio-check > input {
    position: absolute;
    left: 0;
    top: 0;
    width: 20px;
    height: 20px;
    opacity: 0;
}

.radio-check > label {
    position: absolute;
    left: 30px;
    line-height: 20px;
    top: 0px;
}

.radio-check > label:before {
    content: '';
    position: absolute;
    left: -30px;
    top: 0px;
    display: inline-block;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    border: 1px solid #ddd;
    transition: all 0.3s ease;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
}

.radio-check > label:after {
    content: '';
    position: absolute;
    left: -30px;
    top: 0px;
    display: inline-block;
    width: 10px;
    height: 10px;
    border-radius: 50%;
    margin-top: 6px;
    margin-left: 6px;
    transition: all 0.3s ease;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
}

.radio-check input[type='radio']:checked + label:before {
    border-color: #eaba82;
}

.radio-check input[type='radio']:checked + label:after {
    background: #eaba82;
} </style>
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
            <!--  class="active" -->
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
                            <a href="#" onclick="window.location.href='${ctx}/user/index'">
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
                            <a class="active" href="javascript:;">
                                <i class="fa fa-th"></i>
                                <span>我的文件</span>
                            </a>
                            <ul class="sub">
                                <li><a href="#" onclick="window.location.href='${ctx}/user/newFile'">新建文件</a></li>
                                <li class="active"><a href="#" onclick="window.location.href='${ctx}/user/findMyFile'">搜索文件</a></li>
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
                                <li><a href="#" onclick="window.location.href='${ctx}/user/userInfo'">信息查看</a></li>
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
                    <h3><i class="fa fa-angle-right"></i> 从我的文件中搜索</h3>
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="search">
                                <button id="btn-search-close" class="btn btn--search-close"
                                        aria-label="Close search form">
                                    <svg class="icon icon--cross">
                                        <use xlink:href="#icon-cross"></use>
                                    </svg>
                                </button>
                                <form class="search__form" action="search_Myfile">
                                    <input id="search-input" class="search__input" name="name" type="search"
                                           placeholder=""
                                           autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false"
                                           style="height: 256px"/>
                                    <div class="radio-check col-lg-offset-1" style="margin-top: 40px;font-size: 3em">
                                        <input id='type0' type="radio" name='type' value="0" checked='checked'/>
                                        <label for="type0" class="col-lg-offset-1">文件名</label>
                                        <input id='type1' type="radio" name='type' value="1"/>
                                        <label for="type1" class="col-lg-offset-3">文件摘要</label>
                                        <input id='type2' type="radio" name='type' value="2"/>
                                        <label for="type2" class="col-lg-offset-5">文件类型</label>
                                    </div>
                                    <button class="btn btn--search">
                                        <svg class="icon icon--search">
                                            <use xlink:href="#icon-search"></use>
                                        </svg>
                                    </button>
                                </form>
                            </div><!-- /search -->

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
<script src="${ctx}/resources/Search/js/demo5.js"></script>
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



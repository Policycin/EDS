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
<style> .radio-check { position: relative; height: 35px; } .radio-check > input { position: absolute; left: 0; top: 0; width: 20px; height:20px; opacity: 0; } .radio-check > label { position: absolute; left: 30px; line-height: 20px; top: 0px; } .radio-check > label:before { content: ''; position: absolute; left: -30px; top: 0px; display: inline-block; width: 20px; height: 20px; border-radius: 50%; border: 1px solid #ddd; transition: all 0.3s ease; -webkit-transition: all 0.3s ease; -moz-transition: all 0.3s ease; } .radio-check > label:after { content: ''; position: absolute; left: -30px; top: 0px; display: inline-block; width: 10px; height: 10px; border-radius: 50%; margin-top: 6px; margin-left: 6px; transition: all 0.3s ease; -webkit-transition: all 0.3s ease; -moz-transition: all 0.3s ease; } .radio-check input[type='radio']:checked + label:before { border-color: #eaba82; } .radio-check input[type='radio']:checked + label:after { background: #eaba82; } </style>


<section id="container">
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
                        <button id="btn-search-close" class="btn btn--search-close" aria-label="Close search form">
                            <svg class="icon icon--cross">
                                <use xlink:href="#icon-cross"></use>
                            </svg>
                        </button>
                        <form class="search__form" action="search_Myfile">
                            <input id="search-input" class="search__input" name="name" type="search" placeholder=""
                                   autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" style="height: 256px"/>
                            <div class="radio-check">
                                <input id='type0' type="radio" name='type' value="0" checked='checked' />
                                <label for="type0">文件名</label>
                            </div>
                            <div class="radio-check">
                                <input id='type1' type="radio" name='type' value="1" checked='checked' />
                                <label for="type1">文件内容</label>
                            </div>
                            <div class="radio-check">
                                <input id='type2' type="radio" name='type' value="2" checked='checked' />
                                <label for="type2">文件类型</label>
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
            2014 - Alvarez.is
            <a href="#" class="go-top">
                <i class="fa fa-angle-up"></i>
            </a>
        </div>
    </footer>
    <!--footer end-->
</section>


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



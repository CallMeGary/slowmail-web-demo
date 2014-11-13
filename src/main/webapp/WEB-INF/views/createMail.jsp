<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<title>时光慢邮</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/template.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/datepicker3.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/bootstrap.min.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/static/css/bootstrap-theme.min.css'/>">
	<script type="text/javascript" src="<c:url value='/static/js/jquery.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/static/js/bootstrap.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/static/js/bootstrap-datepicker.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/static/js/bootstrap-datepicker.zh-CN.js'/>" charset="UTF-8"></script>
	<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript" src="<c:url value='/static/js/createMail.js'/>" charset="UTF-8"></script>
</head>
<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">时光慢邮</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#">主页</a></li>
            <li class="active"><a href="#">发送邮件</a></li>
            <li><a href="#about">关于我们</a></li>
            <li><a href="#contact">联系我们</a></li>
            <li><a href="#login">登录</a></li>
            <li><a href="#singup">注册</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
	<input id="context" type="hidden" name="context" value="${pageContext.request.contextPath}" />
    <div class="container">

      <div class="template">
		<form:form role="form" id="form" class="form-horizontal" method="post" action="createAction" modelAttribute="mail">
			<div class="form-group">
				<h2 class="page-header pull-left">发送一封慢邮邮件</h2>
			</div>
			<div class="form-group sendFrom">
    			<label class="col-sm-2 control-label">您的名字：</label>
    			<div class="col-sm-8">
      				<form:input path="sendFrom" class="form-control" placeholder="请输入您的名字" />
   				</div>
  			</div>
			<div class="form-group sendTo">
    			<label class="col-sm-2 control-label">收件人：</label>
    			<div class="col-sm-8">
      				<form:input path="sendTo" class="form-control" placeholder="请输入收件人的电子邮箱" />
   				</div>
  			</div>
			<div class="form-group scheduledOn">
    			<label class="col-sm-2 control-label">发送时间：</label>
    			<div class="col-sm-8">
      				<form:input path="scheduledOn" class="form-control" placeholder="请选择一个未来的（至少两天后）发送时间" />
   				</div>
  			</div>
			<div class="form-group message">
    			<label class="col-sm-2 control-label">邮件内容：</label>
    			<div class="col-sm-8">
      				<form:textarea path="message" rows="10" class="form-control" placeholder="这是不是你一直想要的地方，只闻花香，不谈悲喜，喝茶读书，不争朝夕。阳光暖一点，再暖一点，日子慢一些，再慢一些。。。在慢时光里第一次见到你的时候，我从没想过——你，我，有一天会变成我们。。。" />
   				</div>
  			</div>
  			<div class="form-group">
    			<div class="col-sm-offset-2 col-sm-1">
      				<a href="#" id="submitBtn" type="button" class="btn btn-primary">发送</a>
    			</div>
    			<div class="col-sm-1">
      				<button id="resetBtn" type="reset" class="btn btn-default">清除</button>
    			</div>
  			</div>
		</form:form>
      </div>
      <div id="modalSucess" class="modal fade">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title">发送成功</h4>
		      </div>
		      <div class="modal-body">
		      	<p id="modalMessage"></p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
   </div>
</body>
</html>
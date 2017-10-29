<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<title>规程制度</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
	
<link rel="stylesheet" href="${basePath }static/web/css/front/public.css">
<link rel="stylesheet" href="${basePath }static/web/css/front/guichengzhidu.css">
<style>

.header_top{
	width:100%;
	height:85px;
    line-height:85px;
    background: #354052;
}
.contain>.header_bottom{
    width: 100%;
    height: 48px;
    background: #fff;
    padding-top: 6px;
    padding-left: 73px;
}

.return>img{
    height:40px;
}
.header_top>p{
   color: #fff;
    font-size: 3rem;
    text-align: -webkit-center;
    text-align: center;
    font-size: 2.5vw;
}
.contain>.main{
        padding-top:20px;
        width:100%;
        height:100%;
        overflow: hidden;
}
.main p{
    margin: 0 40px;
}
.footer{
	width:100%;
	height:200px;
	position:fixed;
	left:0;
	bottom:0;
}
.footer img{
	width:100%;
	height:100%;
}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false>
	<div class="contain">
	 <div class="contain_wrap">
	     <div class="header_top">
             <a class="return" href="javascript:history.go(-1)">
                 <img src="${basePath }static/web/img/returnicon.png" alt="">
             </a>
	          <p>${moduleRich.title }</p>
	     </div>
    <div class="main">
        <div class="main_box">
          ${moduleRich.content }
  
        </div> 
           
             
	</div>
	<div class="footer">
             	<img src="${basePath }static/web/img/bgone.png"/>
             </div>
     </div>
     </div>
       
    <script src="${basePath }static/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript">
    var w = $(window).width();
	var h = $(window).height();
    $('.contain_wrap').css({"width":w,"height":h});
    $(window).resize(function(){
	    w = $(window).width();
	    h = $(window).height();
       $('.contain_wrap').css({"width":w,"height":h});
		
	})
    </script>
</body>
</html>
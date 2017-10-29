<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<title>先进展示详情</title>
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


.contain>.main{
        padding-top: 50px;
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
.name_tit{text-align: center;font-size:2rem;line-height:40px;color:#1ABC9C;}
.show_content{font-size:1.4rem;line-height:30px;margin-top:20px; }
</style>
</head>
<body oncontextmenu=self.event.returnValue=false>
	<div class="contain">
	     <div class="header_top">
             <a class="return" href="javascript:history.go(-1)">
                 <img src="${basePath }static/web/img/returnicon.png" alt="">
             </a>
	          <p>先进展示详情</p>
	     </div>
    <div class="main">
        <div class="main_box">
        	<div class="rows">
        		<div class="col-sm-3">
        		<img src="${basePathAfter}static/web/img/smallInnovate/${advancedShow.img }" alt="" style="width:150px;height:150px;">
        		<%-- <img src="${basePath }static/web/img/weichuangxin/p1.png" style="width:150px;height:150px;"/> --%>
        		</div>
        		<div class="col-sm-9">
        			<div class="name_tit">${advancedShow.name }</div>
        			<div class="show_content">${advancedShow.content }</div>
        		</div>
        	</div>
        </div> 
	</div>
	<div class="footer">
             	<img src="${basePath }static/web/img/bgone.png"/>
             </div>
    <script src="${basePath }static/bootstrap/js/jquery.min.js"></script>
</body>
</html>
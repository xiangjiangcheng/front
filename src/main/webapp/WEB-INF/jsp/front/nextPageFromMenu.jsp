<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>下级菜单界面</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${basePath }static/web/css/front/public.css">
<link rel="stylesheet" href="${basePath }static/web/css/front/per_manage.css">
<style type="text/css">
.first_line .col-lg-3{margin:2.5vw 0;}
#appendDiv{
	width:100%;
	float:left;
}
.texts{
	font-size: 44px;
    font-weight: bold
}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false>
<input type="hidden" class="background" value="${backgroundersan}">
	<div class="contain">
	<div class="contain_wrap">
	     <div class="header_top">
	          <div class="header_left">
				  <a class="back" href="javascript:history.go(-1)">
	               <img class="img_left" src="${basePath}/static/web/img/icon.png">
	               <i class="texts">${firstLevelTitle}</i>
				   </a>
				   
	          </div>
	          <div class="header_right">
	               <img src="${basePath}static/web/img/desklogo.png">
	          </div>
	     </div>
	     <div class="row content con">
	     <div class="first_line">
	     		<c:forEach var="menu" items="${menuConfig }">
		     		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
		              <a href="${basePath }rest/${menu.url}?menuid=${menu.id}&&background=${backgroundersan}" class="link_url">
		               <div class="img_box">
		                	<img class='img' src='${basePath}static/web/img/menuicon/${menu.iconname}'/>
		               </div>
		                   <img class="weichuangxin" src="${basePath}static/web/img/menubg/${menu.backgroundname}">
		                   <span class="text_indent">${menu.title }</span>
		                   </a>
		              </div>
	     		</c:forEach>
	</div>
	
	</div>
	</div>
	</div>
</body>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript">
	$(function(){
		var background = $(".background").val();
		$(".contain").css("background-image",background);//设置二级菜单背景和首页一致
		var brower=$(window).height();
		var head=$(".header").height();
		var content=$(".con").height();
		var appHeight=brower-head-content;
		$("#appendDiv").css("height",appHeight+"px");
		 var w = $(window).width();
			var h = $(window).height();
		$('.contain_wrap').css({"width":w,"height":h});
		$(".link_url").css('width',w*0.16);
		$('.link_url').css("height",w*0.16);
		$(window).resize(function(){
		    w = $(window).width();
		    h = $(window).height();
		    $(".link_url").css('width',w*0.16);
			$('.link_url').css("height",w*0.16);
			$('.contain_wrap').css({"width":w,"height":h});
			
		})
	
	})
	
	</script>
</html>
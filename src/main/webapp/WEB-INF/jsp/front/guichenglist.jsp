<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<title>规程制度列表</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css"
	media="screen">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css"
	media="screen">
<link rel="stylesheet"
	href="${basePath }static/web/css/front/public.css">
<link rel="stylesheet"
	href="${basePath }static/web/css/front/guichenglist.css">
</head>
<body oncontextmenu=self.event.returnValue=false>
	<div class="contain">
	    <div class="contain_wrap">
		<div class="header_top">
			<a class="return" href="javascript:history.go(-1)"> <img
				src="${basePath }static/web/img/returnicon.png" alt="">
			</a>
			<p>${config.title }</p>
		</div>
		<div class="main">
			<ul class="ul_box">
				<c:forEach items="${moduleRichs }" var="moduleRich">
					<li><span class="num"></span><span class="model"><a
							class="link"
							href="${basePath }rest/moduleRich/showGuichengzhidu?id=${moduleRich.id}">${moduleRich.title }</a></span></li>
				</c:forEach>
			</ul>
		</div>
	</div>
	</div>
		<script src="${basePath }static/bootstrap/js/jquery.min.js"></script>
		<script>
			$(function() {
				var m = $(".ul_box li").length;
				$("li").each(function() {
					var index = $(this).index();
					$(this).children(".num").html(index + 1);
					var n = $(this).children(".model").children("a");
					console.log(n);

					$(this).click(function() {
						location.href = $(this).find("a").attr("href");
					});
				});
			})
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
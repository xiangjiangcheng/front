<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<title>先进展示列表</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="${basePath }static/bootstrap/css/bootstrap-theme.min.css" media="screen">
<link rel="stylesheet" href="${basePath }static/web/css/front/public.css">
<link rel="stylesheet" href="${basePath }static/web/css/front/advancePublish.css">
</head>
<body oncontextmenu=self.event.returnValue=false>
	<div class="contain">
		<div class="header_top">
			<a class="return" href="javascript:history.go(-1)"> <img src="${basePath }static/web/img/returnicon.png" alt="">
			</a>
			<p>先进展示</p>
		</div>
		<div class="main">

			<ul>
				<c:forEach items="${adList }" var="ad">
					<li><a class="link" href="${basePath }rest/moduleform/toAdvancedShowDetails/${ad.id}"><img src="${basePathAfter}static/web/img/smallInnovate/${ad.img }"/>
						<%-- <img src="${basePath }static/web/img/weichuangxin/p1.png"/> --%>
						
						<div>
							<h1>先进展示--${ad.name }</h1>
							<p>${ad.content}</p>
						</div></a></li>
				</c:forEach>
			</ul>

		</div>
	</div>

	<script src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script>
		/* $(function() {
			var m = $(".main li").length;
			$("li").each(function() {
				var index = $(this).index();
				$(this).children(".num").html(index + 1);
				var n = $(this).children(".model").children("a");
				console.log(n);

				$(this).click(function() {
					location.href = $(this).find("a").attr("href");
				});
			});
		}) */
	</script>
</body>
</html>
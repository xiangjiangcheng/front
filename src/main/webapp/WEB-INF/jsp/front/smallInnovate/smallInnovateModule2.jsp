<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>微创新模板1</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${basePath }static/web/css/front/public.css">
<link rel="stylesheet"
	href="${basePath }static/web/css/front/weichuangxin2.css">
</head>
<body oncontextmenu=self.event.returnValue=false>
	<div class="contain">
		<div class="header_top">
			<a class="return" href="javascript:history.go(-1)"> <img
				src="${basePath }static/web/img/returnicon.png" alt="">
			</a>
			<p>微创新</p>
		</div>
		<div class="header_bottom">
			<div class="bottom_left">
				<div class="logo"></div>
				<!--<img src="./static/web/img/icon_logo.png" alt="">-->
			</div>
			<p class="left_behind">检修公司变电检修一班</p>
		</div>
		<div class="contain_bg">
			<div class="contain_wrap">

				<div class="middle">
					<div class="middle_left">
						<p class="name">成果名称:</p>
						<span>${smallInnovate.achievementname}</span>
					</div>

					<div class="middle_right">
						<p class="name">主要完成人:</p>
						<span>${smallInnovate.mainpersons}</span>
					</div>
				</div>

				<div class="main">

					<div class="main_text">
						<p class="theme">${smallInnovate.achievementname}</p>
						<div class="time"></div>
						<div class="some">
							<div class="header">
								<span>成果摘要</span>
							</div>
							<p class="lorem">${smallInnovate.achievementsummary}</p>
						</div>
						<%-- <div class="some">
							<div class="header">
								<span>应用情况及效益</span>
							</div>
							<p class="lorem">${smallInnovate.achievementdetails}</p>
						</div>
						<div class="some">
							<div class="header">
								<span>成果推广费用 </span>
							</div>
							<p class="lorem">${smallInnovate.achievementcost}</p>
						</div>
 --%>
						<div class="some">
							<div class="header">
								<span>成果图片 </span>
								
							</div>
							<p class="lorem"></p>
						</div> 

						<div class="imgs">
							<%-- <img src="${basePath}static/web/img/tu1.png">
							<img src="${basePath}static/web/img/tu2.png"> --%>
							 
							<c:forEach items="${pList }" var="picture">
								<img src="${basePathAfter}static/web/img/smallInnovate/${picture}" class="one" alt="">
							</c:forEach>
						</div>
						
						

					</div>
				</div>

			</div>
		</div>
	
	</div>
	
	<script type="text/javascript"
		src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {

		});
	</script>
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>PPT</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<style>
html,body{width:100%;height:100%;margin:0;padding:0;overflow-x:hidden;font-family:"microsoft yahei"}
div{margin:0;padding:0;}
body{
	text-align:center;
	padding-top:100px;
	
}
.showView {
	width: 800px;
	height: 650px;
	border: 1px solid #ccc;
	margin: 10px auto;
}

#viewerPlaceHolder {
	width: 800px;
	height: 650px;
	display: block;
}

.input-append {
	width: 300px;
	display: inline-block;
}

.content {
	width: 100%;
	text-align: center;
	margin: 20px 0;
}

.save {
	width: 100%;
	text-align: center;
}
.header_top {
    width: 100%;
    height: 85px;
    line-height: 85px;
    background: #354052;
    position: fixed;
    top: 0;
    left: 0;
}
.header_top>p {
    color: #fff;
    text-align: center;
    font-size: 2.5vw;
    display:inline;
}
.header_top>.return {
   display: block;
    margin-left: 40px;
    float: left;
    color: #fff;
    line-height: 50px;
    margin-top: 21px;
    text-decoration: none;
}
.header_top>.return img{    height: 40px;
   
}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false>
	<div class="contain">
	 <div class="header_top">
             <a class="return" href="javascript:history.go(-1)">
                 <img src="${basePath}static/web/img/returnicon.png" alt="">
            </a>
	        <p>${title }</p>         
	     </div>
	<div class="showView">
		<a id="viewerPlaceHolder"></a>
	</div>
	<div class="contain">

	<input class="groupid" type="hidden" value="${groupid}">
	<input class="menuid" type="hidden" value="${menuid}">
</body>
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }static/layer/layer.js"></script>
<script type="text/javascript"
	src="${basePath }static/FlexPaper_1.5.1_flash/js/jquery.js"></script>
<script type="text/javascript"
	src="${basePath }static/FlexPaper_1.5.1_flash/js/flexpaper_flash.js"></script>
<script type="text/javascript"
	src="${basePath }static/FlexPaper_1.5.1_flash/js/flexpaper_flash_debug.js"></script>
<script>
	$(function(){
		QueryFlash();
		
		function QueryFlash(){
			
			formData={
					groupid:$(".groupid").val()	
			}
			$.ajax({
				url : "${basePath}rest/module/QueryFlash",
				type : "POST",
				data : formData,
				success : function(data) {
					var fp = new FlexPaperViewer(
							'../../FlexPaperViewer',
							'viewerPlaceHolder',
							{
								config : {
									SwfFile : escape('${basePathAfter}upload/'+ data.modulePpt.fileName),//编码设置  
									Scale : 0.6,
									ZoomTransition : 'easeOut',//变焦过渡  
									ZoomTime : 0.5,
									ZoomInterval : 0.2,//缩放滑块-移动的缩放基础[工具栏]  
									FitPageOnLoad : true,//自适应页面  
									FitWidthOnLoad : true,//自适应宽度  
									FullScreenAsMaxWindow : false,//全屏按钮-新页面全屏[工具栏]  
									ProgressiveLoading : false,//分割加载  
									MinZoomSize : 0.2,//最小缩放  
									MaxZoomSize : 3,//最大缩放  
									SearchMatchAll : true,
									InitViewMode : 'Portrait',//初始显示模式(SinglePage,TwoPage,Portrait)  

									ViewModeToolsVisible : true,//显示模式工具栏是否显示  
									ZoomToolsVisible : true,//缩放工具栏是否显示  
									NavToolsVisible : true,//跳页工具栏  
									CursorToolsVisible : false,
									SearchToolsVisible : true,
									PrintPaperAsBitmap : false,
									localeChain : 'en_US'
								}
							});
				}
			});
		}
	});

</script>
</html>

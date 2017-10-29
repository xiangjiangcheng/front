<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html class="no-js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>相册</title>
<link rel="stylesheet" href="${basePath}static/web/css/front/public.css">
<link rel="stylesheet" href="${basePath}static/web/css/front/peixunjihua.css">
<link rel="stylesheet" href="${basePath }static/web/css/front/reset.css" media="screen" />
<link rel="stylesheet" href="${basePath }static/web/css/front/jq22.css" media="screen" />
<link rel="stylesheet" href="${basePath }static/web/css/front/css3_3d.css" media="screen" />

<script>

/* if (!Modernizr.csstransforms) {

	$(document).ready(function(){

		$(".close").text("Back to top");

	});

} */

</script>

</head>

<body oncontextmenu=self.event.returnValue=false>
<div class="contain">
 <div class="header_top">
             <a class="return" href="javascript:history.go(-1)">
                 <img src="${basePath}static/web/img/returnicon.png" alt="">
             </a>
	          <p class="showMyTitle">相册展示</p><!--标题在这  -->
	     </div>
 <div class="main">
<div id="container">
   <ul id="grid" class="group album">
   </ul>

  <ul id="information">
  </ul>

<input class="albumid" type="hidden" value="${albumid}">

</div>
</div>
</div>
</body>

<script type="text/javascript" src="${basePath }static/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath }static/web/js/modernizr.js"></script>
<script>

$(function(){
	 
	$.ajax({
		type : "post",
		dataType : "json",
		data:{
			albumid : $(".albumid").val()
		},
		url : "${basePath }rest/photo/showPhotoDetil",
		success:function(data){
			console.log(data)
			var albumImgs=data.albumImgs;
            for(i=0;i<albumImgs.length;i++){
				var k=i+1;
				$('.album').append('<li>'
			               +' <div class="details">'
                           +'<h3>'+albumImgs[i].realname+'</h3></div>'
                           +'<a href="#info'+k+'"><img src="${basePathAfter}static/web/img/photo/'+albumImgs[i].filename+'"/></a> </li>');
				$('#information').append(
						' <li id="info'+k+'">'
                            +'<div>  <h3>'+albumImgs[i].realname+'</h3><img src="${basePathAfter}static/web/img/photo/'+albumImgs[i].filename+'"/> <a href="#" class="close">×</a></div>'
			               +'<span class="backface"></span></li>'
	                 )
				
			}
            $('.album li').each(function(){
            	$(this).click(function(){
              $('.return').attr("href","javascript:history.go(-3)")
            })
            })
		}
	});
});
</script>
</html>


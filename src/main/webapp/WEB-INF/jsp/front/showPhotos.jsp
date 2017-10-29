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
</head>

<body>
<div class="contain">
<div class="header_top">
             <a class="return" href="javascript:history.go(-1)">
                 <img src="${basePath}static/web/img/returnicon.png" alt="">
             </a>
	          <p class="showMyTitle">相册管理</p><!--标题在这  -->
	     </div>
<div class="main">     
	<div id="container">
	   <ul id="grid" class="group album">
	  </ul>
	 <input class="groupid" type="text" value="${groupid}" hidden="true">
	</div>
	</div>
</div>
</body oncontextmenu=self.event.returnValue=false>
	<script type="text/javascript"  src="${basePath }static/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"  src="${basePath }static/bootstrap/js/bootstrap.min.js"></script>
    <script>
  
	$(function(){
		var groupid = $(".groupid").val();
		$.ajax({
			type : "post",
			dataType : "json",
			data:{
				groupid : groupid
			},
			url : "${basePath }rest/photo/showPhoto",
			success:function(data){
				var albums=data.albums;
			     var html="";
			     for(i=0;i<albums.length;i++){
				    	 var   remark=albums[i].remark.split(",");
				         var   picnum=remark[0];
				    	 var   picurl=remark[1]; 
				    	 if(picurl==""||picurl==undefined){
				    		 picurl="shezhi_bg.png";
				    	 }
                         html='<li>'
				               +' <div class="details">'
                               +'<h3>'+albums[i].name+'</h3>' 
                               +'<a class="more" href="#info9">共'+picnum+'张</a> </div>'
                               +'<a href="${basePath }rest/photo/showPhotoDetails?id='+albums[i].id+'"><img src="${basePathAfter}static/web/img/photo/'+picurl+'"/></a> </li>'
				        $('.album').append(html);  
			  }
			}
	})
	})
</script>
</html>


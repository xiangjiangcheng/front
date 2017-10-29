<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${title }</title>
<style>
html,body{width:100%;height:100%;margin:0;padding:0;overflow-x:hidden;font-family:"microsoft yahei"}
div{margin:0;padding:0;}
body{
	text-align:center;
	padding-top:100px;
	
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
.contain{height:100%;width:100%;}

.header_top>.return {
    display: block;
    margin-left: 5%;
    float: left;
    position: absolute;
    height: 40px;
    line-height: 40px;
    top: 21px;
}
.header_top>.return img{    height: 40px;
  
}
</style>
</head>
<body  oncontextmenu=self.event.returnValue=false style="padding-top:0">
  <div class="contain">
  <div class="header_top">
             <a class="return" href="javascript:history.go(-1)">
                 <img src="${basePath}static/web/img/returnicon.png" alt="">
              </a>
	         <p class="showMyTitle"> ${title}</p>       
	     </div>
	     
  <iframe src="${link}" border=0 width=100% height=100% frameborder=0 marginheight=0 marginwidth=0 scrolling=no></iframe>
  </div>
</body>
 
</html>
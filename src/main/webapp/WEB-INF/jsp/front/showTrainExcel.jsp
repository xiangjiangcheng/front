<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>培训计划</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap-theme.min.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap-select.css" media="screen">
<link rel="stylesheet" href="${basePath}static/web/css/front/public.css">
<link rel="stylesheet" href="${basePath}static/web/css/front/peixunjihua.css">
<link rel="stylesheet" href="${basePath}static/web/css/base.css">
<style>
	th,td{height: 30px;}
	.leftLabel{font-size: 20px;}
	.time{float:left;position: relative;margin-left:5%;height:45px;line-height:45px;margin-top:15px;}
	.yearpicker{display:inline-block;position:relative;}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false>
	<div class="contain">
	     <div class="header_top">
             <a class="return" href="javascript:history.go(-1)">
                 <img src="${basePath}static/web/img/returnicon.png" alt="">
             </a>
	          <p class="showMyTitle"></p><!--标题在这  -->
	     </div>
          <div class="header_bottom">
             <div class="time">
                  <span class='tag'>时间：</span>
                 <div class="yearpicker">
                 <select name="" id="years" class="selectpicker" ></select>
                 </div>
                 
                 <select name="" id="month" class="selectpicker" >
                 		<option value="1">1月</option><option value="2">2月</option><option value="3">3月</option><option value="4">4月</option>
				    	<option value="5">5月</option><option value="6">6月</option><option value="7">7月</option><option value="8">8月</option>
				    	<option value="9">9月</option><option value="10">10月</option><option value="11">11月</option><option value="12">12月</option>
                 </select>
             </div>
	     </div>
    <div class="main">
    	<!-- <label class="showMyTitle col-md-12"></label> -->
        <div class="tab_sumary">
	        <div class="tables">
	      <table align="center" class="tab_sumary">
	        <tr id="showTh" style="background:#43c0b5;"></tr>
	        <tbody id="showMyTbody"></tbody>
	      </table>
	      </div>
  		</div>
	</div>
		<!--日期 ，年月日 -->
		<input type="hidden" id="hiddenYear" name="year">
		<input type="hidden" id="hiddenMonth" name="month">
		<input type="hidden" id="hiddenDay" name="day">
	<div id="appendDiv"></div>
	</div>
    <script src="${basePath}static/bootstrap/js/jquery.min.js"></script>
    <script src="${basePath}static/bootstrap/js/bootstrap.min.js"></script>
	<script src="${basePath}static/bootstrap/js/bootstrap-select.js"></script>
	<script src="${basePath}static/layer/layer.js"></script>
	<script type="text/javascript">
	var isFirstTime = "true";
	$(function(){
		//初始化时间
		initTime();
		
		//页面初始化
		initTable();
		initHeight();
		
		$("#years").change(function(){
			initTable();
			initHeight();
		});
		$("#month").change(function(){
			initTable();
			initHeight();
		});
		
		
		
		
		
	});
	
	function initHeight(){
		var brower=$(window).height();
		var header_top=$(".header_top").height();
		var header_bottom=$(".header_bottom").height();
		var content=$(".main").height();
		var appHeight=brower-header_top-header_bottom-content-50;
		$("#appendDiv").css("height",appHeight+"px");
	}
	
	function initTable(){
		var sendData={
				menuid:"${menuid}",
				year:$("#years").val(),
				month:$("#month").val(),
				firsttime:isFirstTime
		}
		$.ajax({
			data:sendData,
			type:'post',
			async:false,
			dataType:'json',
			url:'${basePath}rest/moduletable/previewPlan',
			success:function(data){
				var title=data.title,map=data.map;
				var head='',content='';
				if(title!=undefined){
					showTitle=data.showTitle;
					$(".showMyTitle").empty().append(showTitle);
					
					for(var i in title){
						if(i==1){
							head+='<th style="padding-left:5%;text-align:left;">'+title[i]+'</th>'	
						} else {
							head+='<th>'+title[i]+'</th>'
						}
						
					}
					for(var i in map){
							content+='<tr>'
							for(var j in map[i]){
								if(j==1){
									content+='<td align="left" style="padding-left:5%;text-align:left;">'+map[i][j]+'</td>'	
								} else {
									content+='<td >'+map[i][j]+'</td>'
								}
								
							}
							content+='</tr>'
					}
					$("#showMyTbody").empty().append(content);
					$("#showTh").empty().append(head);
				}else{
					$("#showMyTbody").empty();
					$("#showTh").empty();
					$(".showMyTitle").empty().append("培训计划");
					layer.msg("没有数据哦~请重新选择时间~");
				}
				isFirstTime="false";
			}
		})
	}
	
	function initTime(){
		//初始化了时间
		var date=new Date();
		var years=date.getFullYear();
		years=years-5;
		var html=''
		for(var i=0;i<=7;i++){
			
			if(i==5){
				html+='<option value="'+(years)+'" selected>'+(years++)+'年</option>'
			}else{
				html+='<option value="'+(years)+'">'+(years++)+'年</option>'
			}
		}
		$("#years").empty().append(html);
		$("#years").after('<span class="arricon"></span>');
		
		
		var month=date.getMonth()+1;
		$("#month option").each(function(){
			var myMonth=$(this).val();
			if(myMonth==month){
				$(this).attr("selected",true);
			}
		});
	}
	</script>
</body>
</html>
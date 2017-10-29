<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>员工动态</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap-theme.min.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap-select.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/datepicker.css" media="screen">
<link rel="stylesheet" href="${basePath}static/web/css/front/public.css">
<link rel="stylesheet" href="${basePath}static/web/css/front/peixunjihua.css">
<link rel="stylesheet" href="${basePath}static/web/css/base.css">
<style>
	th,td{height: 30px; width:10%;}
	#showIssue{color:#EC3838;}
	.time{float:left;position: relative;margin-left:5%;height:45px;line-height:45px;margin-top:15px;}
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
                 <span class="tag">时间：</span>
                 <div class="input-append date datetime">
                 <input type="text" value=" " name="time-start" class="time-input" id="showMyTime" readonly>
                 <span class="add-on"><i class="icon-th"></i></span>
                </div>
	     </div>
	     </div>
    <div class="main">
    
        <div class="tab_content">
	        <div class="tables">
	      <table align="center" class="tab_sumary">
	        <tr id="showTh" style="background:#43c0b5;"></tr>
	        <tbody id="showMyTbody"></tbody>
	      </table>
	      <div id="showIssue"></div>
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
	<script src="${basePath}static/bootstrap/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
	var isFirstTime = "true";
	$(function(){
		//初始化时间
		initTime();
		
		$(".datetime").datepicker({
			language:'zh-CN',
			format:"yyyy-mm-dd",
			autoclose:1,
		
			todayHighlight:1,
			minView:"month"
		});
		$("#showMyTime").change(function(){
			var date=$(this).val();
			var ss=date.split("-");
			$("#hiddenYear").val(ss[0]);
			$("#hiddenMonth").val(ss[1]);
			$("#hiddenDay").val(ss[2]);
			initTable();
		});
		
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
				year:$("#hiddenYear").val(),
				month:$("#hiddenMonth").val(),
				day:$("#hiddenDay").val(),
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
						head+='<th>'+title[i]+'</th>'
					}
					for(var i in map){
							content+='<tr>'
							for(var j in map[i]){
								content+='<td >'+map[i][j]+'</td>'
							}
							content+='</tr>'
					}
					$("#showMyTbody").empty().append(content);
					$("#showTh").empty().append(head);
				}else{
					$("#showMyTbody").empty();
					$("#showTh").empty();
					$(".showMyTitle").empty().append("员工动态");
					$("#showIssue").empty();
					layer.msg("没有数据哦~请重新选择时间~");
				}
				isFirstTime="false";
			}
			
		})
	}
	
		function initTime(){
			var myDate=new Date();
			//获取当前年
			var year=myDate.getFullYear();
			//获取当前月
			var month=myDate.getMonth()+1+"";
			if(month.length==1){
				month="0"+month
			}
			//获取当前日
			var date=myDate.getDate()+"";
			if(date.length==1){
				date="0"+date
			}
			$("#showMyTime").val(year+"-"+month+"-"+date);
			$("#hiddenYear").val(year);
			$("#hiddenMonth").val(month);
			$("#hiddenDay").val(date);
		}
	
	</script>
</body>
</html>
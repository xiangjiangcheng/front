<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>员工考勤</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap-theme.min.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap-select.css" media="screen">
<link rel="stylesheet" href="${basePath}static/web/css/front/public.css">
<link rel="stylesheet" href="${basePath}static/web/css/front/peixunjihua.css">
<style>
    th,td{height: 30px;}
	.time{float:left;position: relative;margin-left:5%;height:45px;line-height:45px;margin-top:15px;}
	.monthpicker,.yearpicker{display:inline-block;position:relative;}
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
                  <div class="yearpicker">
                 <select name="" id="years" class="selectpicker" ></select>
                 </div>
                 <div class="monthpicker">
                 <select name="" id="month" class="selectpicker">
                     <option value="1">1月</option>
                     <option value="2">2月</option>
                     <option value="3">3月</option>
                     <option value="4">4月</option>
                     <option value="5">5月</option>
                     <option value="6">6月</option>
                     <option value="7">7月</option>
                     <option value="8">8月</option>
                     <option value="9">9月</option>
                     <option value="10">10月</option>
                     <option value="11">11月</option>
                     <option value="12">12月</option>
                      
                 </select>
                 </div>
             </div>
	     </div>
    <div class="main">
    	<!-- <label class="showMyTitle col-md-12"></label> -->
    	  
        <div class="tab_content">
       
	        <div class="tables">
	      <table align="center" class="tab_sumary">
	        <tr id="showTh" style="background:#43c0b5;"></tr>
	        <tbody id="showMyTbody"></tbody>
	      </table>
	 
	      </div>
  		</div>
	</div>
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
				var end=false;
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
								if("记录符号"==map[i][j]){
									/* content+='</tr>' */
									end=true ;
									break;
								}
								content+= '<td >'+map[i][j]+'</td>'
							}
							if(end){
								break;
							}
							content+='</tr>'
					}
					  var showIssue='<tr style="background:#43c0b5;"> <th colspan="2" rowspan="2" style="background:#43c0b5;">记录符号</th><th colspan="2">出勤</th><th colspan="2">公处</th><th colspan="2">学习</th><th colspan="2">补休</th><th colspan="2">公假</th><th colspan="2">探亲假</th><th colspan="2">婚假</th><th colspan="2">产假</th><th colspan="2">丧假</th><th colspan="2">公伤</th><th colspan="2">病假</th><th colspan="2">事假</th><th colspan="2">迟到早退</th><th colspan="2">旷工</th><th colspan="2">年休假</th> </tr>'+
							  '<tr><td colspan="2">○</td><td colspan="2">√</td><td colspan="2">①</td><td colspan="2">/</td><td colspan="2">|</td><td colspan="2">△</td><td colspan="2">②</td><td colspan="2">ⓧ</td><td colspan="2">▽</td><td colspan="2">±</td><td colspan="2">0</td><td colspan="2">*</td><td colspan="2">φ</td><td colspan="2">×</td><td colspan="2">⊙</td></tr>';
				          content+=showIssue;
					$("#showTh").empty().append(head);
					$("#showMyTbody").empty().append(content);
					$("#showIssue").empty().append("待修改");
				}else{
					$("#showMyTbody").empty();
					$("#showTh").empty();
					$(".showMyTitle").empty().append("员工考勤");
					$("#showIssue").empty();
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
			years=years-2;
			var html=''
			for(var i=0;i<=4;i++){
				
				if(i==2){
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
			})
			$("#month").after('<span class="arricon"></span>');
		}
	
	</script>
</body>
</html>
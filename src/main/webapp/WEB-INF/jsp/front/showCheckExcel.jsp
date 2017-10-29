<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>绩效考核</title>
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
.tab_sumary {
    width: 75%;
    margin-left: 0;}
.showPre{padding: 0; text-align: center;}
#showName{margin-left: 30.4px;background: #43c0b5;text-align: center;color: #fff;padding: 5px;height: 30.4px;}
.showCol{    width: 30px;
    height: 170px;
    font-size: 20px;
    font-weight: 700;
    text-align: center;}
.showGet{background:#e2ecf2;height: 30.4px;text-align: center;width: 100%;padding-top: 5px;}
.showSet{background:#fff;height: 30.4px;text-align: center;width: 100%;padding-top: 5px;}
.showPre{
	position:relative;
}
.showCol{
	float: left;
	height:100%;
}
.showMonth{
	height: 60px;
    float: left;
 
    align-items: center;
  
    background: #43c0b5;
    width: 20%;
    border-bottom: 1px solid #fff;
 
    vertical-align: middle;
    line-height: 60px;
    color: #fff;
}
.info{
	margin-left: 30px;
}
.main{padding-top: 0px !important;} 
.showCol span{display: flex;
    align-items: center;}
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
                 <select name="" id="years" class="selectpicker" ></select>
             </div>
	     </div>
   <div class="main">
    	
	    <div class="tables">
	    <div class ="showMyTitle" style ="width: 5%;float: left;height: 100%;color: #000;margin-top: 20%;font-weight: 700;font-size: 29px;text-align: -webkit-center;text-align: center;"></div>
	         <table align="center" class="tab_sumary" cellspacing="0" cellpadding="0" style ="margin-left: 2%;width: 20%;float: left;">
	        	<tbody>
	        	<tr style="background:#43c0b5;">
	        	<th></th>
	        	<th>姓名</th>
	        	</tr>
	        	</tbody>
	        	<tbody>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">1月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">2月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">3月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">4月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">5月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">6月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">7月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">8月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">9月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">10月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">11月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	<tr>
	        	<td rowspan="2" Style="border-bottom:1px solid #fff ;background: #43c0b5;color:#fff;">12月</td>
	        	<td>得分</td>
	        	</tr>
	        	<tr>
	        	<td>加减分情况</td>
	        	</tr>
	        	</tbody>
	        	</table>
	        <table align="center" class="tab_sumary" cellspacing="0" cellpadding="0" style ="width: 73%;float: left;">
	        	<tbody>
	        	<tr id="showTh" style="background:#43c0b5;">
	        	</tr>
	        	</tbody>
	        	<tbody id="showMyTbody">
	        	</tbody>
	      </table>
		</div>
	</div>
	<div id="appendDiv"></div>
	
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
                            head+='<th >'+title[i]+'</th>'
                       }
                       for(var i in map){
                            content+='<tr>'
                            for(var j in map[i]){
                                 content+='<td >'+map[i][j]+'</td>'
                            }
                            content+='</tr>'
                       }
                       
                       
                       var pre='<div id="showName">姓名</div><div class="showCol"><span >绩效考核情况</span></div>'
                                 for(var i=1;i<=12;i++){
                                       pre+='<div class="info"> <div class="showMonth">'+i+'月</div><div class="showGet">得分</div><div class="showSet">加减分情况</div></div>'
                                 }
                       $("#showMyTbody").empty().append(content);
                       $("#showTh").empty().append(head);
                       $(".showPre").empty().append(pre);
                       $(".showCol").height($(".showPre").outerHeight());
                       $(".showCol span").height($(".showPre").outerHeight());
                 }else{
                       $("#showMyTbody").empty();
                       $("#showTh").empty();
                       $(".showMyTitle").empty().append("绩效考核");
                       $(".showPre").empty();
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
            $("#years").after('<span class="arricon"></span>')
            var month=date.getMonth()+1;
            $("#month option").each(function(){
                 var myMonth=$(this).val();
                 if(myMonth==month){
                       $(this).attr("selected",true);
                 }
            })
       }

	</script>
</body>
</html>
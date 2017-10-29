<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>工作总结</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap-theme.min.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/bootstrap-select.css" media="screen">
<link rel="stylesheet" href="${basePath}static/bootstrap/css/datepicker.css" media="screen">
<link rel="stylesheet" href="${basePath}static/web/css/front/public.css">
<link rel="stylesheet" href="${basePath}static/web/css/front/peixunjihua.css">
<style>
	.input-group[class*=col-] {
    float: left;
    padding-right: 0;
    padding-left: 0;
}
.glyphicon {
    color:#43c0b5;
    position: relative;
    top: 1px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: 400;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.datepicker{
    width: 172px;
    height: 40px;
    border: none;
}
.row {
    margin-right: -15px;
    margin-left: 5%;
    margin-top: 20px;
}
.into{
    float: left;
        margin-left: 18px;
    height: 34px;
    line-height: 34px;
}
.add_intribute{
    margin-left: 25px;
    margin-top: -19px;
}
.form-group>.timer{
    float:left;
    line-height:34px;
    margin-right: 10px;
        font-weight: 100;
}
.tab_sumary{
    width:100%;
    text-align: center;
}
.tab_sumary tr th{
   text-align: center;
    color:#fff;
    padding:5px;
}
.tab_sumary tr:nth-child(even){
        background:#fff;
    }
    .tab_sumary tr:nth-child(odd){
        background:#e2ecf2;
    }
.table_bottom{
    text-align: -webkit-left;
    text-align:left;
    color:#ea7073;
}
.left{
    text-align: left;
}
.table_bottom>.problem{
    position: absolute;
}
.pro_one{
    margin-left: 90px;
}
caption{
    color:#43c0b5;
    font-weight: 700;
    font-size: 2vw;
}
.tables{
    width: 100%;
    padding: 20px 40px;
}
.tab_sumary tr td{
    padding:5px;
}
.datepicker-days{
display: block;
    background: rgb(255, 255, 255);
    border: 1px solid rgb(204, 204, 204);
}
#showIssue{
    color:#e4393c;
        float: left;
}
.datepicker .today{
display:none;}
#showTh th:nth-child(2){
      text-align:left;
      padding-left:5%;
} 
#showMyTbody tr td:nth-child(2){
      text-align:left;
} 
#showIssue .problems{
    float: left;
    margin-left: 20px;
}
#showIssue .problem{
    text-align: -webkit-left;
    float: left;
    margin-left: 110px;
    margin-top: -19px;
}
.table th{
text-align: center ;
}
.input-group-addon {
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1;
    color: #555;
    text-align: center;
    background-color: #eee;
    /* border: 1px solid #ccc; */
    border-radius: 4px;
}
.file1{
border: none;
    height: 40px;
    padding-left: 10px;
    outline: none;
    border: 1px solid #ccc;
    border-right: none;
    border-radius: 4px;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    }
</style>
</head>
<body oncontextmenu=self.event.returnValue=false>
	<div class="contain">
	     <div class="header_top">
             <a class="return" href="javascript:history.go(-1)">
                 <img src="${basePath}static/web/img/returnicon.png" alt="">
             </a>
	          <p class="showMyTitle">工作总结</p>
	     </div>
         <div class="header_bottom">
            <form action="" class="form-horizontal"  role="form">
        <fieldset>
            <div class="row">
                <div class="form-group" style="float:left;">
                <label for="dtp_input2" class="timer">时间:</label>
                <div class="datepicker input-group date form_date col-md-2 col-lg-2 col-sm-2 col-xs-2" data-date="" data-date-format="dd MM yyyy"  data-link-format="yyyy-mm-dd">
                    <input type="text" class="file1" name ="file1" placeholder="请选择日期" value =""/>
                     <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                
                <div class="into">-</div>
                <div class="datepicker input-group date form_date col-md-2 col-lg-2 col-sm-2 col-xs-2 add_intribute" data-date="" data-date-format="dd MM yyyy"  data-link-format="yyyy-mm-dd" style="margin-top: 0px;">
                   <input type="text" class="file1" name ="file2" placeholder="请选择日期"  value =""/>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                
            </div>
            </div>
        </fieldset>
    </form>

	     </div>
    <div class="main">
      <div class="tab_sumary">
	    	<div class="tables">
		      <table align="center"  class="tab_sumary">
		        <tr id="showTh" align="center" style="background:#43c0b5;">
		        </tr>
		        <tbody id="showMyTbody">
		        <tr id="showTh" align="center" style="background:#43c0b5;">
		        </tr>
		        </tbody>
		      </table>
		      <div id="showIssue">
		      <span class="problems"></span>
		      <span class="problem"></span>
		      </div>
	      </div>
  		</div>
	</div>
	<div id="appendDiv"></div>
	</div>
    <script type="text/javascript" src="${basePath}static/bootstrap/js/jquery.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${basePath}static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath}static/bootstrap/js/bootstrap-datepicker.js" charset="UTF-8"></script>
	<script src="${basePath}static/layer/layer.js"></script>
	<script type="text/javascript">
	var isFirstTime = "true";
                	$(function () {
         				$(".input-group").click (function (){
         					console.log ($(".datepicker ").html());
         					$(".datepicker-days").css("display","block");
         				});
                        $(".datepicker").datepicker({
                            language: "zh-CN",
                            autoclose: true,//选中之后自动隐藏日期选择框
                            clearBtn: true,//清除按钮
                            todayBtn: false,//今日按钮
                            format: "yyyy-mm-dd"//日期格式，详见 http://bootstrap-datepicker.readthedocs.org/en/release/options.html#format
                        });
                    });
   
                	$(function(){  
                		getExcelForTime();
                		$("[name=file1]").change(function () {//文件改变的时候触发异步提交表单事件。
                			getExcelForTime();
                			
                		})
                		$("[name=file2]").change(function () {//文件改变的时候触发异步提交表单事件。
                			getExcelForTime();
                		})
                		function getExcelForTime(){
                	         var timeStart =$("[name=file1]").val();
                	         var timeEnd   =$("[name=file2]").val();
                	/*          function getDate(add ) {
                	         var date =new Date (timeStart);
                	         date.setDate (date.getDate ()+add);
                	         var y = date.getFullYear(); 
                	          console.log (y);
                	          var m = (date.getMonth ()+1)<10?('0'+parseInt(date.getMonth ()+1)):(parseInt(date.getMonth ()+1));
                	         var d  = date.getDate ()<10?('0'+date.getDate ()):date.getDate ();
                	         return y+"-"+m+"-"+d;
                	         console.log (y+"-"+m+"-"+d ); 
                	         }
                	         $("[name=file2]").val(getDate(7) );
                	          */
                	         $.ajax({
                	        	data:{'timeStart':timeStart,'timeEnd':timeEnd,menuid:"${menuid}",'firsttime':isFirstTime},
                				type:'post',
                				async:false,
                				dataType:'json',
                				url:'${basePath}rest/moduletable/previewExcelBystartAndEnd',
                				success:function(data){
                					console.log (data);
                					var title=data.title,map=data.map;
                					
                					var head='',content='';
                					if(title!=undefined){
                						showTitle=data.showTitle;
                						$(".showMyTitle").empty().append(showTitle);
                						
                						for(var i in title){
                							if(i==1){
                								head+='<th align="left" >'+title[i]+'</th>'
                							}else{
                							head+='<th>'+title[i]+'</th>'
                							}
                						}
                						for(var i in map){
                							/* console.log (map); */
                							
                								content+='<tr>'
                								for(var j in map[i]){
                									if("存在的问题"==map[i][j]){
                										$("#showIssue>.problems").empty().append(map[i][j]+':');
                										$("#showIssue>.problem").empty().append(map[i][j*1+1]);
                										break;
                									}
                									if(i>0&&j==1){
                										content+='<td align="left" style="padding-left:5%">'+map[i][j]+'</td>';
                										
                									}else{
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
                						$(".showMyTitle").empty().append("工作总结");
                						$("#showIssue").empty();
                						layer.msg("没有数据哦~请重新选择时间~");
                					}
                					isFirstTime="false";
                				}
                				
                			});
                		};
                	});	
/*     	 $("[name=file2]").change(function () {//文件改变的时候触发异步提交表单事件。
    		 var timeEnd  =$(this).val();
             console.log(timeEnd );
        
 });
 */         
 
    /* }) */
 	/* $(function(){
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
		 

				var timeStart=$(".timeStart").val();
				var timeEnd=$(".timeEnd").val();
		
		
		$.ajax({
			data:timeStart,
			type:'post',
			async:false,
			
			dataType:'json',
			url:'${basePath}rest/moduletable/previewPlan',
			success:function(data){
				console.log(data);
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
								if("存在的问题"==map[i][j]){
									$("#showIssue").empty().append("存在的问题："+map[i][j*1+1])
									break;
								}
								content+='<td align="left" style="padding-left:5%">'+map[i][j]+'</td>'
							}
							content+='</tr>'
					}
					$("#showMyTbody").empty().append(content);
					$("#showTh").empty().append(head);
				}else{
					$("#showMyTbody").empty();
					$(".showMyTitle").empty().append("工作总结");
					$("#showTh").empty();
					$("#showIssue").empty();
					layer.msg("没有数据哦~请重新选择时间~");
				}

			}
			
		})
	}
	 */
	
	/* function initTime(){  
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
			$("#week").after('<span class="arricon"></span>');
		}
	 */
	</script>
</body>
</html>
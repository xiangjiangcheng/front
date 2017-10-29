<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<title>主页</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${basePath }static/web/css/base.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${basePath }static/bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="${basePath }static/web/css/front/public.css">
<link rel="stylesheet" href="${basePath }static/web/css/front/index.css">
<style>
.content{height:95%;clear:both}

.weichuangxin{
	z-index:1;
}
.img{
	z-index:22;
}
</style>
</head>
<body oncontextmenu=self.event.returnValue=false>
	<div class="contain">
	  <div class="contain_wrap">
		<div class="header_top">
		    <div class="header_logo"></div>
            <div class="xiaokanban">
			 <div class="head_lbg"></div>
			 <div class="head_rbg"></div>
			</div>
			
        </div>
		<div class="little_title"></div>
		<div class="row content">
         <div class="first_line">
           <div class="card_box"></div>
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

			var src = location.href;
			var index = src.lastIndexOf("\/");
			var id = src.substring(index + 1, src.length);
			if (id != "") {
				var index2 = id.lastIndexOf("=");
				var id2 = id.substring(index2 + 1, id.length);
				$.ajax({
							type : "post",
							dataType : "json",
							url : "${basePath }rest/indexhome/judgebz/" + id2,
							success : function(data) {
								var list = data.result;
								var title = data.title;
								var background = data.BigBackground;
								
								// 填充班组下拉框
								// http://${ipAddress }:8080/front?id=${groupid }
								var ipAddress = data.ipAddress;
								var groupList = data.groupList;
								var stHtml = "";
								for (i = 0; i < groupList.length; i++) {
									stHtml += "<option value='"+groupList[i].id+"'>"+groupList[i].groupname+"</option>";
								}
								var titleHtml = title.title1+"<select id='groupSt' style='color: #FFFFFF;background-color: "+title.groupStBgcolor+";font-size: medium;width: 10%;height: 3%;right: 6.5%;position: absolute;top: 2vw;border-radius:3px;'>"+stHtml+"</select>";
								$(".head_rbg").html(titleHtml);
								// 设置选中当前班组
								$("#groupSt").val(data.nowgroupid);
								// 给班组下拉框设置事件
								$("#groupSt").change(function(){
									// 得到班组的id
									var groupid = $(this).val();
									//alert("切换"+groupid);
									window.location = "http://"+ipAddress+":8080/front?id="+groupid;
								});
								
								$(".little_title").html(title.title2);
								
								$(".contain").css("background-image","url('${basePath}../display/static/web/img/bg/"+background.bgname+"')");
								var html = "";
								var html1 = "";
								var html2 = "";
						
								for (var i = 0; i < list.length; i++) {
									
									if (list[i][0].size == 2) {
										/* ${bacePath }rest/moduleRich/tolist?id="+id2+"&title='"+list[i][0].title+"' */
										html1 = "<div class='big_box box' data-id='"+list[i][0].id+"'>"
												+ "<a class='link_url' href='#' > <div class='img_box'><img class='img img_spe'  src='${basePath}static/web/img/menuicon/"+list[i][2].iconname+"'/></div>"
												+ "<img class='weichuangxin higher'"+
						"src='${basePath}static/web/img/menubg/"+list[i][1].bgname+"'> <span "+
						"class='text_intro'>"
												+ list[i][0].title
												+ "</span></a></div>";
										html += html1;
									} else if (list[i][0].size == 1) {

										html2 = "<div class='little_box box' data-id='"+list[i][0].id+"'>"

												+ "<a class='link_url' href='#'> <div class='img_box'><img class='img' src='${basePath}static/web/img/menuicon/"+list[i][2].iconname+"'/></div>"
												+ "<img class='weichuangxin height_one'"+
						"src='${basePath}static/web/img/menubg/"+list[i][1].bgname+"'> <span "+
						"class='text_intro'>"
												+ list[i][0].title
												+ "</span></a></div>";
										html += html2;
									}
									
								}
							

								$(".card_box").append(html);
								
								//pan.zhu
								//2017-04-17 10:51:22
								$(".card_box .box").click(function(){
									var id=$(this).data("id");
									var background = $(".contain").css("background-image");
									background = background.replace(/"/g, "'");
									//alert(background);
									//跳转到下级页面；
									 location.href="${basePath}rest/page/getPageByMenuId?menuid="+id+"&&background="+background; 
									
								}); 
								
								// ajax 数据解析完后执行
                                        var w = $(window).width();
										var h = $(window).height();
										$('.contain_wrap').css({"width":w,"height":h});
							           $(".little_box").css('width',w*0.16);
										$(".big_box").css({"height": $(".little_box").css('width'),
											"width":w*0.34
										});
										var k=(0.95*h-0.32*w-0.08*0.95*h)/4;
                                    	$('.header_logo').html('<img src="${basePath}static/web/img/desklogo.png"/>')
										$('.head_lbg').html('<img src="${basePath}static/web/img/t_lbg.png" style="margin-top:-1px"/>')
										$(window).resize(function(){
										    w = $(window).width();
										    h = $(window).height();
										    k=(0.95*h-0.32*w-0.08*0.95*h)/4;
											$('.contain_wrap').css({"width":w,"height":h});
											$(".little_box").css('width',w*0.16);
											$(".big_box").css({"height": $(".little_box").css('width'),
												"width":w*0.34
											});
											$(".card_box").css("margin-top", k);
											$(".first_line").css({"width":w*0.9});
										})
										    $(".first_line").css({"width":w*0.9});
                         					$(".card_box").css("margin-top", k);
									
						},
							error : function() {
								parent.layer.msg("沒有你需要的内容");
							}
						});

			
				/* $(".contain").css("height", $(window).height()); */
				$(".higher").css("height", $(".height_one").css('width'));
				

			}

		});
		//当浏览器窗口大小改变时，设置显示内容的高度
		window.onresize = function() {
			$(".contain").css("height", $(window).height());
		}
	</script>
</html>

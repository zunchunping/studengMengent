<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>学生信息管理平台</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="<%=path%>/statics/css/StudentStyle.css" rel="stylesheet"
	type="text/css" />
<link href="<%=path%>/statics/js/jBox/Skins/Blue/jbox.css"
	rel="stylesheet" type="text/css" />
<link href="<%=path%>/statics/css/ks.css" rel="stylesheet"
	type="text/css" />
<script src="<%=path%>/statics/js/jBox/jquery-1.4.2.min.js"
	type="text/javascript"></script>
<script src="<%=path%>/statics/js/js/jBox/jquery.jBox-2.3.min.js"
	type="text/javascript"></script>
<script src="<%=path%>/statics/js/js/jBox/i18n/jquery.jBox-zh-CN.js"
	type="text/javascript"></script>
<script src="<%=path%>/statics/js/js/Common.js" type="text/javascript"></script>
<script src="<%=path%>/statics/js/jst/Data.js" type="text/javascript"></script>
<script type="text/javascript">
	$().ready(function() {
		setStudMsgHeadTabCheck();
		showUnreadSysMsgCount();
	});

	//我的信息头部选项卡
	function setStudMsgHeadTabCheck() {
		var currentUrl = window.location.href;
		currentUrl = currentUrl.toLowerCase();
		var asmhm = "";
		$("#ulStudMsgHeadTab li").each(function() {
			asmhm = $(this).find('a').attr("href").toLowerCase();
			if (currentUrl.indexOf(asmhm) > 0) {
				$(this).find('a').attr("class", "tab1");
				return;
			}
		});
	}

	//显示未读系统信息
	function showUnreadSysMsgCount() {
		var unreadSysMsgCount = "0";
		if (Number(unreadSysMsgCount) > 0) {
			$("#unreadSysMsgCount").html("(" + unreadSysMsgCount + ")");
		}
	}

	//退出
	function loginOut() {
		if (confirm("确定退出吗？")) {
			StudentLogin.loginOut(function(data) {
				if (data == "true") {
					window.location = "/Login.aspx";
				} else {
					jBox.alert("退出失败！", "提示", new {
						buttons : {
							"确定" : true
						}
					});
				}
			});
		}
	}
	//更改报考类别
	function changeCateory(thisObj, id) {
		var oldCateoryId = $("#cateoryId").val();
		var cateoryId = "";
		if (id != null) {
			cateoryId = id;
		} else {
			cateoryId = thisObj.val();
		}
		var studentId = $("#studentId").val();
		if (cateoryId.length <= 0) {
			jBox.tip("报考类别不能为空！");
			if (id == null) {
				thisObj.val(oldCateoryId);
			}
		} else {
			studentInfo.changeStudentCateory(cateoryId, function(data) {
				var result = $.parseJSON(data);
				if ((String(result.ok) == "true")) {
					window.location.href = "/Index.aspx";
				} else {
					jBox.tip(result.message);
				}
			});
		}
	}
</script>

<script type="text/javascript">
	function submitMail() {
		var mtitle = "联系方式有修改";
		var html = "<div style='padding:10px;'><div style='width:65px; height:120px; float:left;'>修改的地方：</div><div style='width:250px; height:120px; float:left;'><textarea id='objeCont' name='objeCont' style='width:250px; height:105px;'></textarea></div></div>";

		var submit = function(v, h, f) {
			if (f.objeCont == '' || f.objeCont.length > 80) {
				$.jBox.tip("请您输入有修改的地方，且不超过80个字！", 'error', {
					focusId : "objeCont"
				}); // 关闭设置 objeCont 为焦点
				return false;
			}

			StudentCompain.insertCompain('', mtitle, 5, f.objeCont, function(
					data) {
				var obj = $.parseJSON(data);
				var resultObj = false;
				if (obj.ok) {
					$.jBox.tip("成功提交联系方式的修改邮件！");
				}
			});
		};

		$.jBox(html, {
			title : "联系方式修改的邮件",
			submit : submit
		});
	}
</script>
</head>

<body>
	<div class="banner">
		<div class="bgh">
			<div class="page">
				<div id="logo">
					<a href="../Index.aspx.html"> <img
						src="<%=path %>/statics/Images/Student/logo.gif" alt="" width="165" height="48" />
					</a>
				</div>
				<div class="topxx">
					<select onchange="changeCateory($(this))"
						style="font-size: 11px; background: #4991cf;
                        color: #fff;">

						<option value="4">远程</option>

						<option selected='selected' value="1">自考</option>

					</select> 910513201419学员：邹智，欢迎您！ <a href="Index.aspx.html">我的信息</a> <a
						href="../User/StudentInfor/systemMsge.aspx.html"> 通知</a> <a
						href="../User/Account/ChangePasswd.aspx.html">密码修改</a> <a
						onclick="loginOut()" href="javascript:">安全退出</a>
				</div>
				<div class="blog_nav">
					<ul>
						<li><a href="../Index.aspx.html">我的信息</a>
						</li>
						<li><a href="../EducationCenter/Score.aspx.html">教务中心</a>
						</li>
						<li><a href="../MyAccount/wdcw.aspx.html">我的学费</a>
						</li>
						<li><a href="../OnlineTeaching/StudentMaterial.aspx.html">资料中心</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="page">
		<div class="box mtop">
			<div class="leftbox">
				<div class="l_nav2">
					<div class="ta1">
						<strong>个人中心</strong>
						<div class="leftbgbt"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="Index.aspx.html">我的信息</a>
						</div>
						<div>
							<a href="ClassInfo.aspx.html">班级信息 </a>
						</div>
						<div>
							<a href="../User/StudentInfor/Letter.aspx.html">短信息</a>
						</div>
						<div>
							<a href="../User/StudentInfor/systemMsge.aspx.html">学院通知</a>
						</div>
						<div>
							<a href="Objection.aspx.html">我的异议</a>
						</div>
					</div>
					<div class="ta1">
						<strong>教务中心</strong>
						<div class="leftbgbt2"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="../EducationCenter/Application.aspx.html">我的报考</a>
						</div>
						<div>
							<a href="../EducationCenter/Score.aspx.html">我的成绩</a>
						</div>
						<div>
							<a href="../EducationCenter/Book.aspx.html">我的书籍</a>
						</div>
					</div>
					<div class="ta1">
						<strong>学习中心</strong>
						<div class="leftbgbt2"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="../OnlineTeaching/StudentMaterial.aspx.html">资料下载</a>
						</div>
						<div>
							<a href="../OnlineTeaching/StudentStudyRecordList.aspx.html">学习历程</a>
						</div>
					</div>

					<div class="ta1">
						<strong>财务中心</strong>
						<div class="leftbgbt2"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="../MyAccount/wdcw.aspx.html">我的财务</a>
						</div>
					</div>
					<div class="ta1">
						<a
							href="http://www.csgb.net/login.aspx?userLoginName=2014&userName=邹智&professionId=F40C998A-D9AC-421F-99C9-C024C1DC53AD&flag=sm"
							target="_blank"><strong>教学系统</strong>
						</a>
						<div class="leftbgbt2"></div>
					</div>
				</div>
			</div>
			<div class="rightbox">

				<h2 class="mbx">我的信息 &gt; 个人资料 &nbsp;&nbsp;&nbsp;</h2>
				<div class="morebt">


					<ul id="ulStudMsgHeadTab">
						<li><a class="tab2" onclick="" href="Index.aspx.html">个人资料</a>
						</li>
						<li><a class="tab2" onclick="" href="ClassInfo.aspx.html">班级信息</a>
						</li>
						<li><a class="tab2" onclick=""
							href="../User/StudentInfor/Letter.aspx.html">短信息</a>
						</li>
						<li><a class="tab2" onclick=""
							href="../User/StudentInfor/systemMsge.aspx.html">通知<span
								style="color:#ff0000; padding-left:5px;" id="unreadSysMsgCount"></span>
						</a>
						</li>
						<li><a class="tab2" onclick="" href="Objection.aspx">我的异议</a>
						</li>
					</ul>

				</div>
				<div class="cztable">
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr>
							<td align="right" width="80">姓名：</td>
							<td>邹智&nbsp;</td>
							<td align="right" width="90">身份证号码：</td>
							<td>430181198612113330&nbsp;</td>

							<td rowspan="9"><div align="center">
									<img id="pic_face" height="160" width="120"
										src="<%=path%>/statics/Images/Student/photo.jpg"
										/ style="padding:2px 2px 5px; border:1px #ddd solid;">
								</div>&nbsp;</td>
						</tr>
						<tr>
							<td align="right">性别：</td>
							<td>男&nbsp;</td>
							<td align="right">考籍号：</td>
							<td>910513201419&nbsp;</td>
						</tr>
						<tr>
							<td align="right">报考类别：</td>
							<td>自考&nbsp;</td>
							<td align="right">报考学校：</td>
							<td>湖南大学&nbsp;</td>
						</tr>
						<tr>
							<td align="right">报考专业：</td>
							<td>经济法学&nbsp;</td>
							<td align="right">原专业：</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="right">报考层次：</td>
							<td>专本同读&nbsp;</td>

							<td align="right">注册批次：</td>
							<td>2013秋&nbsp;</td>
						</tr>
						<tr>
							<td align="right">报名时间：</td>
							<td>2013-08-16&nbsp;</td>
							<td align="right">状态：</td>
							<td>在读&nbsp;</td>
						</tr>

						<tr>
							<td colspan="4" align="left">联系方式（如联系方式有变动请及时修改，以便能及时联系到你。谢谢！）</td>

						</tr>
						<tr>
							<td align="right">手机号码：</td>
							<td>15111141999</td>
							<td align="right">第二联系号码：</td>
							<td></td>

						</tr>
						<tr>
							<td align="right">QQ:</td>
							<td></td>
							<td align="right">电子邮箱：</td>
							<td></td>

						</tr>
						<tr>
							<td align="right">联系地址：</td>
							<td colspan="4"></td>
						</tr>
						<tr align="center">
							<td colspan="5" height="40">
								<div align="center">

									<input type="button" id="button2" value="联系方式有修改"
										onclick="submitMail()" class="input2" />
								</div></td>
						</tr>
					</table>
				</div>

			</div>
		</div>
		<div class="footer">
			<p>&copy;copyright 2012 广博教育 csgb.net 版权所有 站长统计</p>
		</div>
	</div>
</body>
</html>

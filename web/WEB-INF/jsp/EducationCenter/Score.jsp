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
<link href="<%=path%>/statics/css/StudentStyle.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/statics/css/jBox/Skins/Blue/jbox.css" rel="stylesheet"
	type="text/css" />
<link href="<%=path%>/statics/css/ks.css" rel="stylesheet" type="text/css" />
<script src="<%=path%>/statics/js/jBox/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="<%=path%>/statics/js/jBox/jquery.jBox-2.3.min.js"
	type="text/javascript"></script>
<script src="<%=path%>/statics/js/jBox/i18n/jquery.jBox-zh-CN.js"
	type="text/javascript"></script>
<script src="<%=path%>/statics/js/Common.js" type="text/javascript"></script>
<script src="<%=path%>/statics/js/Data.js" type="text/javascript"></script>
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

<script src="../Script/Base.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
	function confirmStatus(sid, examtime, stype) {
		if (confirm("确定确认无误吗？") == true) {
			senateCenter.modifyStudentScoreStatus(sid, examtime, stype,
					function(data) {
						var result = $.parseJSON(data);
						if ((String(result.ok) == "true")) {
							jBox.alert(result.message, "提示");
							setTimeout(function() {
								window.location.reload();
							}, 1500);
						} else {
							$.jBox.error(result.message, '提示');
						}
					});
		}
	}

	function submitObjection(objId, examtime) {
		var mtitle = "成绩有异议";
		var html = "<div style='padding:10px;'><div style='width:65px; height:120px; float:left;'>异议内容：</div><div style='width:250px; height:120px; float:left;'><textarea id='objeCont' name='objeCont' style='width:250px; height:105px;'></textarea></div></div>";

		var submit = function(v, h, f) {
			if (f.objeCont == '' || f.objeCont.length > 80) {
				$.jBox.tip("请您输入异议内容，且不超过80个字！", 'error', {
					focusId : "objeCont"
				}); // 关闭设置 objeCont 为焦点
				return false;
			}

			StudentCompain.insertCompain('', mtitle, 2, f.objeCont, function(
					data) {
				var obj = $.parseJSON(data);
				var resultObj = false;
				if (obj.ok) {
					senateCenter.modifyStudentScoreStatus(objId, examtime, 3,
							function(data) {
								var result = $.parseJSON(data);
								if ((String(result.ok) == "true")) {
									jBox.alert("成功提交异议！", "提示");
									setTimeout(function() {
										window.location.reload();
									}, 1500);
								} else {
									jBox.tip("提交异议失败！");
									return false;
								}
							});
				} else {
					jBox.tip("提交异议失败！");
				}
			});
		};

		$.jBox(html, {
			title : "提交异议",
			submit : submit
		});
	}
</script>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div class="banner">
		<div class="bgh">
			<div class="page">
				<div id="logo">
					<a href="../Index.aspx.html"> <img
						src="<%=path%>/statics/Images/Student/logo.gif" alt="" width="165" height="48" />
					</a>
				</div>
				<div class="topxx">
					<select onchange="changeCateory($(this))"
						style="font-size: 11px; background: #4991cf;
                        color: #fff;">

						<option value="4">远程</option>

						<option selected='selected' value="1">自考</option>

					</select> 910513201419学员：邹智，欢迎您！ <a href="../MyInfo/Index.aspx.html">我的信息</a>
					<a href="../User/StudentInfor/systemMsge.aspx.html"> 通知</a> <a
						href="../User/Account/ChangePasswd.aspx.html">密码修改</a> <a
						onclick="loginOut()" href="javascript:">安全退出</a>
				</div>
				<div class="blog_nav">
					<ul>
						<li><a href="../Index.aspx.html">我的信息</a>
						</li>
						<li><a href="Score.aspx.html">教务中心</a>
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
							<a href="../MyInfo/Index.aspx.html">我的信息</a>
						</div>
						<div>
							<a href="../MyInfo/ClassInfo.aspx.html">班级信息 </a>
						</div>
						<div>
							<a href="../User/StudentInfor/Letter.aspx.html">短信息</a>
						</div>
						<div>
							<a href="../User/StudentInfor/systemMsge.aspx.html">学院通知</a>
						</div>
						<div>
							<a href="../MyInfo/Objection.aspx.html">我的异议</a>
						</div>
					</div>
					<div class="ta1">
						<strong>教务中心</strong>
						<div class="leftbgbt2"></div>
					</div>
					<div class="cdlist">
						<div>
							<a href="Application.aspx.html">我的报考</a>
						</div>
						<div>
							<a href="Score.aspx.html">我的成绩</a>
						</div>
						<div>
							<a href="Book.aspx.html">我的书籍</a>
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

				<h2 class="mbx">教务中心 &gt; 我的成绩</h2>
				<div class="morebt">
					<ul>
						<li><a class="tab2" href="Application.aspx.html">我的报考</a>
						</li>
						<li><a class="tab1" href="Score.aspx.html">我的成绩</a>
						</li>
						<li><a class="tab2" href="Book.aspx.html">我的书籍</a>
						</li>

					</ul>
				</div>
				<div class="cztable">
					<div class="tis red">
						注：请仔细核对自己的考试成绩，如正确请点击“确定无误”，如不正确请点击“有异议”。</div>

					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<th scope="col" style="width: 100px;">&nbsp;</th>

								<th scope="col" valign="top">
									<div class="wzx1">00015</div>
									<div class="wzx">英语（二）</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">03708</div>
									<div class="wzx">中国近现代史纲要</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">03709</div>
									<div class="wzx">马克思主义基本原理概论</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">00169</div>
									<div class="wzx">房地产法</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">00261</div>
									<div class="wzx">行政法学</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">00167</div>
									<div class="wzx">劳动法</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">07945</div>
									<div class="wzx">企业与公司法学</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">07946</div>
									<div class="wzx">税法原理</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">07947</div>
									<div class="wzx">金融法概论</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">06909</div>
									<div class="wzx">行政诉讼法</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">07944</div>
									<div class="wzx">经济法学原理</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">07948</div>
									<div class="wzx">环境法学</div></th>

								<th scope="col" valign="top">
									<div class="wzx1">10301</div>
									<div class="wzx">经济法毕业论文</div></th>

								<th scope="col" style="width: 100px;">操作</th>
							</tr>

							<tr align="center">
								<td colspan="15">
									<div style="color: #ff0000; font-weight: bold;">未找到成绩信息!</div>
								</td>
							</tr>

						</tbody>
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

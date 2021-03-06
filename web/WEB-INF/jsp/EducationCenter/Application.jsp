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

<link href="../Style/StudentStyle.css" rel="stylesheet" type="text/css" />
<script src="../Script/Base.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
	function confirmStatus(sid) {
		if (confirm("确定确认无误吗？") == true) {
			senateCenter.modifyStudentSignupExamStatus(sid, 2, function(data) {
				var result = $.parseJSON(data);
				if ((String(result.ok) == "true")) {
					jBox.alert(result.message, '提示');
					setTimeout(function() {
						window.location.reload();
					}, 1500);
				} else {
					jBox.tip(result.message);
				}
			});
		}
	}

	function submitObjection(objId) {
		var mtitle = "报考有异议";
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
					senateCenter.modifyStudentSignupExamStatus(objId, 3,
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
	function showApp(i1, i2, i3) {
		var amount1 = i1 * 48;
		var amount2 = i2 * 348;
		var amount3 = i3 * 168;
		var aamount = amount1 + amount2 + amount3;
		$("#BCount").html(i1);
		$("#LCount").html(i2);
		$("#SCount").html(i3);
		$("#BAmount").html(amount1);
		$("#LAmount").html(amount2);
		$("#SAmount").html(amount3);
		$("#AAmount").html(aamount);
		$.jBox("id:MyAppMoney", {
			title : "报考费详情",
			width : 510,
			height : 280,
			buttons : {
				'关闭' : true
			}
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

				<h2 class="mbx">教务中心 &gt; 我的报考</h2>
				<div class="morebt">
					<ul>
						<li><a class="tab1" href="Application.aspx.html">我的报考</a>
						</li>
						<li><a class="tab2" href="Score.aspx.html">我的成绩</a>
						</li>
						<li><a class="tab2" href="Book.aspx.html">我的书籍</a>
						</li>

					</ul>
				</div>
				<div id="MyAppMoney" style="display: none; padding: 15px 0;">
					<table width="100%" border="0" cellspacing="0"
						style="border-bottom: #cfe1f9 solid 4px;
            border-right: #cfe1f9 solid 1px;">
						<tbody>
							<tr>
								<th width="195" align="middle"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px; background: #eef7fc url(<%=path%>/statics/Images/Student/bgtable.jpg) repeat-x;
                        line-height: 22px; color: #185697;">
									<strong>缴 费 项 目</strong></th>
								<th width="206" align="middle"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px; background: #eef7fc url(<%=path%>/statics/Images/Student/bgtable.jpg) repeat-x;
                        line-height: 22px; color: #185697;">
									<strong>报 考 科 次</strong></th>
								<th width="305" align="middle"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px; background: #eef7fc url(<%=path%>/statics/Images/Student/bgtable.jpg) repeat-x;
                        line-height: 22px; color: #185697;">
									<strong>单 价</strong></th>
								<th width="199" align="middle"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px; background: #eef7fc url(<%=path%>/statics/Images/Student/bgtable.jpg) repeat-x;
                        line-height: 22px; color: #185697;">
									<strong>合计</strong></th>
							</tr>
							<tr>
								<td align="middle"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									报考费</td>
								<td align="left"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									<strong id="BCount">6</strong></td>
								<td width="305"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									48元/科</td>
								<td align="middle" id="BAmount"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									288</td>
							</tr>
							<tr>
								<td align="middle"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									实践课</td>
								<td align="left"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									<strong id="SCount">1</strong><br /></td>
								<td
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px; padding: 6px 5px;">
									48/科 + 120/科实践考核费</td>
								<td width="199" align="middle" id="SAmount"
									style="border-top: #cfe1f9 solid 1px;
                        border-left: #cfe1f9 solid 1px; padding: 6px 5px;">
									168</td>
							</tr>
							<tr>
								<td align="middle"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									论文</td>
								<td align="left"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									<strong id="LCount">1</strong></td>
								<td
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px; padding: 6px 5px;">
									48/科 + 300论文指导费</td>
								<td align="middle" id="LAmount"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									348</td>
							</tr>
							<tr>
								<td align="middle"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">&nbsp;

								</td>
								<td align="left"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">&nbsp;

								</td>
								<td
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px; padding: 6px 5px;">&nbsp;

								</td>
								<td align="middle"
									style="border-top: #cfe1f9 solid 1px; border-left: #cfe1f9 solid 1px;
                        padding: 6px 5px;">
									总计： <span class="bigfont" id="AAmount">804元</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="cztable">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th width="10%" style="text-align: center;">&nbsp;</th>

							<th valign="top">
								<div class="wzx1">00015</div>
								<div class="wzx">英语（二）</div></th>

							<th valign="top">
								<div class="wzx1">03708</div>
								<div class="wzx">中国近现代史纲要</div></th>

							<th valign="top">
								<div class="wzx1">03709</div>
								<div class="wzx">马克思主义基本原理概论</div></th>

							<th valign="top">
								<div class="wzx1">00169</div>
								<div class="wzx">房地产法</div></th>

							<th valign="top">
								<div class="wzx1">00261</div>
								<div class="wzx">行政法学</div></th>

							<th valign="top">
								<div class="wzx1">00167</div>
								<div class="wzx">劳动法</div></th>

							<th valign="top">
								<div class="wzx1">07945</div>
								<div class="wzx">企业与公司法学</div></th>

							<th valign="top">
								<div class="wzx1">07946</div>
								<div class="wzx">税法原理</div></th>

							<th valign="top">
								<div class="wzx1">07947</div>
								<div class="wzx">金融法概论</div></th>

							<th valign="top">
								<div class="wzx1">06909</div>
								<div class="wzx">行政诉讼法</div></th>

							<th valign="top">
								<div class="wzx1">07944</div>
								<div class="wzx">经济法学原理</div></th>

							<th valign="top">
								<div class="wzx1">07948</div>
								<div class="wzx">环境法学</div></th>

							<th valign="top">
								<div class="wzx1">10301</div>
								<div class="wzx">经济法毕业论文</div></th>

							<th style="text-align: center;">报考费(元)</th>
							<th style="text-align: center;">&nbsp;</th>
						</tr>

						<tr align="center">
							<td colspan="15">
								<div style="color: #ff0000; font-weight: bold;">未找到报考信息!</div></td>
						</tr>

					</table>

				</div>
				<div class="tis red" style="color: #333; margin-bottom: 20px;">
					<p>
						<strong>特别提示：</strong>
					</p>
					<p>
						<span class="red">1、请仔细核对并及时交清报考费，汇款后请跟班主任联系审核通过，如果没有及时交清费用，报考确认将会取消，将不能报考参加考试。</span>
					</p>
					<p>2、如果已经交清，请不要理会上面的信息，直接联系班主任帮你审核通过。</p>
					<p>3、汇款时请多汇几元钱或者几角钱，如1000.3元，可大幅提高您汇款入账速度</p>
					<p>4、汇款后请第一时间跟班主任或教务老师联系，并提交汇款单。</p>

				</div>
				<h2 class="mbx">教务中心 &gt; 我的报考 &gt; 查看考试时间</h2>
				<div class="cztable">
					<div class="tis red">注：请仔细查看【报考】考试计划以及考试时间，以免错过考试。</div>
					<table width="100%" cellpadding="0" cellspacing="0">
						<tr align="center">
							<th style="text-align: center;">课程代码名称</th>
							<th style="text-align: center;">是否有考试计划</th>
							<th style="text-align: center;">所属单元</th>
							<th style="text-align: center;">考试开始时间</th>
							<th style="text-align: center;">考试结束时间</th>
						</tr>

						<tr style="height: 28px" class="tdbg" align="center">
							<td colspan="13" align="left"
								style="color: Red; font-weight: bold;">未找到考试计划信息！</td>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/ar-taglib" prefix="ar"%>
<!DOCTYPE html>
<html>
<head>
<title>校园服务-信电校友录</title>
<%@ include file="/WEB-INF/views/portal-common/portal-meta.jsp"%>
</head>
<body>
	<!-- 页头 -->
	<%@ include file="/WEB-INF/views/portal-common/header.jsp"%>

	<!-- 导航栏 -->
	<%@ include file="/WEB-INF/views/portal-common/navmenu.jsp"%>

	<!-- contact -->
	<div class="container higher">
		<div class="col-md-9 project1">
			<!-- 导航栏 -->
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i>&nbsp;<a href="index.action">主页</a></li>
				<li class="active">校园服务</li>
			</ol>

			<img src="assets/images/school/xzit-front.jpg" class="img-responsive center-block"/>
			<p style="font-size: 16px">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				徐州工程学院  ,位于江苏省徐州市。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				徐州  ，简称徐，古称“彭城”  ，江苏省省辖市，地处江苏省西北部、华北平原的东南部，长江三角洲北翼，北倚微山湖，
				西连萧县，东临连云港，南接宿迁，京杭大运河从中穿过，陇海、京沪两大铁路干线在徐州交汇，素有“五省通衢”之称  。徐州是华东重要门户城市，
				华东地区重要的科教、文化、金融、旅游、医疗、会展中心，也是江苏省重要的经济、商业和对外贸易中心。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				原始社会末期，帝尧时彭祖建大彭氏国，徐州称彭城自始起，是江苏境内最早出现的城邑。徐州历史上为华夏九州之一，自古便是北国锁钥、南国门户、兵家必争之地和商贾云集中心，
				一直是淮海地区的政治、经济、文化中心  。徐州有超过6000年的文明史和2600年的建城史，是著名的千年帝都，有“九朝帝王徐州籍”之说。
				徐州是两汉文化的发源地，有“彭祖故国、刘邦故里、项羽故都”之称，因其拥有大量文化遗产、名胜古迹和深厚的历史底蕴，也被称作“东方雅典”。<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				徐州是国家“一带一路”重要节点城市  ，淮海经济区中心城市，长江三角洲区域中心城市  ，徐州都市圈核心城市，国际新能源基地，
				有“中国工程机械之都”的美誉。 徐州总面积11258平方公里，其中市区面积3037平方公里。徐州地形以平原为主，平原面积约占全市面积的90%。
				现辖5个市辖区、3个县、2个县级市。徐州属暖温带半湿润季风气候，四季分明。
				徐州有云龙湖、云龙山、彭祖园、龟山汉墓、楚王陵、戏马台、徐州潘安湖湿地公园等旅游景点，有彭祖、刘邦、孙权、李煜、张道陵等历史名人。</p>
		</div>
		<%@include file="/WEB-INF/views/service/service-list.jsp"%>
		<div class="clearfix"></div>
	</div>
	<!-- //contact -->

	<!-- 页脚 -->
	<%@ include file="/WEB-INF/views/portal-common/footer.jsp"%>
</body>
<%@ include file="/WEB-INF/views/portal-common/portal-js.jsp"%>
<script src="assets/script/message/contact-us.js"></script>
</html>
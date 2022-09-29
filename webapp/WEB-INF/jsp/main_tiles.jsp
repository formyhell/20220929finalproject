<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
	<head>	
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>PHOS</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

		<!-- Favicone Icon -->
		<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
		<!-- CSS -->
		<link href="http://fonts.googleapis.com/css?family=lato:400,100,200,300,500%7COpen+Sans:400,300,600,700,800%7COswald:300,400,700" rel="stylesheet" type="text/css">
		<link href="${cPath}/resources/assets/css/bootstrap.css" rel="stylesheet" type="text/css">
		<link href="${cPath}/resources/assets/css/font-awesome.css" rel="stylesheet" type="text/css">
		<link href="${cPath}/resources/assets/css/ionicons.css" rel="stylesheet" type="text/css">
		<!-- carousel -->
		<link href="${cPath}/resources/assets/css/plugin/owl.carousel.css" rel="stylesheet" type="text/css">
		<link href="${cPath}/resources/assets/css/plugin/owl.transitions.css" rel="stylesheet" type="text/css">
		<!--Main Slider-->
		<link href="${cPath}/resources/assets/css/settings.css" type="text/css" rel="stylesheet" media="screen">
		<link href="${cPath}/resources/assets/css/layers.css" type="text/css" rel="stylesheet" media="screen">
		<!--Main Style-->
		<link href="${cPath}/resources/assets/css/style.css" rel="stylesheet" type="text/css">
        <!--Theme Color-->
		<link href="${cPath}/resources/assets/css/theme-color/default.css" rel="stylesheet" id="theme-color" type="text/css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><!-- 한글폰트 추가 -->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
	</head>
	<body>
    <!--loader-->

<div id="preloader">
  <div class="sk-circle">
    <div class="sk-circle1 sk-child"></div>
    <div class="sk-circle2 sk-child"></div>
    <div class="sk-circle3 sk-child"></div>
    <div class="sk-circle4 sk-child"></div>
    <div class="sk-circle5 sk-child"></div>
    <div class="sk-circle6 sk-child"></div>
    <div class="sk-circle7 sk-child"></div>
    <div class="sk-circle8 sk-child"></div>
    <div class="sk-circle9 sk-child"></div>
    <div class="sk-circle10 sk-child"></div>
    <div class="sk-circle11 sk-child"></div>
    <div class="sk-circle12 sk-child"></div>
  </div>
</div>
<!--loader--> 
		<!-- Site Wraper -->
		<div class="wrapper">
			<!-- HEADER -->
			<tiles:insertAttribute name="header" />
			<!-- END HEADER -->
			<div style = "min-height:64.3vh" >
			<tiles:insertAttribute name="body"/>
			</div>

			<!-- FOOTER -->
			<tiles:insertAttribute name="footer"/>
			<!-- END FOOTER -->

		</div>
		<!-- Site Wraper End -->
		
		<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
		
		<!-- Easing Effect Js -->
		<script src="${cPath}/resources/assets/js/plugin/jquery.easing.js" type="text/javascript"></script>
		<!-- bootstrap Js -->
		<script src="${cPath}/resources/assets/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- carousel Js -->
		<script src="${cPath}/resources/assets/js/plugin/owl.carousel.js" type="text/javascript"></script>
		<!-- revolution Js -->
		<script type="text/javascript" src="${cPath}/resources/assets/js/jquery.themepunch.tools.min.js"></script>
		<script type="text/javascript" src="${cPath}/resources/assets/js/jquery.themepunch.revolution.min.js"></script>
		<script type="text/javascript" src="${cPath}/resources/assets/extensions/revolution.extension.slideanims.min.js"></script>
		<script type="text/javascript" src="${cPath}/resources/assets/extensions/revolution.extension.layeranimation.min.js"></script>
		<script type="text/javascript" src="${cPath}/resources/assets/extensions/revolution.extension.navigation.min.js"></script>
		<script type="text/javascript" src="${cPath}/resources/assets/extensions/revolution.extension.parallax.min.js"></script>
		<script type="text/javascript" src="${cPath}/resources/assets/js/jquery.revolution.js"></script>
		<!-- Map api Js --> 
		<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&.js"></script>  
		<!-- custom Js -->
		<script src="${cPath}/resources/assets/js/custom.js" type="text/javascript"></script>
		
		<!-- pms -->
		<script src="${cPath}/resources/assetsPms/js/icons/feather-icon/feather.min.js"></script>
    	<script src="${cPath}/resources/assetsPms/js/icons/feather-icon/feather-icon.js"></script>
    	
	</body>
</html>



    
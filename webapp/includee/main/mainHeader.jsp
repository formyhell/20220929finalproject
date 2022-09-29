<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="${cPath}/resources/js/jquery-3.6.0.min.js"></script>
<%-- <script src="${cPath}/resources/assetsPms/js/jquery-3.5.1.min.js"></script> --%>
<!-- toastr -->
<link href="${cPath}/resources/cal/toastr.css" rel="stylesheet" type="text/css">
<link href="${cPath}/resources/css/alert/mainAlert.css" rel="stylesheet" type="text/css">
<script src="${cPath}/resources/cal/toastr.min.js"></script>


<header id="header" class="header header-2">
	<div class="container secondary-header">
		<div class="row">
			<div class="col-sm-3 col-md-4">
				<div class="logo">
					<a href="${cPath}"><img
						src="${cPath}/resources/assets/images/logo.png"
						alt="Mega business"></a>
				</div>
				<button id="menu" class="menu visible-xs"></button>
			</div>

			<!-- 로그인 후 -->
			<security:authorize access="isAuthenticated()">
				<!-- 조건문 // 인증객체가 있을 때 -->
				<security:authentication property="principal" var="authMember" />
				<!-- authentication 객체(인증) -->

				<button id="login" class="btn-grayDay"
					style="float: right; margin-top: 5%;"
					onclick="logoutForm.submit();">Logout</button>

				<c:if test="${'ROLE_ADMIN' eq authMember.realMember.memType.get(0)}">
					<%-- 관리자 조건 --%>
					<a id="managerpage" class="whiteEmerald"
						style="float: right; margin-top: 5%;"
						onclick="location.href='${cPath}/admin/stats'">ManagerPage</a>
					<!-- 관리자 마이페이지 -->
				</c:if>
				<c:if
					test="${'ROLE_GENMEM' eq authMember.realMember.memType.get(0)}">
					<%--일반회원 조건 --%>
					<a id="mypage" class="whiteEmerald"
						style="float: right; margin-top: 5%;"
						onclick="location.href='${cPath}/gen/myinfo'">MyPage</a>
					<!--일반회원 마이페이지 -->
				</c:if>
				<c:if
					test="${'ROLE_COMMEM' eq authMember.realMember.memType.get(0)}">
					<%-- 기업회원 조건 --%>
					<a id="mypage" class="whiteEmerald"
						style="float: right; margin-top: 5%;"
						onclick="location.href='${cPath}/com/myinfo'">MyPage</a>
					<!--기업회원 마이페이지 -->
				</c:if>
				<form:form id="logoutForm" method="post" action="${cPath}/logout"></form:form>
				<div class="dropdown"
					style="color: white; float: right; margin-top: 5%; margin-right: 1%">
					<i data-feather="bell"></i> <span class="dot-animated"></span>
					<div class="dropdown-content"></div>
				</div>
			</security:authorize>

			<!-- 로그인 전 -->
			<security:authorize access="isAnonymous()">
				<!-- 조건문 // 인증객체가 없을 때 -->
				<button id="join" class="btn-blueOcen"
					style="float: right; margin-top: 5%;"
					onclick="location.href='${cPath}/member/form'">Join</button>
				<button id="login" class="btn-blueOcen"
					style="float: right; margin-top: 5%;"
					onclick="location.href='${cPath}/login'">Login</button>
			</security:authorize>
		</div>
	</div>

	<div class="primary-header">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<nav class="navigation">
						<ul>
							<li><a href="javascript:avoid(0);">HOME</a>
								<ul class="sub-nav">
									<li><a href="${cPath}/aboutUs">About us</a></li>
								</ul></li>


							<li><a>PROJECT</a> <i class="ion-ios-plus-empty visible-xs"></i>
								<ul class="sub-nav">
									<li><a href="${cPath}/outsourcing/listAll">프로젝트 목록</a></li>
									<c:if
										test="${'ROLE_COMMEM' eq authMember.realMember.memType.get(0)}">
										<li><a href="${cPath}/outsourcing/creaed">내가 등록한 프로젝트
												</a></li>
									</c:if>
								</ul></li>

							<li><a href="${cPath}/pmsProject">PMS</a><i
								class="ion-ios-plus-empty visible-xs"></i>
								<ul class="sub-nav">
									<li><a href="${cPath}/pmsProject">PMS 프로젝트</a></li>
									<li><a href="${cPath}/pmsProject/joinProject">참가한 프로젝트</a>
									</li>
									<li><a href="${cPath}/pmsProject/creaed">생성한 프로젝트</a></li>
								</ul></li>
							<li><a href="javascript:avoid(0);">COMMUNTIY</a><i
								class="ion-ios-plus-empty visible-xs"></i>
								<ul class="sub-nav">
									<li><a href="${cPath}/notice">공지사항</a></li>
									<li><a href="${cPath}/qna">Q&A</a></li>
									<li><a href="${cPath }/community">커뮤니티</a></li>
									<%-- 이거 관리자 아니고 커뮤니티에요 --%>
								</ul></li>
						</ul>
					</nav>
				</div>

			</div>
		</div>
	</div>
</header>

<script src="${cPath}/resources/js/alert/mainAlert.js"></script>
<script>
let h_header = '${_csrf.headerName}';
let h_token =  '${_csrf.token}'; 
let h_url = "${cPath}/alert";
let h_svUrl = "192.168.36.40";

<security:authorize access="isAuthenticated()">
	connect();
	alamView();
</security:authorize>
</script>

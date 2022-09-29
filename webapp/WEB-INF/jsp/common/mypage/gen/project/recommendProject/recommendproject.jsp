<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="${cPath}/resources/assetsPms/css/star.css" rel="stylesheet" type="text/css">
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="${cPath}/resources/js/intrestProject/jquery.form.min.js"></script>
<style>
	div.project-box:hover {
		background-color: #F2F2F2;
	}
</style>
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-10">
				<h3>나에게 알맞은 프로젝트 추천리스트</h3>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${cPath}">Home</a></li>
					<li class="breadcrumb-item"><a href="${cPath}/gen/myinfo">MyPage</a></li>
					<li class="breadcrumb-item"><a href="${cPath}/gen/myinfo/interestProject">InterestProject</a></li>
					<li class="breadcrumb-item active">RecommendProject</li>
					<!-- 완료된 프로젝트 이동 버튼 -->
					<button class="btn-blueOcen openBtn" style="width: 180px;"> 프로젝트 완료 버튼</button>
				</ol>
				<div style="margin-top:10px;">
					<p>해당 프로젝트 목록은 회원님의 직업, 기술, 장소의 정보를 바탕으로 가장 유사한 모집정보를 가진 프로젝트들을 제시하였습니다. </p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Container-fluid starts-->
<div class="container-fluid">
	<div class="row project-cards">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<div class="tab-content" id="top-tabContent">
						<div class="tab-pane fade show active" id="top-home"
							role="tabpanel" aria-labelledby="top-home-tab">
							<div class="row" id="listBody">
								<!-- 자동생성 div 들어가는 위치 -->
							</div>
							<!--반복끝-->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div  id ="pagingList" class="card-body pagingArea pagination-primary" style="display:none; width: fit-content; margin: auto;"></div>
	</div>
</div>

<form:form id="searchForm" modelAttribute="simpleCondition"
	action="${cPath }/gen/myinfo/recommendProject" method="get">
	<input type="hidden" name="page" />
</form:form>

<!-- 완료된 프로젝트로 이동 -->

<div class="modal hidden">
	<div class="bg"></div>
	<div class="modalBox">
		<p>
			<button class="closeBtn">✖</button>
		</p>
		<div>
			<h4><b>회원평가</b></h4>
			<table id="starTable">
				<thead>
					<tr>
						<td colspan="4"></td>
						<td><b style="float:right">전체 선택&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
						<td>
							<div class="starAll">
								<span class="starR" data-value="1">★</span>
								<span class="starR" data-value="2">★</span>
								<span class="starR" data-value="3">★</span>
								<span class="starR" data-value="4">★</span>
								<span class="starR" data-value="5">★</span>
							</div>
						</td>
					</tr>
					<tr id="attribution" style="background-color : #E8EFED">
						<th>PROFILE</th>
						<th opt="name">NAME<b class="right v">∨</b></th>
						<th opt="id">ID<b class="right v">∨</b></th>
						<th opt="obj">POSITION<b class="right v">∨</b></th>
						<th opt="date">DATE<b class="right v"></b></th>
						<th>RATING</th>
					</tr>
				</thead>
				<tbody id ="starList"></tbody>
			</table>
			<div class="rb">
				<button class="btn-blueOcen" onclick="nextBtn()">저장</button>
			</div>
		</div>
	</div>
</div>


<!-- 완성했으나 적용하지 못한 별점기능 (채원이가 함) -->
 <script>
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	var CPATH = "${cPath}";
	var projId = "OUT2208220001";
	
	var jScript = document.createElement("script");
	jScript.src = CPATH+"/resources/js/starToGen/starToGenModal.js";
	document.body.appendChild(jScript);
</script>



<!-- 내용 -->
<script>
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	var CPATH = "${cPath}";
	
	var jScript = document.createElement("script");
	jScript.src = CPATH+"/resources/js/recommendProject/recommendProject.js";
	document.body.appendChild(jScript);
</script>
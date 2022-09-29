<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 3.      홍승조      컨트롤러 연결
* 2022. 8. 4.      윤지영      화면 추가
* 2022. 8. 24.     윤지영     평점 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://kit.fontawesome.com/15952e61fa.js" crossorigin="anonymous"></script>
<script>
	<c:choose>
	<c:when test="${not empty resultMap }">
	if ("${resultMap['result']}" == true) {
		Swal.fire({
			icon : 'success',
			title : "${resultMap['message']}"
		});
	} else {
		Swal.fire({
			icon : 'warning',
			title : "${resultMap['message']}"
		});
	}
	</c:when>
	</c:choose>
</script>
<style>
table {
	width: 100%;
	height: 100%;
	border-top: 0px solid #91d4ed;
	border-collapse: collapse;
}

th, td {
	border-bottom: 0px solid #92badc;
	border-left: 0px solid #92badc;
	padding: 0px;
}
td {
    width: 100px;
    
}
table {
	border-collapse: separate;
  	border-spacing: 0 40px;
}
.star {
	width: 150px;
	background: url(${cPath}/resources/images/star/starbackground.png)
		no-repeat;
}

.star, .star span {
	display: inline-block;
	height: 30px;
	overflow: hidden;
}

.star span {
	background: url(${cPath}/resources/images/star/star.png) no-repeat;
	line-height: 0;
	vertical-align: top;
}

.genImage {
	width: 120px !important;
	height: 120px !important;
	border-radius: 70% !important;
	border: 3px solid #088A68;
}
/* element.style{ */
/* 	float: left !important; */
/* } */

button.btn.btn-pill.btn-outline-info.btn-sm {
    margin-right: 7px;
}

button.btn.btn-pill.btn-outline-primary.btn-sm {
	margin-right: 7px;
}
</style>










<div class="container-fluid dashboard-default-sec">
	<div class="row">
		<!-- 첫번째 줄 -->
		<div class="col-xl-30 box-col-12 des-xl-100">
			<div class="row">
				<div class="col-xl-12 col-100 box-col-12 des-xl-100">
					<div class="card">
						<div class="card-header">
							<h3 style="text-align: center; border-bottom: 1px solid black;">내정보</h3>
							<div>
								<!-- 내정보 테이블 -->
								<table style="width: 100%; height: 100%;">



									<tr>
										<th class="tg-0lax" rowspan="3" style="width: 150px; padding-left: 45px;"><img class="genImage" src="${cPath }/resources/images/${genMember.genImg }" onerror="this.src='${cPath }/resources/assetsPms/images/dashboard/1.png'" />
										<p id="grd" style="display:none">${genMember.genGrd}</p></th>
<!-- 										<th class="tg-0lax"></th> -->
										<th style="width: 150px;">아이디</th>
										<td style="width: 500px;">${genMember.genId}</td>
										<th class="tg-0lax"></th>
										<td><button
												onclick="location.href='${cPath }/gen/myinfo/${genMember.genId}/form'"
												class="btn btn-pill btn-outline-info btn-xs" style="width: 80px;">수정</button></td>
									</tr>
									<tr>
<!-- 										<th class="tg-0lax"></th> -->
										<th style="width: 70px;">이름</th>
										<td>${genMember.genName}</td>
										<th class="tg-0lax"></th>
										<td><button class="btn btn-pill btn-outline-danger btn-xs" style="width: 80px"
												data-bs-toggle="modal" data-bs-target="#exampleModal">탈퇴</button></td>
									</tr>
									<tr>
<!-- 										<th class="tg-0lax"></th> -->
										<th style="width: 70px;">닉네임</th>
										<td>${genMember.genNick}</td>
										<th class="tg-0lax"></th>
									</tr>
									
									<tr>
										<td  rowspan="3" style="width: 25%; padding-left: 70px; padding-bottom: 100px;">
											<h4>등급<div class="grdDiv"><i class="fa-sharp fa-solid fa-award fa-10x"></i></div></h4>
									<p>${genMember.genRating}/5</p>
<!-- 									프로젝트점수1+프로젝트점수2+프로젝트 점수3/완료한 프로젝트수 (반올림) -->
<!-- 									부제목 -->
									<div>
										<span class='star'> <span
											style="width:${genMember.genRating*20}%"></span> <!-- 70% = genMember.genRating /5 *100 -->
										</span>
									</div>
										</td>
<!-- 										<th class="tg-0lax"></th> -->
										<th style="width: 70px;">이메일</th>
										<td>${genMember.genMail}</td>
										<th class="tg-0lax"></th>
									</tr>
									<tr>
<!-- 										<th class="tg-0lax"></th> -->
										<th style="width: 70px;">전화번호</th>
										<td>${genMember.genHp}</td>
										<th class="tg-0lax"></th>
										<td>
											<button class="btn btn-pill btn-outline-info btn-xs" data-bs-toggle="modal"
												data-bs-target="#m_change" style="width: 100px;">비밀번호 변경</button>
										</td>
									</tr>
									<tr>
<!-- 										<th class="tg-0lax"></th> -->
										<th rowspan="2" style="width: 70px;">자기소개</th>
										<td rowspan="2" colspan="2">${genMember.genIntro}</td>
										<th class="tg-0lax"></th>
									</tr>
								</table>



							</div>
						</div>
						<div class="card-body p-0">
							<div class="code-box-copy">
								<button class="code-box-copy__btn btn-clipboard"
									data-clipboard-target="#sell-overview" title="Copy">
									<i class="icofont icofont-copy-alt"></i>
								</button>
								<pre></pre>
							</div>
						</div>
					</div>
				</div>
				<!--관심 프로젝트 시작-->

<!-- 				<div class="col-xl-2 col-50 box-col-6 des-xl-50"> -->
<!-- 					<div class="card latest-update-sec"> -->
<!-- 						<div class="card-header"> -->
<!-- 							<div class="header-top d-sm-flex align-items-center"> -->
<!-- 								<div class="center-content"> -->
<!-- 									<h4>등급</h4> -->
<%-- 									<p>${genMember.genRating}/5</p> --%>
<!-- 									프로젝트점수1+프로젝트점수2+프로젝트 점수3/완료한 프로젝트수 (반올림) -->
<!-- 									부제목 -->
<!-- 									<div> -->
<!-- 										<span class='star'> <span -->
<%-- 											style="width:${genMember.genRating*20}%"></span> <!-- 70% = genMember.genRating /5 *100 --> --%>
<!-- 										</span> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="card-body"> -->
<!-- 							내용 -->
<!-- 							<div class="code-box-copy"> -->
<!-- 								<button class="code-box-copy__btn btn-clipboard" -->
<!-- 									data-clipboard-target="#latest-update-sec" title="Copy"> -->
<!-- 									<i class="icofont icofont-copy-alt"></i> -->
<!-- 								</button> -->
<!-- 								<pre></pre> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->


				<!--관심 프로젝트 끝-->
			</div>
		</div>



	</div>
</div>

<!-- 두번째 줄 -->
<div class="col-xl-15 box-col-12 des-xl-100">
	<div class="row">
		<div class="col-xl-12 col-100 box-col-12 des-xl-100">
			<div class="card">
				<div class="card-header">
					<div class="header-top d-sm-flex align-items-center">
						
					
						
						<table>
							<thead>
								<tr>
									<th class="tg-0lax"><a class="btn-blueOcen" style="width: 60px;"
											href="${cPath }/gen/myinfo/genLocForm" style="float: right;">희망 지역 등록</a></th>
								</tr>
							</thead>
							<tbody>
							<tr>
									<td class="tg-0lax" ><h4>희망지역</h4></td>
								</tr>
								<tr>
									<td class="tg-0lax">
									<c:if test="${not empty genMember.locList }">
										<c:forEach items="${genMember.locList }" var="loc">
											<div>
												<button
													onclick="$(this).closest('div').remove();obj_remove('${loc.locCode}');"
													class="btn btn-pill btn-outline-info btn-sm" style="float: left">${loc.locName}
													x</button> 
											</div>
										</c:forEach>
									</c:if>
									</td>
								</tr>
								
								<tr>
									<th class="tg-0lax"><a class="btn-blueOcen" style="width: 60px;"
											href="${cPath }/gen/myinfo/genSkillForm" style="float: right;">직무분야 / 보유기술  등록</a></th>
								</tr>
							<tbody>
								<tr>
									<td class="tg-0lax"><h4>직무분야</h4></td>
								</tr>
								<tr>
									<td class="tg-0lax">
									<c:if test="${not empty genMember.objList }">
										<c:forEach items="${genMember.objList }" var="obj">
											<div>
												<button
													onclick="$(this).closest('div').remove();obj_remove('${obj.objCode}');"
													class="btn btn-pill btn-outline-info btn-sm" style="float: left">${obj.objName}
													x</button> 
											</div>
										</c:forEach>
									</c:if>
									</td>
								</tr>
								<tr>
									<td class="tg-0lax"><h4>보유기술</h4></td>
								</tr>
								<tr>
									<td class="tg-0lax"><c:if test="${not empty genMember.skillList }">
										<c:forEach items="${genMember.skillList }" var="skill">
											<div>
												<button onclick="$(this).closest('div').remove();skill_remove('${skill.skillCode}');"
													class="btn btn-pill btn-outline-primary btn-sm" style="float: left">${skill.skillName} x</button>
											</div>
										</c:forEach>
									</c:if>
									</td>
								</tr>
							</tbody>
						</table>


					</div>
				</div>
				<div class="card-body p-0">
					<div class="code-box-copy">
						<button class="code-box-copy__btn btn-clipboard"
							data-clipboard-target="#sell-overview" title="Copy">
							<i class="icofont icofont-copy-alt"></i>
						</button>
						<pre></pre>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>




<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">비밀번호를 입력하시오</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form method="post"
				action="${cPath }/gen/myinfo/gendel/${genMember.genId}">
				<sec:csrfInput />
				<div class="modal-body">
					<input type="password" name="password" class="form-control" />
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">탈퇴하기</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>


<!-- <!-- 비번 병경 Modal -->
-->
<!-- <div class="modal fade" id="exampleModal2" tabindex="-1" -->
<!-- 	aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 	<div class="modal-dialog"> -->
<!-- 		<div class="modal-content"> -->
<!-- 			<div class="modal-header"> -->
<!-- 				<h4 class="modal-title" id="exampleModalLabel">비밀번호 변경</h4> -->
<!-- 				<button type="button" class="btn-close" data-bs-dismiss="modal" -->
<!-- 					aria-label="Close"></button> -->
<!-- 			</div> -->
<%-- 			<form method="post" --%>
<%-- 				action="${cPath }/gen/myinfo/changePW"> --%>
<%-- 				<sec:csrfInput /> --%>
<!-- 				<div class="modal-body"> -->
<!-- 					<input type="password" name="inputPass" class="form-control" placeholder="현재 비밀번호" /> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->
<!-- 					<input type="password" name="newPass" class="form-control" placeholder="새 비밀번호" /> -->
<!-- 				</div> -->
<!-- 				<div class="modal-footer"> -->
<!-- 					<button type="button" class="btn btn-secondary" -->
<!-- 						data-bs-dismiss="modal">닫기</button> -->
<!-- 					<button type="submit" class="btn btn-danger">변경하기</button> -->
<!-- 				</div> -->
<%-- 			</form> --%>
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<!-- 비밀번호 변경 Modal -->
<div class="modal fade" id="m_change" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">비밀번호 변경</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form method="post" id="changePWId"
				action="${cPath }/gen/myinfo/changePW"
				onsubmit="return submitCheck();">
				<sec:csrfInput />
				<div class="modal-body">
					<p>
						안전한 비밀번호로 내정보를 보호하세요 <br> - 다른 아이디/사이트에서 사용한 적 없는 비밀번호 <br>
						- 이전에 사용한 적 없는 비밀번호가 안전합니다. <br> - 비밀번호는 8~16자로 영문, 숫자, 특수문자를
						사용하세요.
					</p>
					<input id="inputPass" type="password" placeholder="현재 비밀번호"
						name="inputPass" class="form-control"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[`~!@#$%^&*()-_=+])[A-Za-z\d`~!@#$%^&*()-_=+]{8,16}$"
						required /> <br> <input id="newPass" type="password"
						placeholder="새 비밀번호" name="newPass" class="form-control"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[`~!@#$%^&*()-_=+])[A-Za-z\d`~!@#$%^&*()-_=+]{8,16}$"
						required /> <input id="newPassChk" type="password"
						placeholder="새 비밀번호 확인" class="form-control"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[`~!@#$%^&*()-_=+])[A-Za-z\d`~!@#$%^&*()-_=+]{8,16}$" />
					<font id="chkNotice" size="2"></font>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger"
						onclick="submitCheck()">확인</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
	    let grd = $("#grd").text();
	    let color = '';
	    
	    if(grd == 'GOLD') {
	    	color = '#ffd700';
	    } else if(grd == 'SILVER') {
	    	color = '#A3A3A3';
	    } else if(grd == 'BRONZE') {
	    	color = '#CD7F32';
	    } else {
	    	color = '#24695c';
	    }
	    $(".grdDiv").attr("style","color:" + color + "; float: right; margin-right: 240px;");
	});

	function submitCheck() {
		if (passChk == 0) {
			alert();
			return false;
		}
		return true;
	}

	function alert() {
		Swal.fire({
			icon : 'warning',
			title : "비밀번호를 확인하세요."
		});
	}

	// 비밀번호 일치 여부
	var passChk = 0;
	$(function() {
		$('#newPass').keyup(function() {
			$('#chkNotice').html('');
			$('#newPassChk').val('');
		});

		$('#newPassChk').keyup(function() {
			if ($('#newPass').val() != $('#newPassChk').val()) {
				$('#chkNotice').html('비밀번호 일치하지 않음');
				$('#chkNotice').attr('color', '#f82a2aa3');
				passChk = 0;
			} else {
				$('#chkNotice').html('비밀번호 일치함');
				$('#chkNotice').attr('color', '#199894b3');
				passChk = 1;
			}
		});
	});

	// 1.ajax
	// 2.skill_remove function만들기
	function skill_remove(code) {
		$.ajax({
			url : '${cPath}/gen/myinfo/${genMember.genId}/delskill',
			method : "get",
			data : {
				"code" : code
			},
			dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
			,

			success : function(resp, status, jqXHR) {
				alert(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}

	function obj_remove(code1) {
		$.ajax({
			url : '${cPath}/gen/myinfo/${genMember.genId}/delobj',
			method : "get",
			data : {
				"code1" : code1
			},
			dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
			,
			contentType : "application/json;charset=utf-8",
			success : function(resp, status, jqXHR) {
				alert(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}

	//선호 지역 지우기

	function loc_remove(code2) {
		$.ajax({
			url : '${cPath}/gen/myinfo/${genMember.genId}/delloc',
			method : "get",
			data : {
				"code2" : code2
			},
			dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
			,
			contentType : "application/json;charset=utf-8",
			success : function(resp, status, jqXHR) {
				alert(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
</script>

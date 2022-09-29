<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자     		  		 수정내용
* ----------  ---------  -----------------
* 2022. 8. 22.  조채원       	 		최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row" style="padding: 20px">
		<div class="col-sm-6">
			<h4>학력</h4>
		</div>
		<div class="col-sm-6">
			<button class="btn btn-pill btn-primary btn-air-primary btn_Add" style="float: right" data-bs-toggle="modal" data-bs-target="#eduModal">학력 추가</button>
		</div>
	</div>
	<div class="eduBody"></div>
	<!-- Modal -->
			<div class="modal fade" id="eduModal" tabindex="-1" aria-labelledby="eduModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="eduModalLabel">학력 등록</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" style="padding-top:0px">
			      <form class="needs-validation" novalidate method="post" id="eduForm">
			     <div class="card-body">
			<div class="row g-3">
			<div class="col-md-4">
			<label class="form-label" for="eduType">학교구분*</label>
			<select class="form-select form-control digits" id="eduType" required>
				<c:if test="${not empty eduTypeList }">
					<c:forEach items="${eduTypeList }" var="type">
						<option value="${type.CODE_ID }">${type.CODE_NAME }</option>
					</c:forEach>
				</c:if>
			</select>
			</div>
			<div class="col-md-8">
			<label class="form-label" for="eduScname">학교명*</label>
			<input class="form-control" id="eduScname" maxlength="15" type="text" required/>
			</div>
			</div>
			<div class="row g-3">
			<div class="col-md-12" style="padding-top: 20px;">
			<label class="form-label" for="eduMajor">전공*</label>
			<input class="form-control" id="eduMajor" type="text" maxlength="15" required />
			</div>
			</div>
			<div class="row g-3">
			<div class="col-md-4" style="padding-top: 20px;">
			<label class="form-label" for="eduState">졸업상태*</label>
			<select class="form-select form-control digits" id="eduState" required>
				<c:if test="${not empty eduStateList }">
					<c:forEach items="${eduStateList }" var="state">
						<option value="${state.CODE_ID }">${state.CODE_NAME }</option>
					</c:forEach>
				</c:if>
			</select>
			</div>
			<div class="col-md-4" style="padding-top: 20px;">
			<label class="form-label" for="eduSdate">입학일*</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" required id="eduSdate"/>
			</div>
			<div class="col-md-4" style="padding-top: 20px;">
			<label class="form-label" for="eduFdate">졸업일(졸업예정일)*</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" required id="eduFdate"/>
			</div>
			</div>
			</div>
			<div class="card-foot" style="float:right; padding-top:20px">
			        <button class="btn btn-primary" type="submit" id="btn-form">저장</button>
			        <button class="btn btn-light btn-cancel" type="button" style="margin-left:10px" data-bs-dismiss="modal">취소</button>
			      </div>	      
			      </form>
			      </div>
			    </div>
			  </div>
			</div> 
			
			
			<!-- Modal -->
			<div class="modal fade" id="eduModalModify" tabindex="-1" aria-labelledby="eduModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="eduModalLabel">학력 수정</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" style="padding-top:0px">
			      <form class="needs-validation" novalidate method="post" id="eduModify">
			     <div class="card-body">
			<div class="row g-3">
			<div class="col-md-4">
			<label class="form-label" for="type">학교구분*</label>
			<select class="form-select form-control digits" required id="type">
				<c:if test="${not empty eduTypeList }">
					<c:forEach items="${eduTypeList }" var="type">
						<option value="${type.CODE_ID }">${type.CODE_NAME }</option>
					</c:forEach>
				</c:if>
			</select>
			</div>
			<div class="col-md-8">
			<label class="form-label" for="scname">학교명*</label>
			<input class="form-control" id="scname" type="text" required maxlength="15"/>
			</div>
			</div>
			<div class="row g-3">
			<div class="col-md-12" style="padding-top: 20px;">
			<label class="form-label" for="major">전공*</label>
			<input class="form-control" id="major" type="text" maxlength="15" required/>
			</div>
			</div>
			<div class="row g-3">
			<div class="col-md-4" style="padding-top: 20px;">
			<label class="form-label" for="state">졸업상태*</label>
			<select class="form-select form-control digits" id="state">
				<c:if test="${not empty eduStateList }">
					<c:forEach items="${eduStateList }" var="state">
						<option value="${state.CODE_ID }">${state.CODE_NAME }</option>
					</c:forEach>
				</c:if>
			</select>
			</div>
			<div class="col-md-4" style="padding-top: 20px;">
			<label class="form-label" for="sdate">입학일*</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" required id="sdate"/>
			</div>
			<div class="col-md-4" style="padding-top: 20px;">
			<label class="form-label" for="fdate">졸업일(졸업예정일)*</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" required id="fdate"/>
			</div>
			</div>
			</div>
			<div class="card-foot" style="float:right; padding-top:20px">
			        <button class="btn btn-primary" type="submit" id="btn-modify">저장</button>
			        <button class="btn btn-light btn-cancel" type="button" style="margin-left:10px" data-bs-dismiss="modal">취소</button>
			      </div>	      
			      </form>
			      </div>
			    </div>
			  </div>
			</div> 
			
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script type="text/javascript">
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}'; 

		$("#eudModal").on("hidden.bs.modal", function(){
			$(this).find("#eduForm").get(0).reset();
		}).on("shown.bs.modal", function(){
			$(this).find("#eduType").focus();
		});
		
		$("#eduModalModify").on("hidden.bs.modal", function(){
			$(this).find("#eduModify").get(0).reset();
		}).on("shown.bs.modal", function(){
			$(this).find("#type").focus();
		});
			
		 	$.ajax({
				url : "${cPath}/gen/myinfo/education",
				method : "get",
				dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
				,
				success : function(resp, status, jqXHR) {
					let eduList = resp;
					let divTags = [];
					if (eduList && eduList.length > 0) {
						$(eduList).each(function(index, edu) {
							divTags.push(makeDiv(index, edu));	
						});
					} 
					$('.eduBody').append(divTags);
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
			
		 	$(document).on("submit", "#eduForm", function(event) {
				event.preventDefault();
				let eduType = $('#eduType').val();
				let eduState = $('#eduState').val();
				let eduScname = $('#eduScname').val();
				let eduMajor = $('#eduMajor').val();
				let eduSdate = new Date($("#eduSdate").val());
				let eduFdate = new Date($("#eduFdate").val());
				
				let isValidSDate = Date.parse(eduSdate);
				let isValidFDate = Date.parse(eduFdate);
				if(isValidSDate) {
					eduSdate = eduSdate.toISOString().slice(0, 8).replace(/-/g, '');
				} else {
					eduSdate = null;
				}
				if(isValidFDate) {
					eduFdate = eduFdate.toISOString().slice(0, 8).replace(/-/g, '');
				} else {
					eduFdate = null;
				}
				
				console.log("학교타입: " + eduType);
				console.log("졸업상태: " + eduState);
				console.log("학교이름: " + eduScname);
				console.log("전공: " + eduMajor);
				console.log("입학일: " + eduSdate);
				console.log("졸업일: " + eduFdate);

				$.ajax({
					url : "${cPath}/gen/myinfo/education",
					method : "post",
					dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
						,
					contentType: 'application/json; charset=utf-8',
					data : JSON.stringify({
						eduType : eduType,
						eduState : eduState,
						eduScname : eduScname,
						eduMajor : eduMajor,
						eduSdate : eduSdate,
						eduFdate : eduFdate
					}),
					dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
					,
					beforeSend : function(xhr)
					{
					   xhr.setRequestHeader(header,token);
					},
					success : function(resp, status, jqXHR) {
						$('#eduModal').modal('hide');
						let edu = resp;
						let singleDiv = makeDiv(0, edu);
						$('.eduBody').prepend(singleDiv);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				}); 
			});  
			 
			 let eduNo = '';
			 let cardDiv = '';
			 $(document).on("click", ".btn-modify", function() {
				 $("#eduModalModify").modal('show');
				 eduNo = $(this).closest(".card-body").siblings(".card-header").children("p").text();
				 let oldName = $(this).closest(".card-body").siblings(".card-header").children("h4").text();
				 
				 let oldType = $(this).closest(".row3").siblings(".row1").children(".col-md-2").text();
				 let oldMajor = $(this).closest(".row3").siblings(".row1").children(".col-md-3").text();
				 
				 let oldSdate = $(this).closest(".row3").siblings(".row2").children(".sdate").children("p").text().substr(0,6);
				 let oldFdate = $(this).closest(".row3").siblings(".row2").children(".fdate").children("p").text();
				 let oldState = $(this).closest(".row3").siblings(".row2").children(".col-sm-1").children("span").text();
				 
				 cardDiv = $(this).closest(".card");
				 
				
				 $('#scname').val(oldName);
				 $('#major').val(oldMajor);
				 $('#sdate').val(oldSdate);
				 $('#fdate').val(oldFdate);
				 // $("#type").find('option[text="' + oldType + '"]').attr("selected",true);
				 $("#type option:contains(" + oldType + ")").attr("selected", "selected");
				 // $("#state").find('option[text=' + oldState + ']').attr("selected",true);
				 $("#state option:contains(" + oldState + ")").attr("selected", "selected");
				 
				 console.log(eduNo);
				 console.log(oldName);
				 console.log(oldType);
				 console.log(oldMajor);
				 console.log(oldSdate);
				 console.log(oldFdate);
				 console.log(oldState);
			 });
			 
			 $(document).on("submit", "#eduModify", function() {
				 event.preventDefault();
				let eduType = $('#type').val();
				let eduState = $('#state').val();
				let eduScname = $('#scname').val();
				let eduMajor = $('#major').val();
				let eduSdate = new Date($("#sdate").val());
				let eduFdate = new Date($("#fdate").val());
				
				 
				let isValidSDate = Date.parse(eduSdate);
				let isValidFDate = Date.parse(eduFdate);
				if(isValidSDate) {
					eduSdate = eduSdate.toISOString().slice(0, 8).replace(/-/g, '');
				} else {
					eduSdate = null;
				}
				if(isValidFDate) {
					eduFdate = eduFdate.toISOString().slice(0, 8).replace(/-/g, '');
				} else {
					eduFdate = null;
				}
				if(eduSdate.length > 6) {
					eduSdate = eduSdate.slice(1,eduSdate);
				}
				if(eduFdate.length > 6) {
					eduFdate = eduFdate.slice(1,eduFdate);
				}
				
				console.log("eduSdate : " + eduSdate);
				console.log("eduFdate : " + eduFdate);
				$.ajax({
					url : "${cPath}/gen/myinfo/education",
					method : "put",
					contentType: 'application/json; charset=utf-8',
					dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
						,
					data : JSON.stringify({
						eduNo : eduNo,
						eduType : eduType,
						eduState : eduState,
						eduScname : eduScname,
						eduMajor : eduMajor,
						eduSdate : eduSdate,
						eduFdate : eduFdate
					}),
					dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
					,
					beforeSend : function(xhr)
					{
					   xhr.setRequestHeader(header,token);
					},
					success : function(resp, status, jqXHR) {
						$('#eduModalModify').modal('hide');
						cardDiv.remove();
						let edu = resp;
						let singleDiv = makeDiv(0, edu);
						$('.eduBody').prepend(singleDiv);
						
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				}); 
			 });
			 
			 
			let makeDiv = function(index, edu) {
				return $("<div>").addClass("card").append(
						$("<div>").addClass("card-header pb-0").append(
								$("<p>").css("display","none").addClass("eduNo").text(edu.eduNo),
								$("<h4>").addClass("txt-primary f-w-700").text(edu.eduScname)
								
							),	
							$("<div>").addClass("card-body").append(
								$("<div>").addClass("row row1").append(
									$("<div>").addClass("col-md-2").css("border-right", "1px solid #e6edef").text(edu.eduType),
									$("<div>").addClass("col-md-3").text(edu.eduMajor)
								),
								$("<div>").addClass("row row2").css("padding-top", "30px").append(
										$("<strong>").addClass("col-md-1").text("재학기간"),
										$("<div>").addClass("col-sm-2 sdate").append(
											$("<p>").text(edu.eduSdate + "-")	
										),
										$("<div>").addClass("col-sm-2 fdate").css("margin-left", "-135px").append(
												$("<p>").text(edu.eduFdate)
											),
										$("<div>").addClass("col-sm-1").css("margin-left", "-140px").append(
											$("<span>").addClass("badge rounded-pill badge-primary").text(edu.eduState)
										)
										
									),
								$("<div>").addClass("row row3").css("padding-top", "30px").append(
										$("<div>").addClass("col-md-12").append(
												$("<button>").addClass("btn btn-info btn-sm btn-del").attr({
													onclick : "location.href='${cPath }/gen/myinfo/education/" + (edu.eduNo) + "';",
													style : "float: right",
												}).text("삭제"),
												$("<button>").addClass("btn btn-outline-primary btn-sm btn-modify").text("수정").css({
													"float" : "right",
													"margin-right" : "10px"
													})
										)	
								)
							)
						);
				}   
</script>  
</body>
</html>
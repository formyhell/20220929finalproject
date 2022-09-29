<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자     		   수정내용
* ----------  ---------  -----------------
* 2022. 8. 20.  조채원       	 최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<div class="row" style="padding: 20px">
		<div class="col-sm-6">
			<h4>경력</h4>
		</div>
		<div class="col-sm-6">
			<button class="btn btn-pill btn-primary btn-air-primary btn_Add" style="float: right" data-bs-toggle="modal" data-bs-target="#carModal">경력 추가</button>
		</div>
	</div>
	<div class="careerBody"></div>
	<!-- Modal -->
			<div class="modal fade" id="carModal" tabindex="-1" aria-labelledby="carModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="carModalLabel">경력 등록</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" style="padding-top:0px">
			      <form class="needs-validation" novalidate method="post" id="carForm">
			     <div class="card-body">
			<div class="row g-3">
			<div class="col-md-4">
			<label class="form-label" for="carCom">회사명*</label>
			<input class="form-control" id="carCom" type="text" maxlength="15" required>
			</div>
			<div class="col-md-4">
			<label class="form-label" for="carDep">부서명*</label>
			<input class="form-control" id="carDep" type="text" maxlength="15" required>
			</div>
			<div class="col-md-4">
			<label class="form-label" for="carPosition">직급*</label>
			<input class="form-control" id="carPosition" type="text" maxlength="15" required>
			</div>
			</div>
			<div class="row g-3">
			<div class="col-md-6" style="padding-top: 20px;">
			<label class="form-label" for="carSdate">입사일*</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" required data-bs-original-title="" id="carSdate">
			</div>
			<div class="col-md-6" style="padding-top: 20px;">
			<label class="form-label" for="carFdate">퇴사일</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" data-bs-original-title="" id="carFdate">
			</div>
			</div>
			<label class="form-label" for="carDetail" style="padding-top:30px">세부내용</label>
			<textarea class="form-control" rows="5" cols="5" placeholder="역할 및 업무 내용을 입력하세요." maxlength="330" id="carDetail"></textarea>
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
			<div class="modal fade" id="carModalModify" tabindex="-1" aria-labelledby="carModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="carModalLabel">경력 수정</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" style="padding-top:0px">
			      <form class="needs-validation" novalidate method="post" id="carFormModify">
			     <div class="card-body">
			<div class="row g-3">
			<div class="col-md-4">
			<label class="form-label" for="com">회사명*</label>
			<input class="form-control" id="com" type="text" maxlength="15" required>
			</div>
			<div class="col-md-4">
			<label class="form-label" for="dep">부서명*</label>
			<input class="form-control" id="dep" type="text" maxlength="15" required>
			</div>
			<div class="col-md-4">
			<label class="form-label" for="position">직급*</label>
			<input class="form-control" id="position" type="text" required maxlength="15">
			</div>
			</div>
			<div class="row g-3">
			<div class="col-md-6" style="padding-top:20px;">
			<label class="form-label" for="sdate">입사일*</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" required data-bs-original-title="" id="sdate">
			</div>
			<div class="col-md-6" style="padding-top: 20px;">
			<label class="form-label" for="fdate">퇴사일</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" data-bs-original-title="" id="fdate">
			</div>
			</div>
			<label class="form-label" for="detail" style="padding-top:30px">세부내용</label>
			<textarea class="form-control" rows="5" cols="5" placeholder="역할 및 업무 내용을 입력하세요." maxlength="330" id="detail"></textarea>
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

		$("#carModal").on("hidden.bs.modal", function(){
			$(this).find("#carForm").get(0).reset();
		}).on("shown.bs.modal", function(){
			$(this).find("#carName").focus();
		});
		
		$("#carModalModify").on("hidden.bs.modal", function(){
			$(this).find("#carFormModify").get(0).reset();
		}).on("shown.bs.modal", function(){
			$(this).find("#name").focus();
		});
			
		 	$.ajax({
				url : "${cPath}/gen/myinfo/career",
				method : "get",
				dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
				,
				success : function(resp, status, jqXHR) {
					let carList = resp;
					console.log(carList);
					let divTags = [];
					console.log(carList);
					if (carList && carList.length > 0) {
						$(carList).each(function(index, car) {
							divTags.push(makeDiv(index, car));	
						});
					} 
					$('.careerBody').append(divTags);
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
			
		 	$(document).on("submit", "#carForm", function(event) {
		 		event.preventDefault();
				let carCom = $('#carCom').val();
				let carDep = $('#carDep').val();
				let carPosition = $('#carPosition').val();
				let carSdate = new Date($("#carSdate").val());
				let carFdate = new Date($("#carFdate").val());
				let carDetail = $('#carDetail').val();
				
				let isValidSDate = Date.parse(carSdate);
				let isValidFDate = Date.parse(carFdate);
				if(isValidSDate) {
					carSdate = carSdate.toISOString().slice(0, 10).replace(/-/g, '');
				} else {
					carSdate = null;
				}
				if(isValidFDate) {
					carFdate = carFdate.toISOString().slice(0, 10).replace(/-/g, '');
				} else {
					carFdate = null;
				}
				if(carDetail == null) {
					carDetail = '';
				}
				
				$.ajax({
					url : "${cPath}/gen/myinfo/career",
					method : "post",
					data : {
						carCom : carCom,
						carDep : carDep,
						carPosition : carPosition,
						carSdate : carSdate,
						carFdate : carFdate,
						carDetail : carDetail
					},
					dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
					,
					beforeSend : function(xhr)
					{
					   xhr.setRequestHeader(header,token);
					},
					success : function(resp, status, jqXHR) {
						$('#carModal').modal('hide');
						let car = resp;
						let singleDiv = makeDiv(0, car);
						$('.careerBody').prepend(singleDiv);
						
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
			});  
			 
			 $(document).on("click", ".btn-modify", function() {
				 $("#carModalModify").modal('show');
				 let carNo = $(this).closest(".card-body").siblings(".card-header").children("p").text();
				 let oldCom = $(this).closest(".card-body").siblings(".card-header").children("h4").text();
				 
				 let oldDep = $(this).closest(".row3").siblings(".row1").children(".dep").text();
				 let oldPosition = $(this).closest(".row3").siblings(".row1").children(".position").text();
				 
				 let oldSDate = $(this).closest(".row3").siblings(".row2").children(".sdate").text();
				 let oldFDate = $(this).closest(".row3").siblings(".row2").children(".fdate").text();
				 let oldDetail = $(this).closest(".row3").children(".col-md-11").text();
				 
				 let cardDiv = $(this).closest(".card");
	 
				 
				 $('#com').val(oldCom);
				 $('#dep').val(oldDep);
				 $('#position').val(oldPosition);
				 $("#sdate").val(oldSDate);
				 $("#fdate").val(oldFDate);
				 $('#detail').val(oldDetail);
				 
				$("#carFormModify").on("submit", function(event) {
					event.preventDefault();
					let carCom = $('#com').val();
					let carDep = $('#dep').val();
					let carPosition = $('#position').val();
					let carSdate = new Date($("#sdate").val());
					let carFdate = new Date($("#fdate").val());
					let carDetail = $('#detail').val();
					if(carDetail == null) {
						carDetail = '';
					}
					
					
					let isValidSDate = Date.parse(carSdate);
					let isValidFDate = Date.parse(carFdate);
					if(isValidSDate) {
						carSdate = carSdate.toISOString().slice(0, 10).replace(/-/g, '');
					} else {
						carSdate = null;
					}
					if(isValidFDate) {
						carFdate = carFdate.toISOString().slice(0, 10).replace(/-/g, '');
					} else {
						carFdate = null;
					}
					if(carDetail == null) {
						carDetail = '';
					}
					
					console.log("회사: " + carCom);
					console.log("부서: " + carDep);
					console.log("직급: " + carPosition);
					console.log("입사일: " + carSdate);
					console.log("퇴사일: " +carFdate);
					console.log("세부사항: " +carDetail);

				$.ajax({
						url : "${cPath}/gen/myinfo/career",
						method : "put",
						contentType: 'application/json; charset=utf-8',
						data : JSON.stringify({
							carNo : carNo,
							carCom : carCom,
							carDep : carDep,
							carPosition : carPosition,
							carSdate : carSdate,
							carFdate : carFdate,
							carDetail : carDetail
						}),
						dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
						,
						beforeSend : function(xhr)
						{
						   xhr.setRequestHeader(header,token);
						},
						success : function(resp, status, jqXHR) {
							$('#carModalModify').modal('hide');
							cardDiv.remove();
							let car = resp;
							let singleDiv = makeDiv(0, car);
							$('.careerBody').prepend(singleDiv);
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});  
				 }); 
					
			 });
			
			let makeDiv = function(index, car) {
				return $("<div>").addClass("card").append(
						$("<div>").addClass("card-header pb-0").append(
								$("<p>").css("display","none").addClass("awardNo").text(car.carNo),
								$("<h4>").addClass("txt-primary f-w-700").text(car.carCom)
								
							),	
							$("<div>").addClass("card-body").append(
								$("<div>").addClass("row row1").append(
									$("<h6>").addClass("f-w-700 col-md-1").text("근무부서"),
									$("<div>").addClass("col-sm-3 dep").css("border-right", "1px solid #e6edef").text(car.carCom),
									$("<h6>").addClass("f-w-700 col-md-1").text("직급"),
									$("<div>").addClass("col-sm-3 position").text(car.carDep)
									
								),
								$("<div>").addClass("row row2").css("margin-top","20px").append(
										$("<h6>").addClass("col-sm-1").text("직무기간"),
										$("<div>").addClass("col-sm-2 sdate").text(car.carSdate),
										$("<p>").addClass("col-sm-1").css("margin-left","-100px").text("-"),
										$("<div>").addClass("col-sm-2 fdate").css("margin-left","-80px").text(car.carFdate)
									),
								$("<div>").addClass("row row3").css("padding-top", "30px").append(
									$("<div>").addClass("col-md-11").text(car.carDetail),
									$("<div>").addClass("col-md-12").append(
											$("<button>").addClass("btn btn-info btn-sm btn-del").attr({
												onclick : "location.href='${cPath }/gen/myinfo/career/" + car.carNo + "';",
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
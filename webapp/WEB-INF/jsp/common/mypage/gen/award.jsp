<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자     		   수정내용
* ----------  ---------  -----------------
* 2022. 8. 19.  조채원       	 최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<div class="row" style="padding: 20px">
		<div class="col-sm-6">
			<h4>수상이력</h4>
		</div>
		<div class="col-sm-6">
			<button class="btn btn-pill btn-primary btn-air-primary btn_Add" style="float: right" data-bs-toggle="modal" data-bs-target="#awardModal">수상이력 추가</button>
		</div>
	</div>              
                      
	<div class="awardBody"></div>
			<!-- Modal -->
			<div class="modal fade" id="awardModal" tabindex="-1" aria-labelledby="awardModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="awardModalLabel">수상이력 등록</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" style="padding-top:0px">
			      <form class="needs-validation" novalidate method="post" id="awardForm">
			     <div class="card-body">
			<div class="row g-3">
			<div class="col-md-6">
			<label class="form-label" for="awardName">상훈명*</label>
			<input class="form-control" id="awardName" type="text" maxlength="30" required>
			<div class="invalid-feedback">상훈명을 입력하세요</div>
			</div>
			<div class="col-md-6">
			<label class="form-label" for="awardInsti">기관명*</label>
			<input class="form-control" id="awardInsti" type="text" maxlength="30" required>
			<div class="invalid-feedback">기관명을 입력하세요</div>
			</div>
			</div>
			<div class="row g-3">
			<div class="col" style="padding-top: 20px;">
			<label class="form-label" for="awardDate">수상일*</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" data-bs-original-title="" id="awardDate">
			<div class="invalid-feedback">수상일을 입력하세요</div>
			</div>
			</div>
			<label class="form-label" for="validationCustom03" style="padding-top:30px">수상내역</label>
			<textarea class="form-control" rows="5" cols="5" maxlength="330" placeholder="수상내역 및 역할을 입력하세요." name="awardDetail" id="awardDetail"></textarea>
			</div>
			<div class="card-foot" style="float:right; padding-top:20px">
			        <button class="btn btn-primary" type="submit" id="btn-form" >저장</button>
			        <button class="btn btn-light btn-cancel" type="button" style="margin-left:10px" data-bs-dismiss="modal">취소</button>
			      </div>	      
			  
			      </form>
			      </div>
			    </div>
			  </div>
			</div>  
			
			
			<div class="modal fade" id="awardModalModify" tabindex="-1" aria-labelledby="awardModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="awardModalLabel">수상이력 수정</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" style="padding-top:0px">
			      <form class="needs-validation" novalidate method="post" id="awardModifyForm">
			     <div class="card-body">
			<div class="row g-3">
			<div class="col-md-6">
			<label class="form-label" for="name">상훈명*</label>
			<input class="form-control" id="name" type="text" required maxlength="30">
			</div>
			<div class="col-md-6">
			<label class="form-label" for="insti">기관명*</label>
			<input class="form-control" id="insti" type="text" maxlength="30" required>
			</div>
			</div>
			<div class="row g-3">
			<div class="col" style="padding-top: 20px;">
			<label class="form-label" for="validationCustom02">수상일*</label>
			<input class="datepicker-here form-control digits" type="text" data-language="en" data-bs-original-title="" name="date" id="date">
			</div>
			</div>
			<label class="form-label" for="detail" style="padding-top:30px">수상내역*</label>
			<textarea class="form-control" rows="5" cols="5" maxlength="330" placeholder="수상내역 및 역할을 입력하세요." id="detail"></textarea>
			</div>
			<div class="card-foot" style="float:right; padding-top:20px">
			        <button class="btn btn-primary" type="submit" id="btn-modify" >저장</button>
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

		$("#awardModal").on("hidden.bs.modal", function(){
			$(this).find("#awardForm").get(0).reset();
		}).on("shown.bs.modal", function(){
			$(this).find("#licName").focus();
		});
		
		$("#awardModalModify").on("hidden.bs.modal", function(){
			$(this).find("#awardModifyForm").get(0).reset();
		}).on("shown.bs.modal", function(){
			$(this).find("#name").focus();
		});
			
			
			$.ajax({
				url : "${cPath}/gen/myinfo/award",
				method : "get",
				dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
				,
				success : function(resp, status, jqXHR) {
					let awardList = resp;
					let divTags = [];
					console.log(awardList);
					if (awardList && awardList.length > 0) {
						$(awardList).each(function(index, award) {
							divTags.push(makeDiv(index, award));	
						});
					} 
					$('.awardBody').append(divTags);
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
			
			
			 $(document).on("submit", "#awardForm", function(event) {
				 event.preventDefault();
				let awardName = $('#awardName').val();
				let awardInsti = $('#awardInsti').val();
				let awardDate = new Date($(".datepicker-here").val());
				let awardDetail = $('#awardDetail').val();
				
				let isValidDate = Date.parse(awardDate);
				if(isValidDate) {
					awardDate = awardDate.toISOString().slice(0, 10).replace(/-/g, '');
				} else {
					awardDate = null;
				}
				
				if(awardDetail == null) {
					awardDetail = '';
				}

				$.ajax({
					url : "${cPath}/gen/myinfo/award",
					method : "post",
					data : {
						awardName : awardName,
						awardInsti : awardInsti,
						awardDate : awardDate,
						awardDetail : awardDetail
					},
					dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
					,
					beforeSend : function(xhr)
					{
					   xhr.setRequestHeader(header,token);
					},
					success : function(resp, status, jqXHR) {
						$('#awardModal').modal('hide');
						let award = resp;
						let singleDiv = makeDiv(0, award);
						$('.awardBody').prepend(singleDiv);
						
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
			});  
			 
			 let awardNo = '';
			 let cardDiv = '';
			 $(document).on("click", ".btn-modify", function() {
				 $("#awardModalModify").modal('show');
				 awardNo = $(this).closest(".card-body").siblings(".card-header").children("p").text();
				 let oldName = $(this).closest(".card-body").siblings(".card-header").children("h4").text();
				 let oldInsti = $(this).closest(".card-body").children(".row1").children(".col-sm-2").text();
				 let oldDate = $(this).closest(".card-body").children(".row1").children(".col-md-9").text().substr(0,10);
				 let oldDetail = $(this).closest(".col-md-12").siblings(".awardDetail").text();
				 
				 cardDiv = $(this).closest(".card");
				 
				 console.log(awardNo);
				 console.log(oldName);
				 console.log(oldInsti);
				 console.log(oldDate);
				 console.log(oldDetail);
				 
				 $('#name').val(oldName);
				 $('#insti').val(oldInsti);
				 $('#date').val(oldDate);
				 $('#detail').val(oldDetail);
			 });
			 
			 $(document).on("submit", "#awardModifyForm", function() {
					event.preventDefault();
					let awardName = $('#name').val();
					let awardInsti = $('#insti').val();
					let awardDate = new Date($('#date').val());
					let awardDetail = $('#detail').val();
					
					if(awardDetail == null) {
						awardDetail = '';
					}
					let isValidDate = Date.parse(awardDate);
					
					
					if(isValidDate) {
						awardDate = awardDate.toISOString().slice(0, 10).replace(/-/g, '');
					} else {
						awardDate = null;
					}
					
					console.log(awardName);
					console.log(awardInsti);
					console.log(awardDate);
					console.log(awardDetail);
					
					
					 $.ajax({
						url : "${cPath}/gen/myinfo/award",
						method : "put",
						contentType: 'application/json; charset=utf-8',
						data : JSON.stringify({
							awardNo : awardNo,
							awardName : awardName,
							awardInsti : awardInsti,
							awardDate : awardDate,
							awardDetail : awardDetail
						}),
						dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
						,
						beforeSend : function(xhr)
						{
						   xhr.setRequestHeader(header,token);
						},
						success : function(resp, status, jqXHR) {
							$('#awardModalModify').modal('hide');
							console.log(cardDiv);
							cardDiv.remove();
							let award = resp;
							let singleDiv = makeDiv(0, award);
							$('.awardBody').prepend(singleDiv);
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});  
				 }); 
			
			let makeDiv = function(index, award) {
				return $("<div>").addClass("card").append(
						$("<div>").addClass("card-header pb-0").append(
								$("<p>").css("display","none").addClass("awardNo").text(award.awardNo),
								$("<h4>").addClass("txt-primary f-w-700").text(award.awardName)
							),	
							$("<div>").addClass("card-body").append(
								$("<div>").addClass("row row1").append(
									$("<div>").addClass("col-sm-2").css("border-right", "1px solid #e6edef").text(award.awardInsti),
									$("<div>").addClass("col-md-9").text(award.awardDate)
								),
								$("<div>").addClass("row row2").css("padding-top", "30px").append(
									$("<div>").addClass("col-md-11 awardDetail").text(award.awardDetail),
									$("<div>").addClass("col-md-12").append(
											$("<button>").addClass("btn btn-info btn-sm btn-del").attr({
												onclick : "location.href='${cPath }/gen/myinfo/award/" + award.awardNo + "';",
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
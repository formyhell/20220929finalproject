<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자     		   수정내용
* ----------  ---------  -----------------
* 2022. 8. 29.      306-22        최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 


			<!-- Modal -->
			<div class="modal fade" id="projModal" tabindex="-1" aria-labelledby="projModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="projModalLabel">프로젝트 리뷰 작성</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" style="padding-top:0px">
			      <form class="needs-validation" method="post" id="projForm">
			      <div class="card-body">
			      <div class="row" style="padding-bottom: 20px;">
			      <div class="col">
                         <div class="mb-3">
			      <label class="form-label" for="validationCustom01"><strong>프로젝트 평점</strong></label>
				<div class="card-body" style="padding-left: 0px; padding-top: 0px;">
                    <div class="rating-container">
                      <select id="u-rating-fontawesome" name="rating" class="revProjrating" autocomplete="off">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
                    </div>
                  </div>
				 <small class="text-muted">프로젝트에 대한 별점을 입력해주세요.</small>
				 </div>
				 </div>
				 </div>
				 <div class="row" style="padding-bottom: 20px;">
				 <div class="col">
                         <div class="mb-3">
				 <label class="form-label" for="validationCustom02"><strong>진행 기업 평점</strong></label>
				<div class="card-body" style="padding-left: 0px; padding-top: 0px;">
                    <div class="rating-container">
                      <select id="u-rating-fontawesome1" name="rating" class="revComrating" autocomplete="off">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
                    </div>
                  </div>
				 <small class="text-muted">프로젝트를 진행한 기업에 대한 별점을 입력해주세요.</small>
				 </div>
				 </div>
				 </div>
				 <label class="form-label" for="validationCustom03"><strong>리뷰 상세 내용</strong></label>
				<textarea class="form-control" rows="5" cols="5" name="revContent"></textarea>
				 </div>			      
			      <div class="card-foot" style="float:right">
			        <button class="btn btn-primary" type="button" id="btn-form" >저장</button>
			        <button class="btn btn-light btn-cancel" type="button" style="margin-right:10px" data-bs-dismiss="modal">취소</button>
			      </div>
			      </form>
			      </div>
			    </div>
			  </div>
			</div>   
			
			<!-- Modal -->
			<div class="modal fade" id="projModifyModal" tabindex="-1" aria-labelledby="projModifyModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="projModalLabel">프로젝트 리뷰 수정</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" style="padding-top:0px padding-top: 0px;">
			      <form class="needs-validation" method="post" id="projModifyForm">
			      <input type="hidden" name="revId">
			      <div class="card-body">
			      <div class="row" style="padding-bottom: 20px;">
			      <div class="col">
                         <div class="mb-3">
			      <label class="form-label" for="validationCustom01"><strong>프로젝트 평점</strong></label>
				 <div class="card-body" style="padding-left: 0px; padding-top: 0px;">
                    <div class="rating-container">
                      <select id="u-rating-fontawesome2" name="rating" class="projrating" autocomplete="off">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
                    </div>
                  </div>
				 <small class="text-muted">프로젝트에 대한 별점을 입력해주세요.</small>
				 </div>
				 </div>
				 </div>
				 <div class="row" style="padding-bottom: 20px;">
				 <div class="col">
                         <div class="mb-3">
				 <label class="form-label" for="validationCustom02"><strong>진행 기업 평점</strong></label>
				<div class="card-body" style="padding-left: 0px; padding-top: 0px;">
                    <div class="rating-container">
                      <select id="u-rating-fontawesome3" name="rating" class="comrating" autocomplete="off">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
                    </div>
                  </div>
				 <small class="text-muted">프로젝트를 진행한 기업에 대한 별점을 입력해주세요.</small>
				 </div>
				 </div>
				 </div>
				 <label class="form-label" for="validationCustom03"><strong>리뷰 상세 내용</strong></label>
				<textarea class="form-control" rows="5" cols="5" name="content"></textarea>
				 </div>			      
			      <div class="card-foot" style="float:right">
			        <button class="btn btn-primary" type="button" id="btn-submit" >저장</button>
			        <button class="btn btn-light btn-cancel" type="button" style="margin-right:10px" data-bs-dismiss="modal">취소</button>
			      </div>
			      </form>
			      </div>
			    </div>
			  </div>
			</div>   
			            
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>프로젝트 상세조회</h3>
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="row">
              <div class="col-xl-12 xl-60 box-col-8">
                <div class="card">
                  <div class="job-search">
                    <div class="card-body">
                      <div class="media">
                        <div class="media-body mediaWrapper">
                          <div class="row">
                          	<p id="projId" style="display:none">${proj.projId }</p>
                          	<h4 class="f-w-600 col-md-8 txt-primary" style="margin-right: -60px">${proj.projTitle }
                          	<c:if test="${proj.projRating != 0}">
                          	<ul class="rating col-sm-4">
                          	<h6>
                          	<c:forEach begin="1" end="${proj.projRating / 1 }">
                            	<li><i class="fa fa-star font-warning"></i></li>
                            </c:forEach>
                            <c:if test="${proj.projRating % 1 > 0}">
                            	<i class="fa fa-star-half-o font-warning"></i>
                            </c:if>
                          </h6>
                          </ul>
                          </c:if>
                          </h4>
                          </div>
                          <p>${proj.projRegist }</p>
                          
                          <c:if test="${not empty proj.projReviewList && proj.projState eq '완료'}">
                          <c:set var="count" value="0"/>
                      	<security:authentication property="principal" var="authMember"/>
                      	<c:forEach items="${proj.projReviewList }" var="rev">
                      	<c:if test="${(fn:contains(rev.revWriter,authMember.realMember.memId ))}">
                          	<c:set var="count" value="${count + 1}" />
                        </c:if>
                        </c:forEach>
                      <c:if test="${count < 1 }">
                        	<a class="btn btn-primary btn-sm job-apply-btn" data-bs-toggle="modal" data-bs-target="#projModal">리뷰 작성</a>
                        </c:if> 
                        </c:if>
                        <c:if test="${empty proj.projReviewList && proj.projState eq '완료'}">
                        	<a class="btn btn-primary btn-sm job-apply-btn" data-bs-toggle="modal" data-bs-target="#projModal">리뷰 작성</a>
                        </c:if>
                        </div>
                      </div>
                      <div class="job-description">
                        <h6>세부사항</h6>
                      	<P>프로젝트 기간 ${proj.projRealsdate }-
                      	<c:if test="${proj.projState eq '진행중' }">
                      		${proj.projFdate }
                      	</c:if>
                      	<c:if test="${proj.projState eq '완료' }">
                      		${proj.projRealfdate }
                      	</c:if>
                      	</P>
                      	<p>비용 ${proj.projEstimate }</p>
                      	<p>참여인원 ${proj.projRealNum }</p>
                      	<p>고용형태 ${proj.projEmptype }</p>
                      	<p>분류 ${proj.projType }</p>
                      	<p>지역 ${proj.projLoc }</p>
                      	<p class="f-w-600">프로젝트 필요기술</p>
                      	<c:if test="${not empty proj.objSingleList }">
                      		<c:forEach items="${proj.objSingleList }" var="obj">
                      			<span class="badge rounded-pill badge-primary col-sm-1">${obj }</span>
                      		</c:forEach>
                      	</c:if>
                      	<p class="f-w-600">프로젝트 모집분야</p>
                      	<c:if test="${not empty proj.skillSingleList }">
                      		<c:forEach items="${proj.skillSingleList }" var="skill">
                      			<span class="badge rounded-pill badge-light text-dark col-sm-1">${skill }</span>
                      		</c:forEach>
                      	</c:if>
                      </div>
                      <div class="job-description">
                        <h6>업무내용</h6>
                        	<pre>${proj.projContent }</pre>
                      </div>
                      <div class="job-description">
                        <h6>모집요건</h6>
                        	<pre>${proj.projQualifi }</pre>
                      </div>
                    </div>
                  </div>
                </div>
            <c:if test="${proj.projState eq '완료' }">  
                <div class="card comment-box">
                    <div class="card-body">
                      <h4>프로젝트 리뷰</h4>
                      <ul id="revBody">
                      <c:if test="${not empty proj.projReviewList}">
                      	<c:forEach items="${proj.projReviewList }" var="rev">
                        <li class="revLi">
                          <div class="media align-self-center"><img class="align-self-center" src="${cPath }/resources/images/${rev.genImg }" alt="Generic placeholder image">
                            <div class="media-body">
                            	<div class="revId" style="display:none">${rev.revId }</div>
                              <div class="row">
                                <div class="col-md-4 xl-100">
                                    <h6 class="mt-0">${rev.revWriter }<span> ( ${rev.revWriterObj } )</span></h6></div>
                               	<div class="col-md-8 xl-100">
                                  <ul class="comment-social learning-comment" style="float: right;">
                                    <li class="digits proj"><i class="icofont icofont-briefcase"></i>프로젝트 ${rev.revProjrating }</li>
                                    <li class="digits com"><i class="icofont icofont-businessman"></i>기업 ${rev.revComrating }</li>
                                  </ul>
                                </div>
                              </div>
                              <p>${rev.revContent }</p>
                            </div>
                          </div>
                          <security:authentication property="principal" var="authMember"/>
                          <c:if test="${authMember.realMember.memId eq rev.revWriter}">
                          <div style="float : right; margin-bottom:30px"> 
                            <button class="btn btn-light btn-sm" id="btn-modify" type="button">수정</button>
                            <button class="btn btn-danger btn-sm" id="btn-del" type="button">삭제</button>
                           </div>
                           </c:if>
                        </li>
                        </c:forEach>
                        </c:if>
                      </ul>
                    </div>
                  </div>
                </c:if>  
              </div>
            </div>
          </div> 

<script src="${cPath }/resources/assetsPms/js/jquery-3.5.1.min.js"></script>   
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}'; 

$("#projModal").on("hidden.bs.modal", function(){
	$(this).find("#projForm").get(0).reset();
});

$("#projModifyModal").on("hidden.bs.modal", function(){
	$(this).find("#projModifyForm").get(0).reset();
});

$(document).on("click", "#btn-form", function() {
		let revProj = $("#projId").text();
		let revProjrating = $(".revProjrating").val();
		let revComrating = $(".revComrating").val();
		let revContent = $('textarea[name=revContent]').val();
		
		console.log("revProj: " + revProj);
		console.log("revProjrating: " + revProjrating);
		console.log("revComrating: " + revComrating);
		console.log("revContent: " + revContent);
			
		 $.ajax({
			url : "${cPath}/myinfo/project/gen/" + revProj,
			method : "post",
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify({
				revProj : revProj,
				revProjrating : revProjrating,
				revComrating : revComrating,
				revContent : revContent
			}),
			dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
			,
			beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
			success : function(resp, status, jqXHR) {
				$('#projModal').modal('hide');
				let resultMap = resp;
				let projRev = resultMap.projRev;
				$(".media-body").children(".job-apply-btn").remove();
				let singleDiv = makeDiv(projRev);
				$('#revBody').prepend(singleDiv); 
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});  
});
let liTag = null;
$(document).on("click", "#btn-modify", function() {
	$('#projModifyModal').modal('show');
	
	let divRow = $(this).closest("li").children(".media").children(".media-body");
	let revId = divRow.children(".revId").text();
	let revProjrating = divRow.children(".row").children(".col-md-8").children("ul").children(".proj").text().substr(5,1);
	let revComrating = divRow.children(".row").children(".col-md-8").children("ul").children(".com").text().substr(3,1);
	let revContent = divRow.children("p").text();
	liTag = $(this).closest(".revLi");
	
	console.log(revProjrating);
	console.log(revComrating);
	$(".projrating").val(revProjrating);
	$(".comrating").val(revComrating);
	$('textarea[name=content]').val(revContent);
	$('input[name=revId]').val(revId);
});

$(document).on("click", "#btn-submit", function(event) {
	event.preventDefault();
	let revProj = $("#projId").text(); 
	let revId = $('input[name=revId]').val();
	let revProjrating = $(".projrating").val();
	let revComrating = $(".comrating").val();
	let revContent = $('textarea[name=content]').val();
	
	console.log("revProj: " + revProj);
	console.log("revId: " + revId);
	console.log("revProjrating: " + revProjrating);
	console.log("revComrating: " + revComrating);
	console.log("revContent: " + revContent);

	  $.ajax({
			url : "${cPath}/myinfo/project/gen/" + revProj,
			method : "put",
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify({
				revId : revId,
				revProj : revProj,
				revProjrating : revProjrating,
				revComrating : revComrating,
				revContent : revContent
			}),
			dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
			,
			beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
			success : function(resp, status, jqXHR) {
				$('#projModifyModal').modal('hide');
				liTag.remove();
				let projRev = resp;
				let singleDiv = makeDiv(projRev);
				$('#revBody').prepend(singleDiv); 
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});  
});

$(document).on("click", "#btn-del", function() {
	let revId = $(this).closest("li").children(".media").children(".media-body").children(".revId").text();
	liTag = $(this).closest(".revLi");
	let revProj = $("#projId").text(); 
	
	$.ajax({
		url : "${cPath}/myinfo/project/gen/" + revProj,
		method : "delete",
		contentType: 'application/json; charset=utf-8',
		data : JSON.stringify({
			revId : revId
		}),
		dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
		,
		beforeSend : function(xhr)
		{
		   xhr.setRequestHeader(header,token);
		},
		success : function(resp, status, jqXHR) {
			liTag.remove();
			$(".mediaWrapper").append('<a class="btn btn-primary btn-sm job-apply-btn" data-bs-toggle="modal" data-bs-target="#projModal">리뷰 작성</a>');
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	}); 
	
});

let makeDiv = function(projRev) {
	return $("<li>").addClass("revLi").append(
				$("<div>").addClass("media align-self-center").append(
					$("<img>").addClass("align-self-cente").attr({
						"src" : "${cPath }/resources/images/" + projRev.genImg,
						"alt" : "Generic placeholder image"
					}),
					$("<div>").addClass("media-body").append(
						$("<div>").css("display", "none").addClass("revId").text(projRev.revId),
						$("<div>").addClass("row").append(
							$("<div>").addClass("col-md-4 xl-100").append(
								$("<h6>").addClass("mt-0").text(projRev.revWriter).append(
									$("<span>").text("(" + projRev.revWriterObj + ")")		
								)	
							),
							$("<div>").addClass("col-md-8 xl-100").append(
									$("<ul>").addClass("comment-social learning-comment").append(
										$("<li>").addClass("digits proj").append(
											$("<i>").addClass("icofont icofont-briefcase").text("프로젝트 " +projRev.revProjrating)	
										),
										$("<li>").addClass("digits com").append(
												$("<i>").addClass("icofont icofont-businessman").text("기업 " + projRev.revComrating)		
										)
									)
							)
						),
						$("<p>").text(projRev.revContent)
					)
				),
				$("<div>").css({"float":"right", "margin-bottom":"30px"}).append(
					$("<button>").addClass("btn btn-light btn-sm").css("margin-right","10px").attr({
						"id" : "btn-modify",
						"type" : "button"
					}).text("수정"),
					$("<button>").addClass("btn btn-danger btn-sm").attr({
						"id" : "btn-del",
						"type" : "button"
					}).text("삭제")
				)
			);
}

</script>         
</body>
</html>
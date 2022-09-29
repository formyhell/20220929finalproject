<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%--
* [[개정이력(Modification Information)]]
* 	수정일              수정자      	  수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.   조채원     		 컨트롤러 연결
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<style>
th, td {
  text-align: center;
}

table {
  	 display: block;
  	 overflow: auto;
  	 table-layout: fixed;
  }
  
  td {
  	word-break:break-all;
  	text-overflow:ellipsis; 
  	white-space:nowrap;
  	overflow:hidden; 
  	max-width: 100px;
  }
</style>

<!-- Modal -->
<div class="modal fade" id="denyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">반려 사유 입력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <form class="needs-validation"  method="post" novalidate id="denyForm">
      		<input id="projId" style="display:none">
      		<textarea class="form-control" id="projReject" cols="60" rows="3" maxlength="30" required></textarea>
      		<div class="invalid-feedback">반려 사유를 입력하세요.</div>
        <sec:csrfInput/>
        <button type="button" class="btn btn-light" style="float:right; margin-top:20px" data-bs-dismiss="modal">취소</button>
        <input type="submit" class="btn btn-primary" style="float:right; margin-right:10px; margin-top:20px"  id="btn_submit" value="저장" />
      </form>
      </div>
    </div>
  </div>
</div>

                    
	<div class="container-fluid">
            <div class="row">
              <div class="col-sm-12">
                <div class="card" style="min-height: 800px;">
                  <div class="card-header pb-0">
                    <h5>검토 리스트</h5>
                  </div>
                  <div class="card-body">
                    <div class="row">
                     <div id="searchUI" class="form-field">
						<div class="row" style="margin-left:5px;margin-top:10px;">
							<div class="col-sm-3" style="padding: 0px;">
								<div class="mb-3">
									<form:input class="form-control" style="border: 1px solid #DEDEDE;" placeholder="Search Here" path="simpleCondition.searchWord" />
					            </div>
                  			</div>
							<div class="col-sm-3">
								<div class="mb-3">
					                <input type="button" id="searchBtn" class="btn btn-outline-primary" value="검색" >
					            </div>
                  			</div>
						</div>
	                    <a class="btn btn-primary btn-sm btn-checkApprove" style="float:right; margin-top: -45px;">선택승인</a>
					</div>   
                      <div class="order-history table-responsive wishlist">
                        <table class="table table-bordered">
                          <thead>
                            <tr>
                            	<th class="selectDiv">전체선택<input type='checkbox' style="margin-left:5px" class='checkbox_animated' id='selectall' onclick='selectAll()'/></th>
                            	<th>No.</th>
                                <th  style="width: 10%;"><spring:message code="outProj.projId" /></th>
								<th  style="width: 35%;"><spring:message code="outProj.projTitle" /></th>
								<th  style="width: 10%;"><spring:message code="outProj.projRegist" /></th>
								<th  style="width: 5%;"><spring:message code="outProj.projRecruitsdate" /></th>
								<th  style="width: 5%;"><spring:message code="outProj.projRecruitfdate" /></th>
								<th  style="width: 25%;">관리</th>
                            </tr>
                          </thead>
                          <tbody>
                            
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                   <div class="pagingArea pagination justify-content-center pagination-primary" style="padding-bottom: 20px"></div>
                </div>
              </div>
            </div>
          </div>
<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath}/admin/checkList" method="get">
	<input type="hidden" name="page" />
	<form:input type="hidden" path="searchWord" />
</form:form>  
<script src="${cPath}/resources/assetsPms/js/form-validation-custom.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	crossorigin="anonymous"></script>
	<script>
	let header = '${_csrf.headerName}';
	let token =  '${_csrf.token}'; 
	
	function approveAlert() {
		Swal.fire({
		      icon: 'success',
		      title: '프로젝트 공고가 승인되었습니다.',
		    });
	}

	function denyAlert() {
		Swal.fire({
		      icon: 'success',
		      title: '프로젝트 공고가 반려되었습니다.',
		    });
	}

	function errerAlert() {
		Swal.fire({
			icon: 'error',
		      title: '처리에 실패했습니다.',
		    });
	}
	
	let pagingArea = $(".pagingArea").on("click", "a", function(event) {
		let page = $(this).data("page");
		$("#searchForm").find("[name=page]").val(page);
		searchForm.submit();
	});
	
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(event) {
		searchForm.get(0).reset();
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input) {
			let name = $(this).attr("name");
			let value = $(this).val();
			searchForm.find("[name=" + name + "]").val(value);
		});
		searchForm.submit();
	});
	
	
	let searchForm = $("#searchForm").on("submit", function(event) {
		event.preventDefault();
		let url = this.action;
	    let method = this.method;
	    let data = $(this).serialize();
	    $.ajax({
	        url : url,
	        method : method,
	        data : data,
	        dataType : "json",
	        success : function(resp) {
	        	let pagingVO = resp;
	        	let projList = pagingVO.dataList;
				let trTags = [];
				if (projList && projList.length > 0) {
					$(projList).each(function(index, proj) {
						trTags.push(makeSingleTr(index, proj));
					});
				} else {
					let trTag = $("<tr>").html(
							$("<td>").attr("colspan", "8").html(
									"등록 신청한 프로젝트가 없습니다."));
					trTags.push(trTag);
				}
				$("tbody").html(trTags);
				$(".pagination").html(pagingVO.pagingHTMLBS);
	        }
	     })
	     return false;
	  }).submit();
	
		let makeSingleTr = function(index, proj) {
			return $("<tr>").addClass("projTr").append(
					$("<td>").css("width","5px").append(
							$("<input>").attr({
								"class":"checkbox_animated",
								"id":"chk-ani"+proj.rnum,
								"type":"checkbox"
							})		
					),
					$("<td>").css("width","5px").html(proj.rnum),
					$("<td>").addClass("projId").attr({"onclick":"location.href='${cPath}/admin/checkList/" + proj.projId + "/form'","name":proj.projId}).html(proj.projId),
					$("<td>").css("width","30px").html(proj.projTitle),
					$("<td>").html(proj.projRegist),
					$("<td>").html(proj.projRecruitsdate),
					$("<td>").html(proj.projRecruitfdate),
					$("<td>").append(
							$("<a>").addClass("btn btn-danger btn-sm btn-deny").css("float","right").attr({
								"data-bs-toggle" : "modal",
								"data-bs-target" : "#denyModal"
							}).text("반려"),
							$("<a>").addClass("btn btn-primary btn-sm btn-approve").css({"float":"right","margin-right":"10px"}).text("승인")		
					)
			);
		}
		
		function selectAll()  {
			  if($("#selectall").is(':checked')) {
					$(".checkbox_animated").attr("checked", true);
				} else {
					$(".checkbox_animated").attr("checked", false);
				}
		};
		
		$(".btn-checkApprove").on("click",function() {
			let projId = [];
			$(".checkbox_animated").each(function(index, chkbox) {
				if(chkbox.checked){
					let id = $(this).closest("td").siblings(".projId").text();
					projId.push(id);
				}
			})
			if(projId!=null && projId.length>0){
				projId.shift();
				approveFunction(projId.toString());
			} 
		});
		
		$(document).on("click", ".btn-approve", function() {
			let projId = $(this).closest("td").siblings(".projId").text();
			approveFunction(projId);
		});
		
		let approveFunction = function(projId) {
			 $.ajax({
					url : "${cPath}/admin/checkList",
					method : "put",
					contentType: 'application/json; charset=utf-8',
					data : JSON.stringify({
						projId : projId
					}),
					dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
					,
					beforeSend : function(xhr)
					{
					   xhr.setRequestHeader(header,token);
					},
					success : function(resp, status, jqXHR) {
						let projList = resp;
						if(projList) {
							approveAlert();
							$("#searchForm").submit();
							$("#selectall").remove();
							let inputTag = '<input type="checkbox" style="margin-left:5px" class="checkbox_animated" id="selectall" onclick="selectAll()"/>';
							$(".selectDiv").append(inputTag);
							$(projList).each(function(index, proj) {
								send("[아웃소싱공고]" + proj.projTitle + "에 대한 공고가 승인되었습니다.",proj.projRegist,"#");
							});
						} else {
							errerAlert();
						}
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});  
		};
		
		$(document).on("click", ".btn-deny", function() {
			let id = $(this).closest("td").siblings(".projId").text();
			$("#projId").val(id);
		});
		
		$(document).on("click", "#btn_submit", function(event) {
			event.preventDefault();
			let projId = $("#projId").val();
			console.log("projId: " + projId);
			let projReject = $("#projReject").val();
			
			$.ajax({
				url : "${cPath}/admin/checkList",
				method : "delete",
				contentType: 'application/json; charset=utf-8',
				data : JSON.stringify({
					projId : projId,
					projReject : projReject
				}),
				dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
				,
				beforeSend : function(xhr)
				{
				   xhr.setRequestHeader(header,token);
				},
				success : function(resp, status, jqXHR) {
					let proj = resp;
					if(proj){
						denyAlert();
						$('#denyModal').modal('hide');
						$("p[class=" + proj.projId + "]").parent(".card").remove();
						send("[아웃소싱공고]" + proj.projTitle + "에 대한 공고가 반려되었습니다.",proj.projRegist,"#");
						$("#searchForm").submit();
					} 
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
					errerAlert();
				}
			}); 
		});
</script>
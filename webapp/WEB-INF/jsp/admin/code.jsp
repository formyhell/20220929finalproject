<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 30.      작성자           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
#basic-1_length, #basic-1_filter, #basic-1_info, #basic-1_paginate {
	display: none;
}

.table-responsive {
	overflow-x: hidden;
}

#th_No {
	width: 10px !important;
	min-width: 0px !important;
}

#th_Act {
	width: 70px !important;
	min-width: 0px !important;
}
/* 왜 안되징  */
tbody tr{
	background-color: #e6edef !important;
}
</style>
<script>
<%-- 실패 alert창 --%>
function warningAlert(msg) {
	Swal.fire({ 
         icon: 'warning',
         title: msg
     });
}
<%-- 성공 alert창 --%>
function successAlert(msg){
	Swal.fire({
        icon: 'success',
        title: msg
    });
}

pageSize = "${showNum }";  // 여기서 넘어온 페이지 사이즈 값 세팅 필요

</script>
<c:if test="${not empty message }">
	<c:if test="${not empty rst }">
		<c:if test="${rst eq 'true'}">
			<script>successAlert("${message }");</script>
		</c:if>
		<c:if test="${rst eq 'false'}">
			<script>warningAlert("${message }");</script>
		</c:if>
		<c:remove var="message" scope="session" />
		<c:remove var="rst" scope="session" />
	</c:if>
</c:if>

<div class="container-fluid list-products">
	<div class="row">
		<!-- Individual column searching (text inputs) Starts-->
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header pb-0">
					<h5>COMMON CODE</h5>
					<br>
					<button style="float: right;" class="btn btn-primary"
						onclick="insertModalOpen();">공통코드 등록</button>

					<div id="searchUI" class="form-field">
						<div class="row">
							<div class="col-sm-1"
								style="padding-top: 7px; width: fit-content; padding-right: 0;">
								<div class="mb-3" style="width: fit-content; margin: 0;">
									<label>Show</label>
								</div>
							</div>
							<div class="col-sm-1">
								<div class="mb-3">
									<select id="show" class="form-select form-control">
										<option id="op_10" value="10">10</option>
										<option id="op_25" value="25">25</option>
										<option id="op_50" value="50">50</option>
										<option id="op_100" value="100">100</option>
									</select>
								</div>
							</div>
							<div class="col-sm-1" style="padding-top: 7px; padding-left: 0;">
								<div class="mb-3">
									<label>entries</label>
								</div>
							</div>
							<div class="col-sm-1" style="padding-top: 7px;">
								<div class="mb-3">
									<label>TypeName: </label>
								</div>
							</div>
							<div class="col-sm-2" style="padding-left: 0px;">
								<div class="mb-3">
									<select id="searchTypeId" class="form-select form-control">
										<c:choose>
											<c:when test="${not empty codeTypeList }">
												<option value="">선택안함</option>
												<c:forEach items="${codeTypeList }" var="codeTypeList">
													<option value="${codeTypeList.typeId }">${codeTypeList.typeName }</option>>
						                		</c:forEach>
											</c:when>
										</c:choose>
									</select>
								</div>
							</div>
							<div class="col-sm-1" style="padding-top: 7px;">
								<div class="mb-3">
									<label for="searchCodeName">CodeName: </label>
								</div>
							</div>
							<div class="col-sm-3" style="padding-left: 0px;">
								<div class="mb-3">
									<input id="searchCodeName" class="form-control"
										style="border: 1px solid #DEDEDE;" placeholder="Search Here" />
								</div>
							</div>
							<div class="col-sm-1">
								<div class="mb-3">
									<input type="button" id="searchBtn"
										class="btn btn-outline-primary" value="검색">
								</div>
							</div>
						</div>
					</div>


				</div>

				<div class="card-body">
					<div class="table-responsive product-table">


						<table class="display" id="basic-1">
							<thead>
								<tr>
									<th id="th_No">No.</th>
									<th>CodeId</th>
									<th>CodeName</th>
									<th>RegistDay</th>
									<th>UpdateDay</th>
									<th>TypeName(Id)</th>
									<th id="th_Act">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="codeList" value="${pagingVO.dataList }" />
								<c:choose>
									<c:when test="${not empty codeList }">
										<c:forEach items="${codeList }" var="code">
											<tr>
												<td>${code.rnum }</td>
												<td>${code.codeId }</td>
												<td>${code.codeName }</td>
												<td>${code.registday.substring(0,10) }</td>
												<td>${code.updateday.substring(0,10) }</td>
												<td><input type="hidden" readonly="readonly"
													name="typeId" value="${code.typeId }"> <input
													type="hidden" readonly="readonly" name="typeName"
													value="${code.typeName }"> ${code.typeName }&nbsp(${code.typeId
													})</td>
												<td style="">
													<button class="btn btn-primary btn-sm p-1" type="button"
														data-original-title="btn btn-primary btn-sm p-1" title=""
														onclick="updateModalOpen(this);">수정</button>
													<button class="btn btn-light btn-sm p-1" type="button"
														data-original-title="btn btn-light btn-sm p-1" title=""
														style="color: black;" onclick="deleteSubmitCheck(this);">삭제</button>
												</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7">등록된 공통코드 없음</td>
										</tr>

									</c:otherwise>
								</c:choose>
							</tbody>
							<!-- 페이징 -->
							<tfoot>
								<tr>
									<td colspan="6">
										<div
											class="pagingArea pagination justify-content-center pagination-primary">
											${pagingVO.pagingHTMLBS }</div>
									</td>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 등록 폼 -->
<div id="insertModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4>공통코드 추가</h4>
				<button type="button" class="btn" data-dismiss="modal"
					onclick="closeModal()">
					<span aria-hidden="true">&times;</span> <span class="sr-only">close</span>
				</button>
			</div>
			<form:form action="${cPath }/admin/code" modelAttribute="code"
				method="post" onsubmit="return insertSubmitCheck();">
				<div id="insertModalBody" class="modal-body">
					<div class="row">
						<div class="col-sm-6">
							<div class="mb-3">
								<label>Type</label> <select class="form-select form-control"
									name="typeId">
									<c:choose>
										<c:when test="${not empty codeTypeList }">
											<c:forEach items="${codeTypeList }" var="codeTypeList">
												<option value="${codeTypeList.typeId }">${codeTypeList.typeName }</option>>
						                		</c:forEach>
										</c:when>
									</c:choose>
								</select>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label>RegistDay</label> <input id="currentDate"
									class="form-control" type="date" name="registday"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="mb-3">
								<label>codeId (공백없이 영문만)</label> <input id="codeId"
									class="form-control" type="text" name="codeId"
									required="required">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label>codeName (공백없이 한글만)</label> <input id="codeName"
									class="form-control" type="text" name="codeName"
									required="required">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Save</button>
					<button type="button" class="btn" data-dismiss="modal"
						onclick="closeModal()">Cancel</button>
				</div>
			</form:form>
		</div>
	</div>
</div>

<!-- 수정 폼 -->
<div id="updateModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4>공통코드 수정</h4>
				<button type="button" class="btn" data-dismiss="modal"
					onclick="closeModal()">
					<span aria-hidden="true">&times;</span> <span class="sr-only">close</span>
				</button>
			</div>
			<form:form action="${cPath }/admin/code" modelAttribute="code"
				method="post" onsubmit="return updateSubmitCheck();">
				<input type="hidden" name="_method" value="PUT" />
				<div id="insertModalBody" class="modal-body">
					<div class="row">
						<div class="col-sm-4">
							<div class="mb-3">
								<label>Type</label> <input id="up_typeId" class="form-control"
									type="hidden" name="typeId" readonly="readonly"> <input
									id="up_typeName" class="form-control" type="text"
									name="typeName" readonly="readonly">
							</div>
						</div>
						<div class="col-sm-4">
							<div class="mb-3">
								<label>RegistDay</label> <input id="up_registday"
									class="form-control" type="date" name="registday"
									readonly="readonly">
							</div>
						</div>
						<div class="col-sm-4">
							<div class="mb-3">
								<label>UpdateDay</label> <input id="up_currentDate"
									class="form-control" type="date" name="updateday"
									readonly="readonly">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="mb-3">
								<label>codeId</label> <input id="up_codeId" class="form-control"
									type="text" name="codeId" readonly="readonly">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="mb-3">
								<label>codeName (공백없이 한글만)</label> <input id="up_codeName"
									class="form-control" type="text" name="codeName"
									required="required">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Save</button>
					<button type="button" class="btn" data-dismiss="modal"
						onclick="closeModal()">Cancel</button>
				</div>
			</form:form>
		</div>
	</div>
</div>


<form id="searchForm" action="${cPath }/admin/code" method="get">
	<input type="hidden" name="page" /> 
	<input type="hidden" name="show" />
	<input type="hidden" name="searchTypeId" /> 
	<input type="hidden" name="searchCodeName" />
</form>
<form id="deleteForm" action="${cPath }/admin/code" method="post">
	<input type="hidden" name="_method" value="DELETE" /> <input
		type="hidden" name="codeId" /> <input type="hidden"
		name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<script>
	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
	document.getElementById('up_currentDate').value = new Date().toISOString().substring(0, 10);
	$("#op_${showNum }").attr("selected","selected");
	$('#searchTypeId').val("${searchTypeId }").prop("selected",true);
	$('#searchCodeName').val("${searchCodeName }");
	
	var en = /^[a-z|A-Z]+$/;
	var ko = /^[ㄱ-ㅎ가-힣]+$/;
	let searchForm = $("#searchForm");
	let deleteForm = $("#deleteForm");
	
	let pagingArea = $(".pagingArea").on("click", "a", function(event) {
		let page = $(this).data("page");
		let searchTypeId = $("#searchTypeId").val();
		let searchCodeName = $("#searchCodeName").val();
		let show = $("#show").val();
		searchForm.find("[name=page]").val(page);
		searchForm.find("[name=show]").val(show);
		searchForm.find("[name=searchTypeId]").val(searchTypeId);
		searchForm.find("[name=searchCodeName]").val(searchCodeName);
		searchForm.submit();
	});
	
	let searchUI = $("#searchUI").on("click", "#searchBtn", function(event) {
		searchForm.get(0).reset();
		
		let searchTypeId = $("#searchTypeId").val();
		let searchCodeName = $("#searchCodeName").val();
		let show = $("#show").val();
		searchForm.find("[name=searchTypeId]").val(searchTypeId);
		searchForm.find("[name=searchCodeName]").val(searchCodeName);
		searchForm.find("[name=show]").val(show);
		
		searchForm.submit();
	});
	
	<%-- 모달열기 --%>
	function insertModalOpen() {
		$('#insertModal').modal('show');
	}
	function updateModalOpen(e) {
		$("#up_codeId").val($(e).parent().parent().find('td:eq(1)').text());
		$("#up_codeName").val($(e).parent().parent().find('td:eq(2)').text());
		$("#up_registday").val($(e).parent().parent().find('td:eq(3)').text());
		$("#up_typeId").val($(e).parent().parent().find('td:eq(5)').find('input[name=typeId]').val());
		$("#up_typeName").val($(e).parent().parent().find('td:eq(5)').find('input[name=typeName]').val());
		
		$('#updateModal').modal('show');
	}
	
	<%-- 모달닫기 --%>
	function closeModal() {
		$('#insertModal').modal('hide');
		$('#updateModal').modal('hide');
	}
	
	<%-- 등록 전 체크 --%>
	function insertSubmitCheck() {
		let codeId = $("#codeId").val();
		let codeName = $("#codeName").val();
		
		if (!en.test(codeId)){
			warningAlert("codeId는 영문만 입력해주세요.");
			return false;
		}
		if (!ko.test(codeName)){
			warningAlert("codeName는 한글만 입력해주세요.");
			return false;
		}
		return true;
	}
	<%-- 수정 전 체크 --%>
	function updateSubmitCheck() {
		let codeId = $("#up_codeId").val();
		let codeName = $("#up_codeName").val();
		
		if (!en.test(codeId)){
			warningAlert("codeId는 영문만 입력해주세요.");
			return false;
		}
		if (!ko.test(codeName)){
			warningAlert("codeName는 한글만 입력해주세요.");
			return false;
		}
		return true;
	}
	<%-- 삭제 전 체크 --%>
	function deleteSubmitCheck(e) {
		deleteForm.find("[name=codeId]").val($(e).parent().parent().find('td:eq(1)').text());
		Swal.fire({
			title: '삭제하시겠습니까?',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '확인',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	deleteForm.submit();
	        }
	    })
	}

	//모달내용 초기화
	$('.modal').on('hidden.bs.modal', function (e) {
		$(this).find('form')[0].reset();
	})

</script>

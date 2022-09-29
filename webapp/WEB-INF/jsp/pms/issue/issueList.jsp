<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>  
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 1.      홍승조      컨트롤러 연결
* 2022. 8. 6.		홍승조	테이블 생성
* 2022. 8. 17.		김유진	테이블 작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<style>

table {
	margin-left: auto;
	margin-right: auto;
}

table, td, th {
	border-collapse: collapse;
/* 	border: 1px solid black; */
}
card {
	margin-left: 300px;
	margin-right: 300px;
}
regist {
	float: right;
}
#searchWord {
	border: 1px;
}
form-full input-lg {
	z-index:1000;
}
</style>

<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<h5>이슈 목록</h5>
					<div>
						<button style="float: right;" class="btn btn-primary" onclick="location='${cPath}/pms/${projId}/issue/form'">이슈 등록</button>
					</div>
					<br>
					<!-- 검색 -->
					<div id="searchUI" class="form-field">
						<div class="row">
							<div class="col-sm-2" style="padding: 0px;">
								<div class="mb-3">
									<form:select path="simpleCondition.searchType" class="form-select form-control">
										<form:option value="">전체</form:option>
										<form:option value="issueTitle" label="이슈제목" />
										<form:option value="issueState" label="이슈상태" />
										<form:option value="issueWriter" label="작성자" />
										<form:option value="issueWork" label="일감" />
									</form:select>
					            </div>
                  			</div>
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
					</div>
				</div>
				<!-- 리스트 -->
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">제목</th>
								<th scope="col">일감명</th>
								<th scope="col">작성자</th>
								<th scope="col">담당자</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="issueList" value="${pagingVO.dataList }" />
							<c:choose>
								<c:when test="${not empty issueList }">
									<c:forEach items="${issueList }" var="issue">
										<tr onClick="location.href='${cPath}/pms/${projId}/issue/${issue.issueId}'" style="cursor : pointer; ">
<%-- 										<a href="${cPath}/pms/${projId}/issue/${issue.issueId}"> --%>
											<td>${issue.rnum }</td>
											<td>${issue.issueTitle }</td>
											<td>${issue.workTitle }</td>
											<td>${issue.writerName }</td>
											<td>${issue.chargerName }</td>
											<td>${issue.issueStateName }</td>
<!-- 										</a> -->
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="6" style="text-align: center;"><b>이슈 없음</b></td>
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
										${pagingVO.pagingHTMLBS }
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/pms/${projId}/issue" method="get">
	<input type="hidden" name="page" />
	<form:input type="hidden" path="searchType" />
	<form:input type="hidden" path="searchWord" />
</form:form>


<script>
	function f_modalOpen() {
		mymodal.style.display = "block";
	}

	let searchForm = $("#searchForm");
	let pagingArea = $(".pagingArea").on("click", "a", function(event) {
		let page = $(this).data("page");
		searchForm.find("[name=page]").val(page);
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
</script>

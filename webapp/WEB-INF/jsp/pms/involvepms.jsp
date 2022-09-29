<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 9. 1.      홍승조      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<h4>회원이 등록한 것들이 나옴</h4>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<h5>일감 목록</h5>
				</div>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">NO</th>
								<th scope="col">유형</th>
								<th scope="col">우선순위</th>
								<th scope="col">상태</th>
								<th scope="col">제목</th>
								<th scope="col">진행도</th>
								<th scope="col">담당자</th>
								<th scope="col">시작일</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="workList" value="${work.dataList }" />
							<c:choose>
								<c:when test="${not empty workList }">
									<c:forEach items="${workList }" var="work">
										<tr>
											<td>${work.rnum }</td>
											<td>${work.workType }</td>
											<td>${work.workPrority }</td>
											<td>${work.workState }</td>
											<td><a
												href="${cPath }/pms/${work.workProj}/work/${work.workId}">${work.workTitle }</a>
											</td>
											<td>${work.workProgress }</td>
											<td>${work.memName }</td>
											<td>${work.workSdate }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8" style="text-align: center;"><b>일감 없음</b></td>
									</tr>

								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">no</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="reportList" value="${report.dataList }" />
							<c:choose>
								<c:when test="${not empty reportList }">
									<c:forEach items="${reportList }" var="report">
										<tr>
											<td>${report.rnum }</td>
											<td><a href="${cPath}/pms/${projId}/report/${report.reportId}">${report.reportTitle }</a></td>
											<td>${report.writerName }</td>
											<td>${report.reportDate }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="8" style="text-align: center;"><b>보고서 없음</b></td>
									</tr>

								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="card">
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
							<c:set var="issueList" value="${issues.dataList }" />
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
											<td>${issue.issueState }</td>
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
					</table>
				</div>
			</div>
			
			
		</div>
	</div>
</div>
<form id="worksearchForm" action="${cPath }/pms/${projId}/${memId}">
	<input type="hidden" name="workpage">
</form>
<form id="reportsearchForm" action="${cPath }/pms/${projId}/${memId}">
	<input type="hidden" name="reportpage">
</form>
<script>
let worksearchForm = $("#worksearchForm");
let wrokpagingArea = $(".workpagingArea").on("click", "a", function(event){
	let page = $(this).data("workpage");
	worksearchForm.find("[name=workpage]").val(page);
	worksearchForm.submit();
});
let reportsearchForm = $("#reportsearchForm");
let reportpagingArea = $(".reportpagingArea").on("click", "a", function(event){
	let page = $(this).data("reportpage");
	reportsearchForm.find("[name=reportpage]").val(page);
	reportsearchForm.submit();
});

</script>


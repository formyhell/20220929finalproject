<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 9. 1.       고혜인      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="col-sm-12">
	<div class="card">
		<div class="card-header">
			<h5>커뮤니티 게시판 신고 관리</h5>
		</div>
		<!-- 검색 -->
		<div id="searchUI" class="form-field m-l-40">
			<div class="row">
				<div class="col-sm-5">
				
					<div class="row">
						<button class="btn btn-outline-info btn-sm col m-10 resultBtn" value="Y" id="Y">처리전</button>
						<button class="btn btn-outline-info btn-sm col m-10 resultBtn" value="A" id="A">처리완료</button>
						<button class="btn btn-outline-info btn-sm col m-10 resultBtn" value="all" id="all">전체</button>
					</div>
				</div>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">신고자</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">신고수</th>
						<th scope="col">작성자</th>
						<th scope="col">삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:set value="${pagingVO.dataList }" var="cmntList" />
					<c:choose>
						<c:when test="${not empty cmntList}">
							<c:forEach items="${cmntList }" var="cmnt">
								<tr>
									<th scope="row">${cmnt.cmntNo }</th>
									<td>
										<button class="btn btn-primary btn-sm p-1 modalBtn" type="button" data-bs-toggle="modal" data-bs-target=".bd-example-modal-lg">확인</button>
									</td>
									<c:url value="/community/${cmnt.cmntNo }" var="cmntURL" />
									<td style="width: 800px;"><a href="${cmntURL }"><c:out value="${cmnt.cmntTitle }" /></a></td>
									<td>${cmnt.cmntReport }</td>
									<td>${cmnt.cmntWriter }</td>
									<td>${cmnt.cmntDate }</td>
									<td>
										<c:if test="${cmnt.cmntState eq 'Y' }">
											<form:form action="${cPath }/admin/communityRepList/${cmnt.cmntNo }" method="post" modelAttribute="cmnt">
												<input type="hidden" name="_method" value="delete" />
												<input type="submit" value="삭제" data-href="${cPath }/admin/communityRepList/${cmnt.cmntNo }" class="btn btn-light btn-sm p-1 modalBtn" />
												<form:input type="hidden" path="cmntNo" value="${cmnt.cmntNo }" />
											</form:form>
										</c:if>
										<c:if test="${cmnt.cmntState eq 'A' }">
											<form:form action="${cPath }/admin/communityRepList/${cmnt.cmntNo }" method="post" modelAttribute="cmnt">
												<input type="hidden" name="_method" value="put" />
												<input type="submit" value="되돌리기" data-href="${cPath }/admin/communityRepList/${cmnt.cmntNo }" class="btn btn-danger btn-sm p-1 modalBtn" />
												<form:input type="hidden" path="cmntNo" value="${cmnt.cmntNo }" />
											</form:form>
										</c:if>
										<c:if test="${cmnt.cmntState eq 'N' }">
											<span>본인삭제</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4">신고된 글이 없습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>

				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							<div class="pagingArea pagination justify-content-center pagination-primary">
								${pagingVO.pagingHTMLBS }</div>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</div>

<div class="modal fade bd-example-modal-lg" id="trepModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myLargeModalLabel">신고 회원 목록</h4>
				<button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">신고번호</th>
							<th scope="col">신고사유</th>
							<th scope="col">신고자</th>
							<th scope="col">신고일</th>
						</tr>
					</thead>
					<tbody id="modal-table-body">
						<tr>
							<th scope="col">신고번호</th>
							<td id="reason">신고사유</td>
							<td id="reporter">신고자</td>
							<td id="date">신고일</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="5">
								<div class="trepPagingArea pagination justify-content-center pagination-primary"></div>
							</th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>

<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/admin/communityRepList" method="get">
	<input type="hidden" name="page" />
	<form:input type="hidden" path="searchType" value="cmntState" />
	<form:input type="hidden" path="searchWord" />
</form:form>


<script>

let search = this.location.search.slice(-1);
let message = "${message}";




if(search == 'Y'){ //현재 클릭한 버튼의 css만 바꿔줌
	document.getElementById('Y').classList.replace('btn-outline-info', 'btn-info');
} else if(search == 'A'){
	document.getElementById('A').classList.replace('btn-outline-info', 'btn-info');
} else {
	document.getElementById('all').classList.replace('btn-outline-info', 'btn-info');
}

let cmntNo = "${cmntNo}";
let url = "${cPath}/admin/communityRepList/";
var currentPage = 1;
var rstURL = ""; 
let trepPagingArea = $(".trepPagingArea");
let modalBody = $("#modal-table-body");

$(document).on("click", ".modalBtn", function() { //글번호 확인용
	var cmntNo = $(this).parent().parent().children().get(0).innerHTML;
	var urlNo = cmntNo + "/member";
	rstURL = url+urlNo;
	getTrepMem(1);
});

//신고 회원 페이징
$(".trepPagingArea").on("click", "a", function(event) {
	currentPage = $(this).data("page");
	getTrepMem(currentPage);
	
});
	function getTrepMem(page) {
// 	console.log("페이징 확인 : ", rstURL);
		$.ajax({
			type:"get"
			, url : rstURL + "?page=" + page
	// 		, data:JSON.stringify(inputData)
			, dataType:'json'
			, contentType : "application/json;charset=utf-8"
			, success: function(result) {
				modalBody.children().remove();
				trepPagingArea.children().remove();

				
				console.log("페이징",result.pagingVO);
				console.log(result);
				
				
				$.each(result.trepList, function(i, v) {
					modalBody.append(
						$("<tr>").append(
							$("<th>").attr("scope","col").text(v.trepNo)		
							, $("<td>").html(v.trepReason)		
							, $("<td>").html(v.trepReporter)		
							, $("<td>").text(v.trepDate)											
						)									
					)
				});		
				
				trepPagingArea.append(result.pagingVO.pagingHTMLBS);
				
				
			}
			, error:function(request, status, err){
				console.log("조회 실패");
				console.log(request);
				console.log(status);
				console.log(err);				
			}
		});
		
	}


	let searchForm = $("#searchForm");
	let pagingArea = $(".pagingArea").on("click", "a", function(event){
		let page = $(this).data("page");
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
	});
	
	let searchUI = $("#searchUI").on("click", ".resultBtn", function(event){
		searchForm.get(0).reset();
		let name = "searchWord";
		let value = $(this).val();
		if(value == 'all'){
			searchForm.find("[name="+name+"]").val('');
		} else {
			searchForm.find("[name="+name+"]").val(value);
		}
		searchForm.submit();
	});




</script>
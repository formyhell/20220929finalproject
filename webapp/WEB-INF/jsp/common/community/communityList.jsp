<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      홍승조      컨트롤러 연결
* 2022. 8. 27.     고혜인      내용 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<script src="${cPath}/resources/js/jquery-3.6.0.min.js "></script>
<link rel="stylesheet" href="${cPath }/resources/css/paging/listPaging.css">

<div id="services-section" class="pt-xs-60" style="padding-top: 5vh">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="block-title v-line mb-45">
					<h2>Community</h2>
					<p class="italic">자유게시판</p>
				</div>
				<div>
					<div class="card-header">
						<!-- 					<h5>QNA</h5> -->
						<div>
							<button class="btn-greenlight float-right" id="insertCmnt">등록하기</button>
						</div>


						<div id="searchUI" class="form-field">
							<form:select path="simpleCondition.searchType" class="selectbox">
								<form:option value="">전체</form:option>
								<form:option value="cmntTitle" label="제목" />
								<form:option value="cmntContent" label="내용" />
								<form:option value="cmntWriter" label="작성자" />
							</form:select>
							<form:input style="border: 1px solid #DEDEDE;"
								placeholder="Search Here" path="simpleCondition.searchWord" />
							<input type="button" id="searchBtn" class="btn-greenlight"
								value="검색">

						</div>
					</div>
					<!-- 리스트 -->
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th scope="col" >#</th>
									<th scope="col" style="width: 950px;">제목</th>
									<th scope="col" style="width: 90px;">작성자</th>
									<th scope="col" style="width: 80px;">작성일</th>
									<th scope="col" style="width: 70px;">조회수</th>
									<!-- 								<th scope="col">추천수</th> -->
								</tr>
							</thead>
							<tbody>
								<c:set value="${pagingVO.dataList }" var="cmntList" />
								<c:choose>
									<c:when test="${not empty cmntList}">
										<c:forEach items="${cmntList }" var="cmnt">
											<tr>
												<th>${cmnt.cmntNo }</th>
												<c:url value="/community/${cmnt.cmntNo }" var="cmntURL" />
												<td><a href="${cmntURL }"><c:out
															value="${cmnt.cmntTitle }" /></a></td>
												<td><c:out value="${cmnt.cmntWriter }" /></td>
												<td><c:out value="${cmnt.cmntDate }" /></td>
												<td><c:out value="${cmnt.cmntHit }" /></td>
												<%-- 											<td><c:out value="${cmnt.cmntRec }" /></td> --%>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">게시글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
							<!-- 페이징 -->
							<tfoot>
								<tr>
									<td colspan="6">
										<div
											class="pagingArea pagination-nav text-left mt-60 mtb-xs-30">
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


	<form:form id="searchForm" modelAttribute="simpleCondition"
		action="${cPath }/community" method="get">
		<input type="hidden" name="page" />
		<form:input type="hidden" path="searchType" />
		<form:input type="hidden" path="searchWord" />

	</form:form>
<script>

$("#insertCmnt").on("click", function() {
	console.log("클릭");
	
	<security:authorize access="isAnonymous()"> 
		location='${cPath}/login'; //비회원은 로그인 창으로
	</security:authorize>
	
	<security:authorize access="isAuthenticated()"> //회원은 커뮤니티작성
		location='${cPath }/community/form'; 
	</security:authorize>	
});
</script>
<script src="${cPath }/resources/js/board/boardList.js"></script>
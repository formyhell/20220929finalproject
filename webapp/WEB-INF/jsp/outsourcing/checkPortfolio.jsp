<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 9. 2.       고혜인      지원자 포트폴리오 확인 내용 작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="${cPath }/resources/assetsPms/js/jquery-3.5.1.min.js"></script>
<link href="${cPath }/resources/css/pre/preStyle.css" rel="stylesheet">

<div class="container">
	<div class="row">
		<div class="col-sm-12 padding-20">
			<div>
	<button onclick="history.back()" class="btn-greenlight float-right">이전페이지 이동</button>
				<div class="table-responsive">
					<h3>${memId }님의 포트폴리오</h3>
					<c:choose>
						<c:when test="${not empty pfList}">
							<div class="text-box mt-40">
								<c:forEach items="${pfList }" var="pf">
									<div class="panel panel-default padding-20">
										<div class="box-title mb-20">
											<h3>${pf.pfTitle }</h3>
										</div>
										<div class="text-content">
											<p>
												진행기간 : <strong>${pf.pfSdate } ~ ${pf.pfFdate }</strong>
												<c:if test="${not empty pf.pfClient }">
												 	| <span>고객사</span> : <strong>${pf.pfClient }</strong>
												</c:if>
												<c:if test="${not empty pf.pfResulturl }">
												 	| <a href="${pf.pfResulturl }" target="_blank"><strong><i class="fa fa-external-link"></i> 결과물 링크</strong></a>
												</c:if>
											</p>
											<pre class="gray-bg">${pf.pfContent }</pre>
										</div>

									</div>

								</c:forEach>
							</div>
								<div class="pagingArea pagination-nav text-left mt-60 mtb-xs-30">${pagingVO.pagingHTMLBS }</div>
						</c:when>

						<c:otherwise>
							포트폴리오 없음
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</div>

<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/outsourcing/apply/portfolio/${memId}" method="get">
	<input type="hidden" name="page" />

</form:form>
<script src="${cPath }/resources/js/board/boardList.js"></script>
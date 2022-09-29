<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${cPath }/resources/assetsPms/css/icofont.css">
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      홍승조      컨트롤러 연결
* 2022. 9. 1.      고혜인      내용추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<!-- Intro Section -->
<link href="${cPath }/resources/css/pre/preStyle.css" rel="stylesheet">
<div id="services-section" class="pt-xs-60" style="padding-top: 5vh">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="block-title v-line mb-45">
					<h2>Notice</h2>
					<p class="italic">공지사항</p>
				</div>

				<div class="col-sm-12 blog-post-hr post-section">
					<div class="blog-post mb-30">
						<div class="post-meta ">

							<span>by <c:out value="${notice.notAdmin }" />,
							</span> <span><c:out value="${notice.notDate }" /></span> 
							<span><i class="icofont icofont-eye-alt"></i> <c:out value="${notice.notHit }" /> </span>


							<div class="post-header" style="color: black;">
								<h2>${notice.notTitle }</h2>
							</div>
							<div class="post-entry padding-20" style="color: black;">
								
								<div style="min-height: 300px">
									<pre>${notice.notContent }</pre>
								</div>
								

								<hr>
								<div>
									<c:if test="${not empty notice.attatchList}">
										<span style="color: gray;">첨부파일</span>
										<c:forEach items="${notice.attatchList}" var="att"
											varStatus="vs">
										| <a href="${cPath }/notice/${notice.notNo}/att/${att.attId}">
												${att.attFilename }</a>

										</c:forEach>
									</c:if>
								</div>
							</div>
							<div>
								<c:if test="${not empty notice.parent}">
									<span>관련공지 | </span>
									<a href="${cPath }/notice/${notice.notParentno}">${notice.parent.notTitle }</a>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

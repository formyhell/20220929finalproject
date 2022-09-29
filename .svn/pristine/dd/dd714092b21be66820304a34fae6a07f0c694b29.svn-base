<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.     고혜인      컨트롤러 연결
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>   


<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<div class="blog-single">
				<div class="blog-box blog-details">

					<div class="card">
						<div class="card-body">
							<div class="blog-details">

								<security:authentication property="principal" var="authMember" />

								<c:if test="${pf.pfMem eq authMember.realMember.memId}">
								<div class="f-right">
									<button class="btn btn-primary btn-sm m-b-10" type="button" onclick="location='${cPath}/gen/myinfo/portfolio/${pf.pfId }/form'">수정</button>
									<form:form action="${cPath }/gen/myinfo/portfolio/${pf.pfId }" method="post" modelAttribute="pf" style="display:inline;">
										<security:csrfInput/>
										<input type="hidden" name="_method" value="delete" />
										<input type="submit" value="삭제" data-href="${cPath }}/gen/myinfo/portfolio/${pf.pfId }" class="btn btn-light btn-sm m-b-10">
										<form:input path="pfId" type="hidden" value="${pf.pfId }" />
									</form:form>
								</div>
								</c:if>
								
								<h4> ${pf.pfTitle}</h4>
								<ul class="blog-social p-10">
									<li class="m-l-1"><span><i class="icofont icofont-tasks-alt"></i>참여기간 | </span> ${pf.pfSdate} <span>~</span> ${pf.pfFdate}</li>
									<c:if test="${not empty pf.pfClient}">
										<li class="m-l-1"><span><i class="icofont icofont-people"></i>고객사 | </span>${pf.pfClient }</li>
									</c:if>
									<c:if test="${not empty pf.pfResulturl}">
										<li class="m-l-1"><i class="icofont icofont-external-link"></i><a href="${pf.pfResulturl }" target="_blank">결과물 링크 이동</a></li>
									</c:if>
									<p>
										<c:if test="${not empty pf.attatchList}"> 첨부파일  
											<c:forEach items="${pf.attatchList}" var="att" varStatus="vs">
	 											| <a href="${cPath }/gen/myinfo/portfolio/${pf.pfId}/att/${att.attId}"><span class="m-10">${att.attFilename }</span></a>
											</c:forEach>
										</c:if>
									</p>	
								</ul>
								
								<ul class="blog-social primary-color">
									<c:forEach items="${pf.objCodeList}" var="obj">						
										<li class="font-light badge badge-primary m-5 p-1">${obj.objCode}</li>
									</c:forEach>
								</ul>
								
								<ul class="blog-social">
									<c:forEach items="${pf.skillCodeList}" var="skill">									
										<li class="font-light badge badge-dark m-5 p-1">${skill.skillCode}</li>
									</c:forEach>
								</ul>

								<div class="single-blog-content-top m-10">
									<p>${pf.pfContent}</p>
								</div>
							</div>
						</div>
					</div>

					</div>
				</div>
			</div>
				
				</div>
			</div>
		</div>
	</div>
</div>
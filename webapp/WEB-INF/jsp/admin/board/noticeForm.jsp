<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      홍승조      컨트롤러 연결
* 2022. 9. 1.      고혜인      내용 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>


<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<div class="card" id="cardBody">
				<div class="card-header">
					<h5>공지 등록</h5>
				</div>
				<form:form modelAttribute="notice" method="post" action="${cPath }/admin/noticeList" enctype="multipart/form-data">
				<security:authentication property="principal" var="authMember" />
				<form:input path="notAdmin" type="hidden" value="${authMember.realMember.memId }"/>
				<div class="card-body">
					<div class="form theme-form">
						<div class="mb-3 row">
							<label class="col-sm-3 col-form-label">제목</label>
							<div class="col-sm-9">
								<form:input path="notTitle" class="form-control" required="required"/>
								<form:errors path="notTitle" element="span" cssClass="error"></form:errors>
							</div>
						</div>
						<div class="mb-3 row">
							<label class="col-sm-3 col-form-label">게시일</label>
							<div class="col-sm-9">
								<form:input path="notSdate" class="form-control digits" type="date" required="required"/>
								<form:errors path="notSdate" element="span" cssClass="error"></form:errors>
							</div>
						</div>
						<div class="mb-3 row">
							<label class="col-sm-3 col-form-label">종료일</label>
							<div class="col-sm-9 i-block">
								<form:input path="notFdate" class="form-control digits" type="date" required="required"/>
								<form:errors path="notFdate" element="span" cssClass="error"></form:errors>
							</div>
						</div>
						<div class="mb-3 row">
							<label class="col-sm-3 col-form-label">상위 공지</label>
							<div class="col-sm-9">
								<c:if test="${not empty noticeList }">
									<input list="notParentnoList" class="form-control" name="notParentno"/>
									<datalist id="notParentnoList">
									<c:forEach items="${noticeList}" var="parentList">
										<option value="${parentList.notNo }" label="${parentList.notTitle }">
									</c:forEach>
									</datalist>
								</c:if>
								<c:if test="${empty noticeList}">등록된 공지가 없습니다.</c:if>
							</div>
						</div>
						<div class="col-sm">
							<div class="mb-3 row">
								<label class="col-sm-3 col-form-label">첨부파일</label>
								<div class="col-sm-9">
									<form:input path="notFiles" multiple="true" type="file"/>
								</div>
							</div>
						</div>
						<div class="mb-3 row">
							<label class="col-sm-3 col-form-label">내용</label>
							<div class="col-sm-9">
								<form:textarea path="notContent" class="form-control" rows="15" cols="5" required="required"/>
								<form:errors path="notContent" element="span" cssClass="error"></form:errors>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="text-end">
									<input type="submit" class="btn btn-primary" value="저장">
									<input type="reset" class="btn btn-light" value="취소">
								</div>
							</div>
						</div>
					</div>
				</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 30.      신창규           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js"
	type="text/javascript"></script>

<form:form modelAttribute="genLoc" method="post" action="${cPath }/gen/myinfo/loc">
	<security:csrfInput />
	
	<div class="card">
		<div class="card-header pb-0">
		<h5>선호지역 추가</h5>
		<span>선호지역을 선택한후 저장버튼을 누루시오(중복 체크 가능)</span>
		</div>
		<div class="card-body">
			<c:forEach items="${locList}" var="loc">
				<form:checkbox path="genLoc" id="${loc.codeId }" value="${loc.codeId }" class="checkbox_animated"/>
				<label for="${loc.codeId }">${loc.codeName } &nbsp;</label>
				<form:errors path="genLoc" element="span" cssClass="error" />
			</c:forEach>
		</div>
		<div class="card-footer">
			<input type="reset" value="취소" class="btn btn-warning" style="float: right;"/>
			<input type="submit" value="저장" class="btn btn-primary" style="float: right;"/>
			<security:authentication property="principal" var="authMember" />
			<form:input type="hidden" path="genId" value="${authMember.realMember.memId }" />
		</div>
	</div>
</form:form>
	
	
	

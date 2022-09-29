<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 18.      신창규           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<security:authorize access="isAuthenticated()">
			<!-- 조건문 // 인증객체가 있을 때 -->
			<security:authentication property="principal" var="authMember" />
			<!-- authentication 객체(인증) -->
			<form:form id="logoutForm" method="post" action="${cPath}/logout"></form:form>
		</security:authorize>
	</div>
	<script>
		
	</script>

</body>
</html>
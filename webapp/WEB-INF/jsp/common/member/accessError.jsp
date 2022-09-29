<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 25.      작성자           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>      

	<h1>Access Denied Page</h1>
	<h2>권한이 없는 페이지 입니다.</h2>
	<h2>
		<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage() }" />
	</h2>
	<h2>
		<c:out value="${msg}" />
	</h2>
	<div>
		<button onclick="history.back()" style="padding-left: 300px; color: red;">이전 페이지 이동</button>
	</div>

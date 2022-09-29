<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 25.      신창규           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<style>
	input[type="checkbox"]{
	appearance : checkbox;
		width: 20px;
	    height: 20px;
	    display: inline-block;
	    border: 1px solid #1fcab8;
	    top: 4px;
	    position: relative;
	    margin-right: 10px;
	}
	.table-category td{
		padding-left: 20px;
	}
</style>

  
  <form:form modelAttribute="genSkill" method="post" action="${cPath }/gen/myinfo">
  <security:csrfInput/>
  
  	<div class="card">
		<div class="card-header pb-0">
		<h5>직무분야 보유기술 추가</h5>
		<span>선택후 저장버튼을 클릭하세요(중복 체크 가능)</span>
		</div>
		<div class="card-body">
		<span>직무분야<br></span>
			<c:forEach items="${outObjList}" var="obj">
	                                <form:checkbox path="genObj" id="${obj.codeId }" value="${obj.codeId }"/>
	                                <label for="${obj.codeId }">${obj.codeName }</label>
	                                <form:errors path="genObj" element="span" cssClass="error"/>
                </c:forEach>
		</div>
		<div class="card-body">
		<span>보유기술<br></span>
			 <c:forEach items="${outSkillList}" var="skill">
                                <form:checkbox path="genSkill" id="${skill.codeId }" value="${skill.codeId }"/>
                                <label for="${skill.codeId }">${skill.codeName }</label>
                                <form:errors path="genSkill" element="span" cssClass="error"/>
                 </c:forEach>
		</div>
  
  
  
  
<!--    <div> -->
<!--   	<table class="table table-category">     -->
<!--   		<tr> -->
<!-- 			<th class="gray-bg">직무분야</th> -->
<!-- 			<td> -->
<%-- 				<c:forEach items="${outObjList}" var="obj"> --%>
<%-- 	                                <form:checkbox path="genObj" id="${obj.codeId }" value="${obj.codeId }"/> --%>
<%-- 	                                <label for="${obj.codeId }">${obj.codeName }</label> --%>
<%-- 	                                <form:errors path="genObj" element="span" cssClass="error"/> --%>
<%--                 </c:forEach> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
  	
<!--   		<tr> -->
<!-- 			<th class="gray-bg">필요기술</th> -->
<!-- 			<td> -->
<%-- 				 <c:forEach items="${outSkillList}" var="skill"> --%>
<%--                                 <form:checkbox path="genSkill" id="${skill.codeId }" value="${skill.codeId }"/> --%>
<%--                                 <label for="${skill.codeId }">${skill.codeName }</label> --%>
<%--                                 <form:errors path="genSkill" element="span" cssClass="error"/> --%>
<%--                  </c:forEach> --%>
<!-- 			</td> -->
<!-- 		</tr> -->
<!--    	</table>    -->
<!--  </div>  -->
  
  
  
	</div>
<input type="reset" value="취소" class="btn btn-warning" style="float: right;"/>
<input type="submit" value="저장" class="btn btn-primary" style="float: right;"/>
<security:authentication property="principal" var="authMember" />
<form:input type="hidden" path="genId" value="${authMember.realMember.memId }" />
</form:form>

<script>

</script>
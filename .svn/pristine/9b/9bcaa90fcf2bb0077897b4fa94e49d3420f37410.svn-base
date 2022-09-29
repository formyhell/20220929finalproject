<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 9. 1.      신창규           최초작성
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

    <form:form modelAttribute="projSkill" method="post" action="${cPath }/outsourcing/skill">
  <security:csrfInput/>
  <form:input path="projId" type="hidden" value="${projId }"/>
  <div>
  	<table class="table table-category">    
  		<tr>
			<th class="gray-bg">직무분야</th>
			<td>
				<c:forEach items="${outObjList}" var="obj">
					<input type="checkbox" name="projObj" id="${obj.codeId }" value="${obj.codeId }" class="skill"/>
	                <label for="${obj.codeId }">${obj.codeName }</label>
				</c:forEach>
			</td>
		</tr>
  	
  		<tr>
			<th class="gray-bg">필요기술</th>
			<td>
				<c:forEach items="${outSkillList}" var="skill">
								<form:checkbox path="projSkill" id="${skill.codeId }" value="${skill.codeId }"/>
                                <label for="${skill.codeId }">${skill.codeName }</label>
                                <form:errors path="projSkill" element="span" cssClass="error"/>
<%-- 					<input type="checkbox" name="projSkill" id="${skill.codeId }" value="${skill.codeId }" class="skill"/> --%>
<%-- 	                <label for="${skill.codeId }">${skill.codeName }</label> --%>
				</c:forEach>
			</td>
		</tr>
  	



<!--                 <label for="title">필요 기술 </label> -->
<!--             <div  style="display:inline;"> -->
<%--                           <c:forEach items="${outSkillList}" var="skill"> --%>
<%--                                 <form:checkbox path="projSkill" id="${skill.codeId }" value="${skill.codeId }"/> --%>
<%--                                 <label for="${skill.codeId }">${skill.codeName }</label> --%>
<%--                                 <form:errors path="projSkill" element="span" cssClass="error"/> --%>
<%--                           </c:forEach> --%>
<!--             </div> -->
<!--             </div> -->
   	</table>         
            
            
          
</div>
<input type="submit" value="저장" class="btn btn-primary"/>
<input type="reset" value="취소" class="btn btn-warning"/>
<%-- <security:authentication property="principal" var="authMember" /> --%>
<%-- <form:input type="text" path="comId" value="${authMember.realMember.comId }" /> --%>
</form:form>
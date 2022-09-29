<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 26.      홍승조      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <style>
 #textArea{
	height: 230px !important;
}
.button-end{
	float: right;
}
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
 </style>
<div class="container">
            <div class="row">
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header">
                  	<h5>아웃소싱 프로젝트 지원 <input type="checkbox" name="checkbox" id="checkbox" onchange="check1(this)"></h5>
                  </div>
					<form:form modelAttribute="applyProj" method="post" action="${cPath }/outsourcing/apply/support">
					 <table class="table">
					 	<tr>
					 		<th>지원 프로젝트</th>
					 		<td>
					 			${projName }
								<security:authentication property="principal" var="authMember" />
								<input type="hidden" name="applyApplicant" value="${authMember.realMember.memId }" />
								<form:errors path="applyApplicant" element="span" cssClass="error"/>
								<input type="hidden" name="applyProj" value="${projId }"/>
					 		</td>
					 	</tr>
						<tr>
							<th>지원 내용</th>
							<td>
								<form:textarea path="applyContent" class="form-control" id="textArea"/>
								<form:errors path="applyContent" element="span" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<th>직무분야</th>
							<td>
								<form:select path="applyObj" >
									<option>직무분야</option>
										<c:if test="${not empty applyProj.outObjList}">
											<c:forEach items="${applyProj.outObjList }" var="outObj">
												<form:option value="${outObj.codeId }">${outObj.codeName }</form:option>
											</c:forEach>
										</c:if>
								</form:select>
								<form:errors path="applyObj" element="span" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-end">
								<div class="button-end">
								<input type="submit" value="저장" class="btn btn-primary"/>
								<input type="reset" value="취소" class="btn btn-warning"/>
								</div>
							</td>
						</tr>
					</table>
					</form:form>
				 </div>
              </div>
           	</div>
</div>

<script>
function check1(f){
    if (f.checked) {
      $('#textArea').val('PHOS와 함께하고 싶습니다!!!!');
      $('#applyObj').val('BACKEND');
      }
    }
</script>
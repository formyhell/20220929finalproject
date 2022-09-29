<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      홍승조      컨트롤러 연결
* 2022. 8. 4.		홍승조	입력폼 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <style>
.center{
	text-align: center;
	width: 469px;
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
              <div class="col-sm-12" style="height: 650px;">
                  <br><br><br><br>
                <div class="card">
                  <div class="card-header" style="padding: 10px;">
                  	<h5>PMS 프로젝트 등록<input type="checkbox" name="checkbox" id="checkbox" onchange="check1(this)"></h5>
					
                  </div>
					<form:form modelAttribute="PMSProject" method="post" action="${cPath }/pmsProject">
					 <table class="table">
						<tr>
							<th class="center">프로젝트_이름</th>
							<td>
								<form:input path="projName" class="form-control" />
								<form:errors path="projName" element="span" cssClass="error"/>
								<security:authentication property="principal" var="authMember" />
								<input type="hidden" name="projArchi" value="${authMember.realMember.memId }" />
								<form:errors path="projArchi" element="span" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<th class="center">프로젝트_시작일</th>
							<td>
								<form:input type="date" class="form-control" path="projSdate" />
								<form:errors path="projSdate" element="span" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<th class="center">프로젝트_비밀번호</th>
							<td>
								<input type="password" name="projPass" class="form-control" id="projPass" />
								<form:errors path="projPass" element="span" cssClass="error"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input class="btn btn-warning" type="reset" value="취소" style="float: right; border: none;" />
								<input class="btn btn-primary" type="submit" value="저장" style="float: right; border: none;" />
							</td>
						</tr>
					</table>
					</form:form>
				 </div>
              </div>
           	</div>
</div>

    <!-- 자동생성 -->
  <script>
    function check1(f){
      if (f.checked) {
        $('#projName').val('PHOS와 함께하는 프로젝트!');
		$('#projSdate').val('2022-09-20');
		$('#projPass').val('java123!');
		
      } else{
      $('#projName').val('');
        }
      }
    </script>
    
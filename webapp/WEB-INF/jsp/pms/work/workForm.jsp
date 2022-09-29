<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 1.      홍승조      컨트롤러 연결
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <style>
 .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}
.filebox input[type="file"] { 
     position: absolute; 
     width: 0; 
     height: 0; 
     padding: 0; 
     overflow: hidden; 
     border: 0; 
} 
select{
	width:100%;
	height:35px;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
}

 </style>
 <div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<div class="card" id="cardBody">
				<div class="card-header">
					<h5>새로운 일감<input type="checkbox" name="checkbox" id="checkbox" onchange="check1(this)"></h5>
				</div>
				<form:form modelAttribute="work" method="post" action="${cPath }/pms/${projId }/work" enctype="multipart/form-data">
					<div class="card-body">
						<div class="form theme-form">
							<div class="row">
								<security:authentication property="principal" var="authMember" />
								<input type="hidden" name="workRegist" value="${authMember.realMember.memId }" />
								<input type="hidden" name="workProj" value="${projId }">
								<c:set var="today" value="<%=new java.util.Date()%>" />
								<!-- 현재날짜 -->
								<c:set var="date">
								<fmt:formatDate value="${today}" pattern="yyyy-MM-dd hh:mm" /></c:set> 
								<input type="hidden" name="workDate" value="${date }">
								
								<div class="col-sm-6">
									<div class="mb-3">
										<label>유형 </label> 
										<br>
										<select name="workType">
											<option value="FUN">기능</option>
											<option	value="DOC">서류</option>
											<option value="SUP">지원</option>
										</select>
										<form:errors path="workType" element="span" cssClass="error"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="mb-3">
										<label>제목</label>
										<form:input path="workTitle" class="form-control" />
										<form:errors path="workTitle" element="span" cssClass="error"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="mb-3">
										<label>내용</label>
										<form:textarea class="form-control" path="workContent"/>
										<form:errors path="workContent" element="span" cssClass="error"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="mb-3">
										<label>상태</label>
										<br>
										<select name="workState">
											<option value="NEW">신규</option>
										</select>
										<form:errors path="workState" element="span" cssClass="error"/>
									</div>
								</div>
								<div class="col">
									<div class="mb-3">
										<label>진행도</label>
										<br>
										<select name="workProgress">
											<option value="10">0</option>
											<option value="10">10</option>
											<option value="20">20</option>
											<option value="30">30</option>
											<option value="40">40</option>
											<option value="50">50</option>
											<option value="60">60</option>
											<option value="70">70</option>
											<option value="80">80</option>
											<option value="90">90</option>
											<option value="100">100</option>
										</select>
										<form:errors path="workProgress" element="span" cssClass="error"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="mb-3">
										<label>시작일</label>
										<form:input type="date" path="workSdate" class="form-control"/>
										<form:errors path="workSdate" element="span" cssClass="error"/>
									</div>
								</div>
								<div class="col">
									<div class="mb-3">
										<label>종료일</label>
										<form:input type="date" class="form-control" path="workFdate" />
										<form:errors path="workFdate" element="span" cssClass="error"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="mb-3">
										<label>우선순위</label>
										<br>
										<select name="workPrority">
											<option value="IMME">즉시</option>
											<option value="EMER">긴급</option>
											<option value="HIGH">높음</option>
											<option value="NOR">보통</option>
											<option value="LOW">낮음</option>
										</select>
										<form:errors path="workPrority" element="span" cssClass="error"/>
									</div>
								</div>
								<div class="col">
									<div class="mb-3">
										<label>상위일감</label>
										<input list="workParentList" class="form-control" name="workParent" />
											<c:if test="${not empty workList }">
													<datalist id="workParentList">
												<c:forEach items="${workList }" var="parentWork">
														<option value="${parentWork.workId }" label="${parentWork.workTitle }">
												</c:forEach>
													</datalist>
											</c:if>
										<form:errors path="workParent" element="span" cssClass="error"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="mb-3">
										<label>담당자</label>
										<br>
										<select name="workCharger">
											<c:forEach items="${projInvolve }" var="projInvolve">
												<option ${projInvolve.projId }>${projInvolve.involveMem }</option>
											</c:forEach>
										</select>
										<form:errors path="workCharger" element="span" cssClass="error"/>
									</div>
								</div>
								<div class="col">
									<div class="mb-3">
										<label>관리자</label>
										<br>
										<select name="workManager">
											<c:forEach items="${projInvolve }" var="projInvolve">
												<option ${projInvolve.projId }>${projInvolve.involveMem }</option>
											</c:forEach>
										</select>
										<form:errors path="workManager" element="span" cssClass="error"/>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm">
									<div class="mb-3">
										<label>첨부파일</label>
										<div class="filebox">
										    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
										    <label for="file" class="btn btn-outline-primary ms-2"><i data-feather="upload"></i>Upload</label> 
											<form:input type="file" id="file" path="workFiles" multiple="true"/>
											<form:errors path="workFiles" element="span" cssClass="error"/>
										</div>
									</div>
								</div>
							</div>
							
							
							<div class="row">
								<div class="col">
									<div class="text-end">
										<input type="submit" class="btn btn-primary" value="저장">
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
 
 
 
 
 


<script>

CKEDITOR.replace('workContent', {
	filebrowserImageUploadUrl : "${cPath}/file/image?command=imageUpload&${_csrf.parameterName}=${_csrf.token}",
});

CKEDITOR.editorConfig = function(config) {
	config.entities_latin = false;
	config.entities_greek = false;
	config.entities = false;
	config.basicEntities = false;
};

</script>
<script>
function check1(f){
    if (f.checked) {
      $('#workTitle').val('새로운 일감');
      CKEDITOR.instances.workContent.setData('<p>새로운 일감 내용입니다</p>')
      $('#workSdate').val('2022-09-20');
      $('#workFdate').val('2022-09-28');
      }
    }
</script>

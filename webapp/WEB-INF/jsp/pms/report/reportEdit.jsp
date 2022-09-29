<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  
<script src="http://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 1.      홍승조      컨트롤러 연결
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<style>
<%-- 첨부파일 --%>
.filebox .upload-name {
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
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<div class="card" id="cardBody">
				<div class="card-header">
					<span id="top"><span>BY ${report.reportWriter }, </span> <span id="reportDate">${report.reportDate }</span></span>
					<h5>${report.reportTitle } 수정</h5>
				</div>
				<sec:authentication property="principal" var="authMember" /> 
				<form:form action="${cPath }/pms/${report.reportProj }/report/${report.reportId }" modelAttribute="report" method="post" enctype="multipart/form-data">
					<div class="card-body">
						<div class="form theme-form">
							<div class="row">
								<form:input path="reportWriter" value="${authMember.realMember.memId }" type="hidden" />
								<form:input path="reportProj" value="${projId }" type="hidden" />
								<div class="col-sm-6">
									<div class="mb-3">
										<label>제목</label> 
										<form:input path="reportTitle" value="${report.reportTitle }" class="form-control" />
										<form:errors path="reportTitle" element="span" cssClass="error"></form:errors>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div class="mb-3">
										<label>이슈 내용</label>
										<form:textarea path="reportContent" class="form-control" id="exampleFormControlTextarea4" rows="3"/>
										<form:errors path="reportContent" element="span" cssClass="error"></form:errors>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm">
									<div class="mb-3">
										<label>첨부파일</label>
										<div class="yu_div_css">
											    <c:if test="${not empty report.attatchList }">
													<c:forEach items="${report.attatchList }" var="attatch" varStatus="vs">
														<span>
															${attatch.attFilename }
															<span class="btn btn-danger delBtn" data-att-no="${attatch.attId }">DEL</span>
															<c:if test="${not vs.last }">  </c:if>
														</span>
													</c:forEach>
												</c:if>
											</div>
										<div class="filebox">
										    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
										    <label for="file" class="btn btn-outline-primary ms-2"><i data-feather="upload"></i>Upload</label> 
										    <form:input type="file" id="file" path="reportFiles" multiple="true" />
										    <form:errors path="reportFiles" element="span" cssClass="error"/>
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

<%-- 파일 이름 --%>
$("#file").on("change",function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName.substr(12));
	});

<%-- 첨부파일 삭제 --%>
let boardForm = $(".yu_div_css").on("click", ".delBtn", function(event){
	  let attNo = $(this).data("attNo");
	  console.log(attNo);
	  console.log($(this));
	  
		let inputTag = $("<input>").attr({
							type:"text"
							, name:"delAttNos"
						}).attr('value',attNo);

		boardForm.prepend(inputTag);
		
		console.log($(this).parents("span:first"));
		
		$(this).parents("span:first").hide();
	});
	
CKEDITOR.replace('reportContent', {
	filebrowserImageUploadUrl : "${cPath}/file/image?command=imageUpload&${_csrf.parameterName}=${_csrf.token}",
});

CKEDITOR.editorConfig = function(config) {
	config.entities_latin = false;
	config.entities_greek = false;
	config.entities = false;
	config.basicEntities = false;
};
</script>
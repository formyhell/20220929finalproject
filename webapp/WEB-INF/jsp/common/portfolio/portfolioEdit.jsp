<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.     고혜인      컨트롤러 연결
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script src="http://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header pb-0">
					<h5>포트폴리오 수정</h5>
				</div>
				<form:form modelAttribute="pf" action="${cPath }/gen/myinfo/portfolio/${pfId }/form" method="post" enctype="multipart/form-data" class="form theme-form">
					<input type="hidden" name="_method" value="put">
					<form:input path="pfId" type="hidden" value="${pf.pfId }"/>
					<security:authentication property="principal" var="authMember" />
					<form:input path="pfMem" type="hidden" value="${authMember.realMember.memId }" />
					<div class="card-body">
					
					<div class="row">
							<div class="col">
								<div class="mb-3">
									<label>제목*</label>
									<form:input path="pfTitle" type="text" class="form-control" value="${pf.pfTitle }"/>
									<form:errors path="pfTitle" element="span" cssClass="error"></form:errors>
								</div>
							</div>
						</div>
					
					<div class="row">
							<div class="col-2">
								<div class="mb-3">
									<label>공개여부*</label>
									<div class="col-sm-9 radio radio-primary m-t-5">
										<form:radiobutton path="pfOpen" value="0" label="전체공개"
											checked="checked" cssClass="m-l-10" />
										<form:radiobutton path="pfOpen" value="1" label="비공개"
											cssClass="m-l-20" />
									</div>
								</div>
							</div>
							<div class="col">
								<div class="mb-3">
									<label>첨부파일</label>
								<form:input path="pfFiles" class="form-control" type="file" multiple="true" />
								<form:errors path="pfFiles" element="span" cssClass="error"></form:errors>
									<div class="col-sm-9 p-10">
										<c:if test="${not empty pf.attatchList }">
											<c:forEach items="${pf.attatchList }" var="attatch" varStatus="vs">
												<p>
													${attatch.attFilename }
													<span class="btn btn-danger delBtn btn-sm p-10" data-att-no="${attatch.attId }">DEL</span>
													<c:if test="${not vs.last }"></c:if>
												</p>
											</c:forEach>
										</c:if>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="mb-3">
									<label>시작일*</label>
									<form:input path="pfSdate" type="month" value="${pf.pfSdate }"
										class="form-control digits" />
									<form:errors path="pfSdate" element="span" cssClass="error"></form:errors>
								</div>
							</div>
							<div class="col">
								<div class="mb-3">
									<label>종료일*</label>
									<form:input path="pfFdate" class="form-control digits" value="${pf.pfFdate }"
										type="month" />
									<form:errors path="pfFdate" element="span" cssClass="error"></form:errors>
								</div>
							</div>
						</div>					
						<div class="row">
							<div class="col">
								<div class="mb-3">
									<label>직무 분야*</label>
									<div>
<!-- 										<input type="text" id="searchObj" class="form-control" /> -->
<!-- 										<p style="color: gray;">전체 리스트를 확인하려면 *을 입력하세요</p> -->
<!-- 										<div id="objForm"></div> -->
<%-- 										<form:input path="objCodes" type="hidden" /> --%>
<%-- 										<form:errors path="objCodes" element="span" cssClass="error"></form:errors> --%>

										<input type="text" id="searchObj" class="form-control" /> <p>전체 리스트를 확인하려면 *을 입력하세요</p>
										<div id="objForm"> 
											<div id="delObjList"></div>
											<c:forEach items="${pf.objCodeList }" var="objs">
												<span class="font-light badge badge-primary m-5 p-1" id="${objs.objId }">${objs.objCode } x</span>
											</c:forEach>
										</div>
										<form:input path="objCodes" type="hidden"/>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="mb-3">
									<label>사용 기술*</label>
									<div>
<!-- 										<input type="text" id="searchSkill" class="form-control" /> -->
<!-- 										<p style="color: gray;">전체 리스트를 확인하려면 *을 입력하세요</p> -->
<!-- 										<div id="skillForm"></div> -->
<%-- 										<form:input path="skillCodes" type="hidden" /> --%>
<%-- 										<form:errors path="skillCodes" element="span" cssClass="error"></form:errors> --%>
										<input type="text" id="searchSkill" class="form-control" /> <p>전체 리스트를 확인하려면 *을 입력하세요</p>
										<div id="skillForm">
											<div id="delskillList"></div>
											<c:forEach items="${pf.skillCodeList }" var="skills">
												<span id="${skills.skillId }" class="font-light badge badge-dark m-5 p-1">${skills.skillCode } x</span>
											</c:forEach>
										</div> 
										<form:input path="skillCodes" type="hidden"/>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col">
								<div class="mb-3">
									<label>고객사</label>
									<form:input path="pfClient" type="text" class="form-control" value="${pf.pfClient }"/>
									<form:errors path="pfClient" element="span" cssClass="error"></form:errors>
								</div>
							</div>
							<div class="col">
								<div class="mb-3">
									<label>결과물 링크</label>
									<form:input path="pfResulturl" class="form-control" type="url" placeholder="https://www.ddit.or.kr" value="${pf.pfResulturl }" />
									<form:errors path="pfResulturl" element="span" cssClass="error"></form:errors>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="mb-3">
									<label>내용*</label>
								<form:textarea path="pfContent" class="form-control" rows="5" cols="5" value="${pf.pfContent }" />
								<form:errors path="pfContent" element="span" cssClass="error"></form:errors>
								</div>
							</div>
						</div>						

			<div class="card-footer text-end">
				<div>
				</div>
				<div class="col-sm-9 offset-sm-3">
					<input class="btn btn-primary" type="submit" value="저장" > 
					<input class="btn btn-light" type="reset" value="취소">
				</div>
			</div>
				</form:form>
			</div>
		</div>

		</div>
	</div>

<script>
var parameter = '${_csrf.parameterName}';
var token =  '${_csrf.token}'; 


CKEDITOR.replace('pfContent', {
	height : 400,
	filebrowserImageUploadUrl : "${cPath}/file/image?command=imageUpload&${_csrf.parameterName}=${_csrf.token}"
});

$.CPATH = "${cPath}";
</script>
<script src="${cPath }/resources/js/ckeditor/editorConfig.js"></script>
<script src="${cPath }/resources/js/portfolio/portfolioEdit.js"></script>

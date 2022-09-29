<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      홍승조      컨트롤러 생성
* 2022. 8. 10.     고혜인      jsp 내용 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js"
	type="text/javascript"></script>



<form:form modelAttribute="qna" method="post" action="${cPath }/qna/${qna.qnaNo }">
	<security:csrfInput />
	<input type="hidden" name="_method" value="put" />
	<form:input type="hidden" path="qnaNo" value="${qna.qnaNo }" />
	<form:input type="hidden" path="qnaDate" value="${qna.qnaDate }" />
	<form:input type="hidden" path="qnaAnswer" value="${qna.qnaAnswer }" />
	<form:input type="hidden" path="qnaWriter" value="${qna.qnaWriter }" />

	<div id="services-section" class="pt-xs-60" style="padding-top: 5vh">
		<div class="container">
			<div class="row padding-20">
				<div class="col-sm-12">
					<div class="block-title v-line mb-45">
						<h2>
							Q<span>&</span>A
						</h2>
						<p class="italic">질문 게시판</p>
					</div>
					<div class="form-group">
						<label for="title">제목</label>
						<div class="ui-input-group">
							<form:input path="qnaTitle" required="required"
								style="width: 100%;" value="${qna.qnaTitle }" />
							<form:errors path="qnaTitle" element="span" cssClass="error" />
						</div>
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<div class="ui-input-group">
							<form:textarea path="qnaContent" required="required"
								style="height: 500px; width: 100%;" value="${qna.qnaContent }" />
							<form:errors path="qnaContent" element="span" cssClass="error" />
						</div>
					</div>
					<div class="float-right mb-25">
						<input type="submit" value="저장" class="btn btn-primary" /> 
						<input type="reset" value="취소" class="btn btn-warning" />
					</div>
				</div>
			</div>
		</div>
	</div>

</form:form>

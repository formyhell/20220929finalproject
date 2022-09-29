<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      홍승조      컨트롤러 생성
* 2022. 8. 9.      고혜인      jsp 내용 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<!-- QNA 작성 화면 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js"
	type="text/javascript"></script>
	
<form:form modelAttribute="qna" method="post" action="${cPath }/qna">

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
				<div>
					<div class="form-group">
						<label for="title">제목</label>
						<div class="ui-input-group">
							<form:input type="text" path="qnaTitle" required="required" style="width: 100%;" />
							<form:errors path="qnaTitle" element="span" cssClass="error"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<div class="ui-input-group">
							<form:textarea path="qnaContent" required="required"
								style="height: 500px; width: 100%;"
								placeholder="상업성 광고, 저속한 표현, 특정인에 대한 비방 등의 게시글은 관리자에 의해 통보없이 삭제될 수 있습니다" />
							<form:errors path="qnaContent" element="span" cssClass="error"></form:errors>
						</div>
					</div>
				</div>
			</div>
			<div class="float-right mb-25">
				<input type="submit" value="저장" class="btn btn-warning" />
				<input type="reset" value="취소" class="btn btn-primary"  />
			</div>
		</div>
	</div>


<security:authentication property="principal" var="authMember"/>
<%-- <c:if test="${authMember.realMember.memType.get(0) eq 'ROLE_GENMEM'}"> --%>
	<form:input path="qnaWriter" type="hidden" value="${authMember.realMember.memId }"/>
<%-- </c:if> --%>
<%-- <c:if test="${authMember.realMember.memType.get(0) eq 'ROLE_COMMEM'}"> --%>
<%-- 	<form:input path="qnaWriter" type="hidden" value="${authMember.realMember.comNick }"/> --%>
<%-- </c:if> --%>

</form:form>


<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      김유진           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js"
	type="text/javascript"></script>

<!-- Intro Section -->
<section
	class="inner-intro bg-img light-color overlay-before parallax-background">
	<div class="container">
		<div class="row title">
			<h1 data-title="register">
				<span>회원정보 수정</span>
			</h1>
		</div>
	</div>
</section>
<!-- Intro Section -->
<!-- Login Section -->
<div class="container">
	<div class="row">
		<div class="main-body">
			<div class="body-inner">
				<div class="card-header pb-0" style="background-color: #ffff;">
					<div class="card-body" style="background-color: #ffff;">
						<section class="logo text-center"></section>
						<div id="gen">
							<!-- 일반 회원 수정 폼 -->
							<form:form action="${cPath }/gen/myinfo/${genMember.genId }"
								modelAttribute="genMember" method="post"
								enctype="multipart/form-data">
								<!-- <input type="hidden" name="_method" value="put">  -->
								<!--  post -> put method로 바꿔줌  -->
								<sec:csrfInput />


								<div class="mb-3">
									<div class="ui-input-group">
										<label>프로필 이미지</label>
										<form:input type="file" path="genImage"
											value="${genMember.genImg}"
											class="form-control btn-pill btn-pill" />
										<span class="input-bar"></span>
										<form:errors path="genImage" element="span" cssClass="error"></form:errors>
									</div>
								</div>


								<div class="form-group">
									<div class="ui-input-group">
										<label>회원이름</label>
										<form:input path="genName" value="${genMember.genName }"
											class="form-control btn-pill" />
										<span class="input-bar"></span>
										<form:errors path="genNick" element="span" cssClass="error"></form:errors>
									</div>
								</div>

								<div class="form-group">
									<div class="ui-input-group">
										<label>닉네임*</label>
										<form:input path="genNick" value="${genMember.genNick }"
											class="form-control btn-pill" />
										<span class="input-bar"></span>
										<form:errors path="genNick" element="span" cssClass="error"></form:errors>
									</div>
								</div>
								<div class="form-group">
									<div class="ui-input-group">
										<label>이메일*</label>
										<form:input path="genMail" value="${genMember.genMail}"
											class="form-control btn-pill" />
										<span class="input-bar"></span>
										<form:errors path="genMail" element="span" cssClass="error"></form:errors>
									</div>
								</div>
								<div class="form-group">
									<div class="ui-input-group">
										<label>전화번호*</label>
										<form:input path="genHp" value="${genMember.genHp }"
											class="form-control btn-pill" />
										<span class="input-bar"></span>
										<form:errors path="genHp" element="span" cssClass="error"></form:errors>
									</div>
								</div>
								<div class="form-group">
									<div class="ui-input-group">
										<label>자기소개*</label>
										<form:input path="genIntro" value="${genMember.genIntro }"
											class="form-control btn-pill" />
										<span class="input-bar"></span>
										<form:errors path="genIntro" element="span" cssClass="error"></form:errors>
									</div>
								</div>

								<!-- 		                     <div class="form-group"> -->
								<!-- 				                <label for="title">선호 지역</label> -->
								<!-- 				            		<div class="ui-input-group" style="display:inline;"> -->
								<%-- 				                          <c:forEach items="${genMember.locList}" var="loc"> --%>
								<%-- 					                                <form:checkbox path="genLoc" id="${loc.locCode }" value="${loc.locCode }"/> --%>
								<%-- 					                                <label for="${loc.locCode }">${loc.locName }</label> --%>
								<%-- 					                                <form:errors path="genLoc" element="span" cssClass="error"/> --%>
								<%-- 				                          </c:forEach> --%>
								<!-- 				            </div> -->
								<!-- 				            </div> -->

								<div class="spacer"></div>
								<div class="card-footer text-end">
									<div class="col-sm-9 offset-sm-3">
										<input id="btn-update" type="submit" class="btn btn-primary"
											value="수정완료">
									</div>
								</div>

								<!-- 		                  </fieldset> -->
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

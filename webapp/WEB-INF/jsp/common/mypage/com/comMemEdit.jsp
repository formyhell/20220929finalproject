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
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<h4>기업회원 업데이트 폼</h4>

 <!-- Intro Section -->
  <section class="inner-intro bg-img light-color overlay-before parallax-background">
    <div class="container">
      <div class="row title">
        <h1 data-title="register"><span>기업정보 수정</span></h1>
      </div>
    </div>
  </section>
  <!-- Intro Section --> 
    <!-- Login Section -->
    <div class="container">
      <div class="row">
        <div class="main-body">
          <div class="body-inner">
            <div class="card bg-white">
                  <ul class="nav nav-tabs">
				    <li class="active" style="width: 50%"><a data-toggle="tab" href="#com">기업회원</a></li>
				  </ul>
              <div class="card-content">
                <section class="logo text-center">
                </section>
                
    				<div id="com" >  
    					<!-- 기업 회원 수정 폼 -->
    					<form:form action="${cPath }/com/myinfo/${comMember.comId }" modelAttribute="comMember" method="post" enctype="multipart/form-data">
<!-- 						<input type="hidden" name="_method" value="put"> post -> put method로 바꿔줌 -->
						<sec:csrfInput/>
						
<%-- 						<input type="hidden" name="${comMember.comId}">					  --%>
							
								<div class="form-group">
		                      <div class="ui-input-group">
		                     	<label>프로필 이미지</label>
		                        <form:input type="file" path="comImage" value="${comMember.comImg}" class="form-control" />
		                        <span class="input-bar"></span>
<%-- 		                        <form:errors path="comImage" element="span" cssClass="error"></form:errors> --%>
		                      </div>
		                    </div>
								
							<div class="form-group">
		                      <div class="ui-input-group">
		                        <label>기업이름</label>
		                        <form:input path="comComname" value="${comMember.comComname}" class="form-control" />
		                        <span class="input-bar"></span>
		                        <form:errors path="comComname" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                   
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <label>닉네임</label>
		                        <form:input path="comNick" value="${comMember.comNick }" class="form-control" />
		                        <span class="input-bar"></span>
		                        <form:errors path="comNick" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <label>기업대표자 명</label>
		                        <form:input path="comComceo" value="${comMember.comComceo}" class="form-control" />
		                        <span class="input-bar"></span>
		                        <form:errors path="comComceo" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div> 
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <label>회원 전화번호</label>
		                        <form:input path="comHp" value="${comMember.comHp}" class="form-control" />
		                        <span class="input-bar"></span>
		                        <form:errors path="comHp" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div> 
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <label>이메일</label>
		                        <form:input path="comMail" value="${comMember.comMail }" class="form-control"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="comMail" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                     <div class="form-group">
		                      <div class="ui-input-group">
		                        <label>기업대표번호</label>
		                        <form:input path="comComtel" value="${comMember.comComtel }" class="form-control"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="comComtel" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                    
		                    <div class="spacer"></div>
		                    <div class="card-action no-border text-right">
		                    	<input id="btn-update" type="submit" class="btn btn-primary" value="수정완료">
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

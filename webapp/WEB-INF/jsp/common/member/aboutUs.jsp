<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 9.      작성자           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    
<div id="services-section" class="pt-xs-60" style="padding-top: 5vh">
	<div class="container">
		<div class="row">
			<img alt="" src="">
			<div class="col-sm-12">
	<pre>
		- PHOS는 개발자를 위한 아웃소싱을 기반으로 프로젝트 추천기능 및 프로젝트 관리 서비스인 PMS까지 한번에 
		 사용하기 위한 프로젝트 이다.
		
		-  아웃소싱 서비스를 제공하는 사이트를 참고하여 기존에 없던 프로젝트 추천기능과 PMS 서비스까지
		 제공하는 방식으로 재해석 했습니다.
		
		- 본인이 가진 기술과 희망 근무 지역 등을 기반으로 아웃소싱 프로젝트를 회원에게 추천하여
		 일반회원에게는 프로젝트를 본인이 지원하고 싶은 프로젝트를 찾는 수고를 덜어주고,
		 기업회원에게는 프로젝트에 지원한 사람을 한번 걸러주는 역할을 하여 중간 단계를 한번 생략할 수 있게 하기 위한 목적
		
		- 업무 진척도를 한눈에 파악할 수 있게 PMS에서 간트차트 지원
	</pre>
	

<!-- 컨트롤러에서 가져온 경우 -->
<%--     <h4>id : ${id }</h4> --%>
<!--     <br> -->
<%--     <h4> member : ${member } </h4> --%>
<!--     <br> -->
<%--     <h4> memId : ${member.memId } </h4> --%>
<!--     <br> -->
<%--     <h4> memPass : ${member.memPass } </h4> --%>
<!--     <br> -->
<%--     <h4> memType : ${member.memType[0] }</h4> --%>
    

<!-- <br><br><h4>-------------------------------------------------------------------</h4> -->


<!-- 바로 쓰는 경우 -->
<!-- 위에서 taglib 설정 필요-->
	<!-- 로그인 전 -->
<%-- 	<security:authorize access="isAnonymous()"> --%>
	
<%-- 	</security:authorize> --%>
	
	<!-- 로그인 후 -->
<%-- 	<security:authorize access="isAuthenticated()"> --%>
	
<%-- 	</security:authorize> --%>
	


	<!-- authentication 객체(인증) -->
<%-- 	<security:authentication property="principal" var="authMember" />  --%>

<%-- 	<h4>아이디 : ${authMember.realMember.memId }</h4> --%>

<%-- 	<h4>memverVO : ${authMember.realMember }</h4> --%>
<%-- 	<h4>role: ${authMember.realMember.memType.get(0) }</h4> --%>
	
	
<!-- <br><h4>-------------------------------------------------------------------</h4><br> -->
	
	
<!-- 	<h4>jsp에서 사용자vo 바로 가져오기 : 해당하는 회원 유형의 주석을 풀고 확인하시오</h4> -->
<!-- 	<h4>일반회원</h4> -->
	<%-- 
	${authMember.realMember.genId }           
	${authMember.realMember.genPass }         
	${authMember.realMember.genNick }         
	${authMember.realMember.genName }         
	${authMember.realMember.genBirth }        
	${authMember.realMember.genMail }         
	${authMember.realMember.genHp }           
	${authMember.realMember.genIntro }        
	${authMember.realMember.genDelete }       
	${authMember.realMember.genRating }       
	${authMember.realMember.enabled }         
	${authMember.realMember.genGrd }    
	--%>       
	
	
<!-- 	<h4>기업회원</h4> -->
	<%-- 
	${authMember.realMember.comId }        
	${authMember.realMember.comPass }      
	${authMember.realMember.comNick }      
	${authMember.realMember.comName }      
	${authMember.realMember.comHp }        
	${authMember.realMember.comComname }   
	${authMember.realMember.comMail }      
	${authMember.realMember.comComtel }    
	${authMember.realMember.comComceo }    
	${authMember.realMember.comCbr }       
	${authMember.realMember.comOpendate }  
	${authMember.realMember.comDelete }    
	${authMember.realMember.comRating }    
	${authMember.realMember.enabled }      
	${authMember.realMember.comGrd }        
	--%>
	
<!-- 	<h4>관리자</h4> -->
	<%-- 
	${authMember.realMember.adminId }           
	${authMember.realMember.adminPass }       
	${authMember.realMember.enabled }  
	--%>       
			</div>
		</div>
	</div>
</div>

	
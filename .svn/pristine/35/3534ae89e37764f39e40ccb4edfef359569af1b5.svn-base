<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.       고혜인      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script src="${cPath}/resources/js/jquery-3.6.0.min.js" type="text/javascript"></script>

<section class="inner-intro bg-img light-color overlay-before parallax-background">
	<div class="container">
		<div class="row title">
			<h1 data-title="아이디 찾기">
				<span>아이디 찾기</span>
			</h1>
		</div>
	</div>
</section>

<div id="find" class="ptb ptb-xs-60 page-signin">
	<div class="container">
		<div class="row">
			<div class="main-body">
				<div class="body-inner">
					<div class="card bg-white">
						<ul class="nav nav-tabs">
							<li class="active" style="width: 50%"><a data-toggle="tab" href="#gen">일반회원</a></li>
							<li style="width: 50%"><a data-toggle="tab" href="#com">기업회원</a></li>
						</ul>
						<div class="card-content">
							<section class="logo text-center"></section>

							<div class="tab-content">
								<div id="gen" class="tab-pane fade in active">

									<!-- 일반 회원 아이디 찾기 -->
									<form class="form-horizontal ng-pristine ng-valid">
										<fieldset>
											<!-- required="required" -->
											<div class="form-group">
												<div class="ui-input-group">
													<input type="text" id="genName" required  class="form-control">
													<span class="input-bar"></span> <label>회원명</label>
												</div>
											</div>
											<div class="form-group">
												<div class="ui-input-group">
													<input type="email" id="genMail" required  class="form-control">
													<span class="input-bar"></span> 
													<label>이메일 </label>
												</div>
											</div>
											<div class="card-action no-border text-right">
												<button type="submit" class="btn btn-primary" id="genIdBtn">확인</button>
											</div>
											<div id="genIdRst"></div>
											
										</fieldset>
									</form>
								</div>
								
								<div id="com" class="tab-pane fade">
									<!-- 기업 회원 가입 폼 -->
									<form class="form-horizontal ng-pristine ng-valid">
										<fieldset>
											<div class="form-group">
												<div class="ui-input-group">
													<input type="text" id="comName" required class="form-control"> 
													<span class="input-bar"></span> <label>회원명</label>
												</div>
											</div>
											<div class="form-group">
												<div class="ui-input-group">
													<input type="text" id="comMail" required class="form-control"> 
													<span class="input-bar"></span> <label>이메일 </label>
												</div>
											</div>
											<div class="form-group">
												<div class="ui-input-group">
													<input type="text" id="comComname" required class="form-control"> 
													<span class="input-bar"></span> <label>기업명 </label>
												</div>
											</div>
											<div class="card-action no-border text-right">
												<input type="submit" id="comIdBtn" class="btn btn-primary" value="확인">
											</div>
											<div id="comIdRst"></div>
										</fieldset>
									</form>
								</div>
							</div>
							<div class="additional-info">
								<a href="${cPath }/member/form" style="color: #01776B; font-size: 15px">회원가입</a>
								<span class="divider-h"></span> 
								<a href="${cPath }/login" style="color: #00A99D; font-size: 15px">로그인</a>
								<span class="divider-h"></span> 
								<a href="${cPath }/member/find/password" style="color: #00A99D; font-size: 15px;">비밀번호 찾기</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
let header = '${_csrf.headerName}';
let token =  '${_csrf.token}'; 

//일반회원 아이디 찾기
$(document).on("click", "#genIdBtn", function(event) {
	event.preventDefault();
	
	let genName = $("#genName").val();
	let genMail = $("#genMail").val();
	
	let genData = JSON.stringify({
		genName : genName
		, genMail : genMail
	});
	
	$.ajax({
		type:"post",
		dataType:"text",
		url:"${cPath}/member/find/genId",
		data:genData,
		contentType: 'application/json;charset=utf-8',
		beforeSend : function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success: function(result) {
			if(result == "error") {
				$("#genIdRst").text("존재하지 않는 회원입니다");
			} else {
				$("#genIdRst").text("찾는 아이디는 '"+result+"'입니다");
			}
		},
		error:function(request, status, err){
			console.log(request);
			console.log(status);
			console.log(err);				
		}
	});
	
});

//기업회원 아이디 찾기
$(document).on("click", "#comIdBtn", function(event) {
	event.preventDefault();
	
	let comName = $("#comName").val();
	let comMail = $("#comMail").val();
	let comComname = $("#comComname").val();
	
	let genData = JSON.stringify({
		comName : comName
		, comMail : comMail
		, comComname : comComname
	});
	
	$.ajax({
		type:"post",
		dataType:"text",
		url:"${cPath}/member/find/comId",
		data:genData,
		contentType: 'application/json;charset=utf-8',
		beforeSend : function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success: function(result) {
			if(result == "error") {
				$("#comIdRst").text("존재하지 않는 회원입니다");
			} else {
				$("#comIdRst").text("찾는 아이디는 '"+result+"'입니다");
			}
		},
		error:function(request, status, err){
			console.log(request);
			console.log(status);
			console.log(err);				
		}
	});
	
});
</script>


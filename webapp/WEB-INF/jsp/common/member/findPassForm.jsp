<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 10.       고혜인      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="${cPath }/resources/assetsPms/js/jquery-3.5.1.min.js"></script>

<section class="inner-intro bg-img light-color overlay-before parallax-background">
	<div class="container">
		<div class="row title">
			<h1 data-title="비밀번호 찾기">
				<span>비밀번호 찾기</span>
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
							<%-- 일반회원 비밀번호 찾기 --%>
							<div class="tab-content">
								<div id="gen" class="tab-pane fade in active">
									<form class="form-horizontal ng-pristine ng-valid">
										<fieldset>
											<!-- required="required" -->
											<div class="form-group">
												<div class="ui-input-group">
													<input type="text" id="genId" required  class="form-control">
													<span class="input-bar"></span> <label>아이디</label>
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
												<button type="submit" class="btn btn-primary" id="genPwBtn">확인</button>
											</div>
											<div id="genPwRst"></div>
										</fieldset>
									</form>
								</div>
								
								<!-- 기업회원 비밀번호 찾기 -->
								<div id="com" class="tab-pane fade">
									<form class="form-horizontal ng-pristine ng-valid">
										<fieldset>
											<div class="form-group">
												<div class="ui-input-group">
													<input type="text" id="comId" required class="form-control"> 
													<span class="input-bar"></span> <label>아이디</label>
												</div>
											</div>
											<div class="form-group">
												<div class="ui-input-group">
													<input type="text" id="comMail" required class="form-control"> 
													<span class="input-bar"></span> <label>이메일 </label>
												</div>
											</div>
											
											<div class="card-action no-border text-right">
												<input type="submit" id="comPwBtn" class="btn btn-primary" value="확인">
											</div>
											<div id="comPwRst"></div>
										</fieldset>
									</form>
								</div>
							</div>
							<div class="additional-info">
								<a href="${cPath }/member/form" style="color: #01776B; font-size: 15px">회원가입</a>
								<span class="divider-h"></span> 
								<a href="${cPath }/login" style="color: #00A99D; font-size: 15px">로그인</a>
								<span class="divider-h"></span> 
								<a href="${cPath }/member/find/ID" style="color: #00A99D; font-size: 15px;">아이디 찾기</a>
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

//일반회원 비밀번호 찾기(회원정보 확인)
$("#genPwBtn").on("click", function(event) {
	event.preventDefault();
	
	let genId = $("#genId").val();
	let genMail = $("#genMail").val();
	
	let genData = JSON.stringify({
		genId : genId
		, genMail : genMail
	});
	
	
	$.ajax({
		type:"post",
		dataType:"text",
		url:"${cPath}/member/find/genPass",
		data:genData,
		contentType: 'application/json;charset=utf-8',
		beforeSend : function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success: function(result) {
			if(result == "ok") {
				$("#genPwRst").text("입력한 이메일로 임시 비밀번호를 보내드렸습니다");
			} else {
				$("#genPwRst").text("일치하는 회원이 없습니다");
			}
		},
		error:function(request, status, err){
			console.log(request);
			console.log(status);
			console.log(err);				
		}
	});
	
});

//기업회원 비밀번호 찾기
$("#comPwBtn").on("click", function(event) {
	event.preventDefault();
	
	let comId = $("#comId").val();
	let comMail = $("#comMail").val();
	
	let genData = JSON.stringify({
		comId : comId
		, comMail : comMail
	});
	
	$.ajax({
		type:"post",
		dataType:"text",
		url:"${cPath}/member/find/comPass",
		data:genData,
		contentType: 'application/json;charset=utf-8',
		beforeSend : function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success: function(result) {
			if(result == "ok") {
				$("#comPwRst").text("입력한 이메일로 임시 비밀번호를 보내드렸습니다");
			} else {
				$("#comPwRst").text("일치하는 회원이 없습니다");
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
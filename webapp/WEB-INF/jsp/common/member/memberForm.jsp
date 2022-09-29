<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 1.      김유진           최초작성
* 2022. 8. 3.      김유진           사업자등록번호 인증 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="${cPath}/resources/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link href="${cPath }/resources/css/modal/myModal.css" rel="stylesheet">
<link href="${cPath }/resources/css/pre/preStyle.css" rel="stylesheet">

<style>
/* 생년월일 input박스 안보이게 */
input[type='date']::before {
  content: attr(data-placeholder);
  width: 100%;
}
input[type='date']:focus::before,
input[type='date']:valid::before {
  display: none;
}
.bg-white  {
	font-size: small;
	color: #f82a2aa3;
}
.checkbox-field #check_box2 {
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0;
}
input[type="checkbox"]{
	appearance : checkbox;
		width: 20px;
	    height: 20px;
	    display: inline-block;
	    border: 1px solid #1fcab8;
	    top: 4px;
	    position: relative;
	    margin-right: 10px;
	}
</style>

  <!-- Intro Section -->
  <section class="inner-intro bg-img light-color overlay-before parallax-background">
    <div class="container">
      <div class="row title">
        <h1 data-title="register"><span>register</span></h1>
      </div>
    </div>
  </section>
  <!-- Intro Section --> 
    <!-- Login Section -->
  <div id="login" class="ptb ptb-xs-60 page-signin">
       
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
                <section class="logo text-center">
                </section>
                
				<div class="tab-content">
    				<div id="gen" class="tab-pane fade in active">  
    					<!-- 일반 회원 가입 폼 -->
    					<form:form action="${cPath }/member/form/gen" class="form-horizontal ng-pristine ng-valid" modelAttribute="genMember" method="post" onsubmit="return genSubmitCheck();">
<%-- 		                <form class="form-horizontal ng-pristine ng-valid"> --%>
		                  <fieldset>
		                    <div class="form-group">
		                      <div class="ui-input-group" style="width: 340px; display: inline-block;">
		                      	<form:input id="genID" path="genId" value="${genMember.genId }" class="form-control" placeholder="영문과 숫자를 포함한 2~20자"/>
		                        <span class="input-bar"></span>
		                        <label>아이디*</label>
		                        <form:errors path="genId" element="span" cssClass="error"></form:errors>
		                      </div>
		                      <div id="genIdChkBtn" class="btn btn-primary" style="cursor : pointer; height: 36px; margin-bottom: 1px;">확인</div>
		                    </div>
		                    <div class="form-group">
		                       <div class="ui-input-group">
		                        <form:input id="genPass" type="password" path="genPass" value="${genMember.genPass }"  class="form-control"  placeholder="영문, 숫자, 특수문자를 모두 포함한 2~10자"/>
		                        <span class="input-bar"></span>
		                        <label>비밀번호*</label>
		                        <form:errors path="genPass" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <form:input id="genPassChk" path="" type="password" class="form-control" placeholder="영문, 숫자, 특수문자를 모두 포함한 2~10자"/>
		                        <span class="input-bar"></span>
		                        <label>비밀번호 확인*</label>
		                      </div>
		                         <font id="chkNotice" size="2"></font>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <form:input path="genName" value="${genMember.genName }" class="form-control" placeholder="특수문자를 제외한 2자 이상"/>
		                        <span class="input-bar"></span>
		                        <label>회원명*</label>
		                        <form:errors path="genName" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group" style="width: 340px; display: inline-block;">
		                        <form:input id="genNick" path="genNick" value="${genMember.genNick }" class="form-control" placeholder="특수문자를 제외한 2~10자" />
		                        <span class="input-bar"></span>
		                        <label>닉네임*</label>
		                        <form:errors path="genNick" element="span" cssClass="error"></form:errors>
		                      </div>
		                      <div id="genNickChkBtn" class="btn btn-primary" style="cursor : pointer; height: 36px; margin-bottom: 1px;">확인</div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                      	<form:input type="date" path="genBirth" value="${genMember.genBirth }"  class="form-control" />
		                        <span class="input-bar" ></span>
		                        <label>생년월일*</label>
		                        <form:errors path="genBirth" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <form:input path="genMail" value="${genMember.genMail}" class="form-control" placeholder="example@naver.com" />
		                        <span class="input-bar"></span>
		                        <label>이메일*</label>
		                        <form:errors path="genMail" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div> 
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <form:input path="genHp" value="${genMember.genHp }" class="form-control" placeholder="010-1234-5678"/>
		                        <span class="input-bar"></span>
		                        <label>전화번호*</label>
		                        <form:errors path="genHp" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                    <div class="spacer"></div>
		                    <div class="form-group checkbox-field">
		                      <label for="check_box" class="text-small">
		                        <input type="checkbox" id="check_box" >
		                        <span class="ion-ios-checkmark-empty22 custom-check"></span> <span class="privacyPolicy gray-bg">이용 약관</span>에 동의하시면 체크해주시기 바랍니다.</label>
		                    </div>
		                    <div class="card-action no-border text-right">
		                    	<input type="submit" class="btn btn-primary" value="Sign Up">
		                    </div>
		                  </fieldset>
		                </form:form>
				    </div>
				    
				    
				    <div id="com" class="tab-pane fade">
				    	<!-- 기업 회원 가입 폼 -->
		                <form:form action="${cPath }/member/form/com" class="form-horizontal ng-pristine ng-valid" modelAttribute="comMember" method="post" onsubmit="return comSubmitCheck();">
		                  <fieldset>
					          <input type="checkbox" name="checkbox" id="checkbox" onchange="check1(this)" > 
		                    <div class="form-group">
		                      <div class="ui-input-group" style="width: 340px; display: inline-block;">
		                        <form:input id="comID" path="comId" value="${comMember.comId }" class="form-control" placeholder="영문과 숫자를 포함한 2~20자" />
		                        <span class="input-bar"></span>
		                        <label>아이디*</label>
		                        <form:errors path="comId" element="span" cssClass="error"></form:errors>
		                      </div>
		                      <div id="comIdChkBtn" class="btn btn-primary" style="cursor : pointer; height: 36px; margin-bottom: 1px;">확인</div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                      	<form:input id="comPass" type="password" path="comPass" value="${comMember.comPass }"  class="form-control"  placeholder="영문, 숫자, 특수문자를 모두 포함한 2~10자"/>
		                        <span class="input-bar"></span>
		                        <label>비밀번호*</label>
		                        <form:errors path="comPass" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <form:input id="comPassChk" path="" type="password" class="form-control"  placeholder="영문, 숫자, 특수문자를 모두 포함한 2~10자"/>
		                        <span class="input-bar"></span>
		                        <label>비밀번호 확인*</label>
		                        <font id="chkNotice2" size="2"></font>
		                      </div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <form:input path="comName" value="${comMember.comName }" class="form-control" placeholder="특수문자를 제외한 2자 이상"/>
		                        <span class="input-bar"></span>
		                        <label>회원명*</label>
		                        <form:errors path="comName" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group" style="width: 340px; display: inline-block;">
		                        <form:input path="comNick" value="${comMember.comNick }" class="form-control" placeholder="특수문자를 제외한 2~10자"/>
		                        <span class="input-bar"></span>
		                        <label>닉네임*</label>
		                        <form:errors path="comNick" element="span" cssClass="error"></form:errors>
		                      </div>
		                      <div id="comNickChkBtn" class="btn btn-primary" style="cursor : pointer; height: 36px; margin-bottom: 1px;">확인</div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <form:input path="comMail" value="${comMember.comMail}" class="form-control" placeholder="example@naver.com"/>
		                        <span class="input-bar"></span>
		                        <label>이메일*</label>
		                        <form:errors path="comMail" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div> 
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <form:input path="comHp" value="${comMember.comHp }" class="form-control" placeholder="010-1234-5678"/>
		                        <span class="input-bar"></span>
		                        <label>전화번호*</label>
		                        <form:errors path="comHp" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div>
		                     <br>
		                     <div class="form-group">
		                      <div class="ui-input-group">
		                      	<form:input path="comComname" value="${comMember.comComname }" class="form-control" />
		                        <span class="input-bar" ></span>
		                        <label>기업명*</label>
		                        <form:errors path="comComname" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div>
		                     <div class="form-group">
		                      <div class="ui-input-group">
		                      	<form:input path="comComtel" value="${comMember.comComtel }" class="form-control"  placeholder="042-1234-5678"/>
		                        <span class="input-bar" ></span>
		                        <label>기업 전화번호*</label>
		                        <form:errors path="comComtel" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div>
		                     <div class="form-group">
		                      <div class="ui-input-group">
		                      	<form:input path="comComceo" value="${comMember.comComceo }" class="form-control" />
		                        <span class="input-bar" ></span>
		                        <label>기업 대표자명*</label>
		                        <form:errors path="comComceo" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div>
		                     <div class="form-group" id="registrationId">
		                      <div class="ui-input-group" style="width: 340px; display: inline-block;">
		                      	<form:input id="registrationNo" path="comCbr" value="${comMember.comCbr }" class="form-control" placeholder="기호없이 숫자만 입력하세요"/>
		                        <span class="input-bar" ></span>
		                        <label>사업자등록번호 샘플번호:3068205291 *</label>
		                        <form:errors path="comCbr" element="span" cssClass="error"></form:errors>
		                      </div>
		                        <div id="registrationBtn" class="btn btn-primary" style="cursor : pointer; height: 36px; margin-bottom: 1px;">확인</div>
		                     </div>
		                     <div class="form-group">
		                      <div class="ui-input-group">
		                     	<form:input  type="date" path="comOpendate" value="${comMember.comOpendate }" class="form-control"/>
		                        <span class="input-bar" ></span>
		                        <label>기업개업일자*</label>
		                        <form:errors path="comOpendate" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div>
		                     <div class="spacer"></div>
		                    <div class="form-group checkbox-field">
		                      <label for="check_box2" class="text-small">
		                        <input type="checkbox" id="check_box2" >
		                        <span class="ion-ios-checkmark-empty22 custom-check"></span> <span class="privacyPolicy gray-bg">이용 약관</span>에 동의하시면 체크해주시기 바랍니다. </label>
		                    </div>
		                    <div class="card-action no-border text-right">
		                    	<input type="submit" class="btn btn-primary" value="Sign Up">
		                    </div>
		                  </fieldset>
		                </form:form>
				    </div>
            	  </div>
            	  <div class="additional-info">
						<a href="${cPath }/login" style="color: #01776B; font-size: 15px">로그인</a>
						<span class="divider-h"></span> 
						<a href="${cPath }/member/find/ID" style="color: #00A99D; font-size: 15px">아이디 찾기</a> / 
						<a href="${cPath }/member/find/password" style="color: #00A99D; font-size: 15px;">비밀번호 찾기</a>		</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End Login Section -->   

<!-- 이용약관 -->
<div id="mymodal"  style="overflow: auto">
	<div class="my-content">
		<div class="modal-content padding-20 width-75per" >
			<div class="modal-header">
				<h5 class="modal-title">
					이용 약관
					<button type="button" class="btn btn-secondary float-right" onclick="f_check()">&times;</button>
				</h5>
			</div>
				<div class="modal-body">
<pre>
제 1 장 총칙
제 1 조 (목적)
본 약관은 ‘PHOS’(이하 “웹사이트”라 합니다)에서 제공하는 온라인 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버몰과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.

제 2 조 (용어의 정의)
본 약관에서 사용하는 용어는 다음과 같이 정의한다.

“웹사이트”란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래 할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
“이용자”란 “웹사이트”에 접속하여 서비스를 이용하는 회원 및 비회원을 말합니다.
“회원”이라 함은 “웹사이트”에 개인정보를 제공하여 회원등록을 한 자로서, “웹사이트”의 정보를 지속적으로 제공받으며, “웹사이트”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
“비회원”이라 함은 회원에 가입하지 않고, “웹사이트”이 제공하는 서비스를 이용하는 자를 말합니다.
“ID”라 함은 이용자가 회원가입당시 등록한 사용자 “개인이용문자”를 말합니다.
“멤버십”이라 함은 회원등록을 한 자로서, 별도의 온/오프라인 상에서 추가 서비스를 제공 받을 수 있는 회원을 말합니다.
제 3 조 (약관의 공시 및 효력과 변경)
본 약관은 회원가입 화면에 게시하여 공시하며 회사는 사정변경 및 영업상 중요한 사유가 있을 경우 약관을 변경할 수 있으며 변경된 약관은 공지사항을 통해 공시한다
본 약관 및 차후 회사사정에 따라 변경된 약관은 이용자에게 공시함으로써 효력을 발생한다.
제 4 조 (약관 외 준칙)
본 약관에 명시되지 않은 사항이 전기통신기본법, 전기통신사업법, 정보통신촉진법, ‘전자상거래등에서의 소비자 보호에 관한 법률’, ‘약관의 규제에관한법률’, ‘전자거래기본법’, ‘전자서명법’, ‘정보통신망 이용촉진등에 관한 법률’, ‘소비자보호법’ 등 기타 관계 법령에 규정되어 있을 경우에는 그 규정을 따르도록 한다.

제 2 장 이용계약
제 5 조 (이용신청)
이용신청자가 회원가입 안내에서 본 약관과 개인정보보호정책에 동의하고 등록절차(회사의 소정 양식의 가입 신청서 작성)를 거쳐 ‘확인’ 버튼을 누르면 이용신청을 할 수 있다.
이용신청자는 반드시 실명과 실제 정보를 사용해야 하며 1개의 생년월일에 대하여 1건의 이용신청을 할 수 있다.
실명이나 실제 정보를 입력하지 않은 이용자는 법적인 보호를 받을 수 없으며, 서비스 이용에 제한을 받을 수 있다.
제 6 조 (이용신청의 승낙)
회사는 제5조에 따른 이용신청자에 대하여 제2항 및 제3항의 경우를 예외로 하여 서비스 이용을 승낙한다.
회사는 아래 사항에 해당하는 경우에 그 제한사유가 해소될 때까지 승낙을 유보할 수 있다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 회사 사정상 필요하다고 인정되는 경우
회사는 아래 사항에 해당하는 경우에 승낙을 하지 않을 수 있다.
가. 다른 사람의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 회사가 정한 이용신청 요건이 미비한 경우
제 3 장 계약 당사자의 의무
제 7 조 (회사의 의무)
회사는 사이트를 안정적이고 지속적으로 운영할 의무가 있다.
회사는 이용자로부터 제기되는 의견이나 불만이 정당하다고 인정될 경우에는 즉시 처리해야 한다. 단, 즉시 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 공지사항 또는 전자우편을 통해 통보해야 한다.
제1항의 경우 수사상의 목적으로 관계기관 및 정보통신윤리위원회의 요청이 있거나 영장 제시가 있는 경우, 기타 관계 법령에 의한 경우는 예외로 한다.
제 8 조 (이용자의 의무)
이용자는 본 약관 및 회사의 공지사항, 사이트 이용안내 등을 숙지하고 준수해야 하며 기타 회사의 업무에 방해되는 행위를 해서는 안된다.
이용자는 회사의 사전 승인 없이 본 사이트를 이용해 어떠한 영리행위도 할 수 없다.
이용자는 본 사이트를 통해 얻는 정보를 회사의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판, 방송 및 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.
제 4 장 서비스의 제공 및 이용
제 9 조 (서비스 이용)
이용자는 본 약관의 규정된 사항을 준수해 사이트를 이용한다.
본 약관에 명시되지 않은 서비스 이용에 관한 사항은 회사가 정해 ‘공지사항’에 게시하거나 또는 별도로 공지하는 내용에 따른다.
제 10 조 (정보의 제공)
회사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보에 대하여 전자메일이나 서신우편 등의 방법으로 회원에게 정보를 제공할 수 있다.


<부칙>
본 약관은 2022년 09월 1일부터 적용한다.
</pre>					
				</div>
				<div class="modal-footer">
					<button onclick="f_check()">닫기</button>
				</div>
		</div>
	</div>
</div>

 
  
<script>
	function f_modalOpen(){
	    mymodal.style.display="block";
	}
	function f_check(){
	    mymodal.style.display="none";
	}

	$(document).on("click", ".privacyPolicy", function() {
		f_modalOpen();
	});

	let header = '${_csrf.headerName}';
	let token =  '${_csrf.token}'; 
	var num;
	var data;
	var result;
	var el;
	var genPassChk = 0;
	var comPassChk = 0;
	var genIDChk = 0;
	var comIDChk = 0;
	var genNickChk = 0;
	var comNickChk = 0;
	var registrationChk = 0;
	
	// ID, 사업자등록번호 확인
	window.onload = function () {
	    genIdChkBtn = document.getElementById("genIdChkBtn");
	    genNickChkBtn = document.getElementById("genNickChkBtn");
	    comIdChkBtn = document.getElementById("comIdChkBtn");
	    comNickChkBtn = document.getElementById("comNickChkBtn");
	    el = document.getElementById("registrationBtn");
	    
	    genIdChkBtn.onclick = function() { memIdChk('gen') }; 
	    genNickChkBtn.onclick = function() { memNickChk('gen') }; 
	    
	    comIdChkBtn.onclick = function() { memIdChk('com') }; 
	    comNickChkBtn.onclick = function() { memNickChk('com') }; 
	    el.onclick = registration;
	}
	
	//닉네임 중복 확인
	function memNickChk(mem) {
		let memNick;
		if(mem=="gen"){
			memNick = $("#genNick").val();
			console.log("gen memID: ",memNick);
		}else if(mem=="com"){
			memNick = $("#comNick").val();
			console.log("com memID: ",memNick);
		}else{
			console.log("다 아니야? memID: ",memNick);
		}
		
		if(memNick==null || memNick.length==0){
			warningAlert("닉네임을 입력해주세요.");
		}else{
			console.log("memNick: ",memNick);
			findNick(memNick,mem);
		}	
	}
	function findNick(memNick,mem) {
		$.ajax({
			type: "POST",
			url: "${cPath}/member/findNick",
			data: {"memNick" : memNick},
			dataType: "JSON",
			beforeSend : function(xhr) { 
				xhr.setRequestHeader(header,token);
			},
			success: function (result) {
	 			if(result){ <%-- 일치하는 Nick가 없으면 --%>
	 				successAlert("사용가능한 닉네임입니다.");
	 				if(mem=="gen"){
	 					genNickChk = 1;
		 				$("#genNickChkBtn").text("");
			    	    $("#genNickChkBtn").append('<img class="registrationImg" src="${cPath}/resources/images/memberForm01.png" style = "width: 30px;">');
	 				}else if(mem=="com"){
			 			comNickChk = 1;
		 				$("#comNickChkBtn").text("");
			    	    $("#comNickChkBtn").append('<img class="registrationImg" src="${cPath}/resources/images/memberForm01.png" style = "width: 30px;">');
	 				}
	 			}else{
	 				warningAlert("중복된 닉네임입니다.");
	 			}
			},
			error: function (e) { 
				console.log("ERROR : ", e);
			}
		});
	}	
	
	
	//아이디 중복 확인
	function memIdChk(mem) {
		let memId;
		if(mem=="gen"){
			memId = $("#genID").val();
			console.log("gen memID: ",memId);
		}else if(mem=="com"){
			memId = $("#comID").val();
			console.log("com memID: ",memId);
		}else{
			console.log("다 아니야? memID: ",memId);
		}
		
		if(memId==null || memId.length==0){
			warningAlert("아이디를 입력해주세요.");
		}else{
			console.log("memId: ",memId);
			findID(memId,mem);
		}	
	}
	function findID(memId,mem) {
		$.ajax({
			type: "POST",
			url: "${cPath}/member/find",
			data: {"memId" : memId},
			dataType: "JSON",
			beforeSend : function(xhr) { 
				xhr.setRequestHeader(header,token);
			},
			success: function (result) {
	 			if(result){ <%-- 일치하는 ID가 없으면 --%>
	 				successAlert("사용가능한 아이디입니다.");
	 				if(mem=="gen"){
			 			genIDChk = 1;
		 				$("#genIdChkBtn").text("");
			    	    $("#genIdChkBtn").append('<img class="registrationImg" src="${cPath}/resources/images/memberForm01.png" style = "width: 30px;">');
	 				}else if(mem=="com"){
			 			comIDChk = 1;
		 				$("#comIdChkBtn").text("");
			    	    $("#comIdChkBtn").append('<img class="registrationImg" src="${cPath}/resources/images/memberForm01.png" style = "width: 30px;">');
	 				}
	 			}else{
	 				warningAlert("중복된 아이디입니다.");
	 			}
			},
			error: function (e) { 
				console.log("ERROR : ", e);
			}
		});
	}	
	
	// 확인 후 아이디,닉네임 수정하면 사진 없어지게
	$(function(){
	    $('#genID').keyup(function(){
	      $('#genIdChkBtn').children().remove();
	      $("#genIdChkBtn").text("확인");
	      genIDChk = 0;
	    });
	    $('#comID').keyup(function(){
	      $('#comIdChkBtn').children().remove();
	      $("#comIdChkBtn").text("확인");
	      comIDChk = 0;
	    });
	});   
	$(function(){
	    $('#genNick').keyup(function(){
	      $('#genNickChkBtn').children().remove();
	      $("#genNickChkBtn").text("확인");
	      genNickChk = 0;
	    });
	    $('#comNick').keyup(function(){
	      $('#comNickChkBtn').children().remove();
	      $("#comNickChkBtn").text("확인");
	      comNickChk = 0;
	    });
	});   
	
	
	// 사업자 등록번호 확인
	function registration(){
		num = $("#registrationNo").val();
		console.log("aa : ",num);
	    data = {
	    	    "b_no": [num]
	    	   };
	    console.log("data : ", data);
	    
	    $.ajax({
	    	  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=h45csCrsEHvT2IgL59tSeVNh5U57KX2N%2FL%2B41l%2FOEQGV1i6zRPk%2BYCL57T3MshWEeEnlAabZyQeqpN%2BPgEBrJw%3D%3D",  // serviceKey 값을 xxxxxx에 입력
	    	  type: "POST",
	    	  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
	    	  dataType: "JSON",
	    	  contentType: "application/json",
	    	  accept: "application/json",
	    	  success: function(result) {
	    	      console.log(result.data[0].b_no);
	    	      console.log(result.data[0].tax_type);
	    	      console.log(result.data[0].b_stt);
	    	      console.log(result);
	    	      
	    	      if(result.data[0].b_stt == null || result.data[0].b_stt == ""){
	    	 	 	  warningAlert("사업자등록번호가<br>조회되지 않았습니다.");
	    	    	  $('#registrationBtn').children().remove();
	    	    	  $("#registrationBtn").text("확인");
	    	    	  registrationChk=0;
	    	      }else{
	    	 	 	  successAlert("사업자등록번호가 <br>확인되었습니다.");
	             	  $("#registrationBtn").text("");
		    	      $("#registrationBtn").append('<img class="registrationImg" src="${cPath}/resources/images/memberForm01.png" style = "width: 30px;">');
		    	      registrationChk=1;
	    	      }
	    	      
	    	  },
	    	  error: function(result) {
	    	      console.log(result.responseText);
	    	      console.log(result.status_code);
	    	  }
	    	});
	}
	
	// 확인 후 사업자등록번호 수정하면 사진 없어지게
	$(function(){
	    $('#registrationNo').keyup(function(){
	    	$('#registrationBtn').children().remove();
	    	$("#registrationBtn").text("확인");
	    	registrationChk=0;
	    });
	});
	
	
	// 비밀번호 일치 여부
	$(function(){
	    $('#genPass').keyup(function(){
	      $('#chkNotice').html('');
	      $('#genPassChk').val('');
	    });
	    $('#comPass').keyup(function(){
	      $('#chkNotice2').html('');
	      $('#comPassChk').val('');
	    });
	
	    $('#genPassChk').keyup(function(){
	        if($('#genPass').val() != $('#genPassChk').val()){
	          $('#chkNotice').html('비밀번호 일치하지 않음');
	          $('#chkNotice').attr('color', '#f82a2aa3');
	          genPassChk = 0;
	        } else{
	          $('#chkNotice').html('비밀번호 일치함');
	          $('#chkNotice').attr('color', '#199894b3');
	          genPassChk = 1;
	        }
	    });
	    $('#comPassChk').keyup(function(){
	        if($('#comPass').val() != $('#comPassChk').val()){
	          $('#chkNotice2').html('비밀번호 일치하지 않음');
	          $('#chkNotice2').attr('color', '#f82a2aa3');
	          comPassChk = 0;
	        } else{
	          $('#chkNotice2').html('비밀번호 일치함');
	          $('#chkNotice2').attr('color', '#199894b3');
	          comPassChk = 1;
	        }
	    });
	});
	
	
	// submit
	function genSubmitCheck() {
		if(genIDChk==0){
			warningAlert("아이디 중복을 확인하세요.");
			return false;
		}
		if(genPassChk==0) {
			warningAlert("비밀번호를 확인하세요.");
			return false;
		 }
		if(genNickChk==0){
			warningAlert("닉네임 중복을 확인하세요.");
			return false;
		}
		let chk = $('#check_box').is(':checked');
		if(!chk){
			warningAlert("약관에 동의해주세요.");
			return false;
		}
		 return true
	}
	function comSubmitCheck() {
		if(comIDChk==0){
			warningAlert("아이디 중복확인을 해주세요.");
			return false;
		}
		if(comPassChk==0) {
			warningAlert("비밀번호를 확인하세요.");
			return false;
		 }
		if(comNickChk==0){
			warningAlert("닉네임 중복을 확인하세요.");
			return false;
		}
		if(registrationChk==0) {
			warningAlert("사업자등록번호를 확인하세요.");
			return false;
		}
		let chk = $('#check_box2').is(':checked');
		if(!chk){
			warningAlert("약관에 동의해주세요.");
			return false;
		}
		 return true
	}
	
	// alert
	function warningAlert(msg) {
		Swal.fire({ 
	         icon: 'warning',
	         title: msg
	     });
	}
	function successAlert(msg) {
		Swal.fire({ 
	         icon: 'success',
	         title: msg
	     });
	}
	

</script>

    <!-- 자동생성 -->
  <script>
    function check1(f){
      if (f.checked) {
        $('#comID').val('DDITORKR');
		$('#comPass').val('java123!');
		$('#comPassChk').val('java123!');
		$('#comName').val('DDITNANME');
		$('#comNick').val('DDITNICK');
		$('#comMail').val('DDIT@naver.com');
		$('#comHp').val('010-1234-1234');
		$('#comComname').val('대덕인재개발원');
		$('#comComtel').val('010-3456-2345');
		$('#comComceo').val('신창규');
		$('#registrationNo').val('6048802040');
		$('#comOpendate').val('1996-07-04');
      } else{
      $('#genID').val('');
        }
      }
    </script>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자     		   수정내용
* ----------  ---------  -----------------
* 2022. 8. 26.  조채원       	  최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
	
<div id="contract" class="ptb ptb-xs-60 page-signin">
	<div class="container">
		<div class="row">
			<div class="main-body" style="max-width: 1000px">
				<div class="card bg-white">
					<div class="pdf-content padding-20" style="margin: 30px">
						<!-- height:1223px; -->
						<section class="logo text-center">
							<h2>${map.contract.contractName }</h2>
							<p style="display: none" id="contractId">${map.contract.contractId }</p>
						</section>
						<br>
						<br>

						<div class="text-content mt-20"
							style="margin-right: 10px; margin-left: 10px;">
							<div class="row">
								<p class="comMember"></p>
								<p>
									<strong> ${map.comId }</strong> (이하“갑”이라 한다.)와 <strong>${map.genId }</strong>
									(이하“을”이라한다.)은 계약건명에 명시된 업무작업을 수행하기 위해 다음과 같이 계약을 체결한다.
								</p>
							</div>
						</div>
<!-- 						<br> -->

						<div class="text-content mt-20">
							<strong>제1조【 목 적 】</strong><br>
							<p>본 계약은 “갑”이 “을”에게 의뢰한 000의 업무를 “갑”에게 공급함에 있어 “갑”과 “을”사이에
								필요한 사항을 정하는 것을 목적으로 한다.</p>
						</div>
<!-- 						<br> -->

						<div class="text-content mt-20">
							<strong>제2조【 계 약 기 간 】</strong><br>
<!-- 							<div class="row"> -->
								<p>
									계약 기간은 <strong>${map.contract.contractSdate }</strong>로부터 
									<strong>${map.contract.contractFdate }</strong>까지로 하며, 갑과 을의 합의 하에 본 계약기간은 연장 될 수 있다.
								</p>
<!-- 							</div> -->
						</div>
<!-- 						<br> -->

						<div class="text-content mt-20">
							<strong>제3조【 계 약 금 액 】</strong><br>
							<p>
								총 계약금액은 <strong>${contract.contractPay }</strong>만원으로 하며 “갑”은
								“을”에게 지급하기로 한다.
							</p>
<!-- 							<br> -->
<!-- 							<div class="row"> -->
								<p>단, 회사업무 수행을 위한 출장 등이 발생할 경우에는 “갑”이 그 비용을 지급하고, 식대 등은 “을”의
									비용으로 한다.</p>
<!-- 							</div> -->
						</div>
<!-- 						<br> -->


						<div class="text-content mt-20">
							<strong>제4조【 납 품 】</strong><br>
							<p>“을”은 작업 진행중 중간 완료된 성과물을 매월 일 등 회에 걸쳐 중간 납품을 하며, 최종 자료는 검토
								및 수정 후 완성품으로 납품하기로 한다.</p>
						</div>
<!-- 						<br> -->

						<div class="text-content mt-20">
							<strong>제5조【 비 밀 유 지 】</strong><br>
							<p>“을”은 본 작업과 관련된 어떠한 일체의 정보를 외부에 누설하거나 유출해서는 안되며 이로 인해 발생하는
								모든 책임은 “을”이 진다.</p>
						</div>
<!-- 						<br> -->

						<div class="text-content mt-20">
							<strong>제6조【 자 료 제 공 】</strong><br>
							<p>“갑”은 “을”이 작업을 수행하는데 필요한 일체의 자료를 제공하기로 한다.</p>
						</div>
<!-- 						<br> -->


						<div class="text-content mt-20">
							<strong>제8조【 해 지 】</strong><br>
							<p>(1) 본 계약상의 업무를 수행하기 위해 출근 등과 관련된 사항은 자유로 한다.</p>
							<p>(2) 본 계약 내용 외에도 다른 필요한 업무가 필요한 경우 “갑”은 “을”이 추가로 작업을 수행하는
								부분에 대한 인건비와 계약 기간은 상호 협의 하에 결정한다.</p>
						</div>
<!-- 						<br> -->

						<div class="text-content mt-20">
							<strong>제7조【 근 무 조 건 】</strong><br>
							<p>“을”의 귀책사유로 인하여 본 계약이 불이행이 되었을 경우 “을”은 “갑”이 제시한 손해배상의 책임을 진다.</p>
						</div>
<!-- 						<br> -->

						<div class="text-content mt-20">
							<strong>제9조【 손 해 배 상 】</strong><br>
							<p>(1) 본 계약상의 업무를 수행하기 위해 출근 등과 관련된 사항은 자유로 한다.</p>
							<p>(2) 본 계약 내용 외에도 다른 필요한 업무가 필요한 경우 “갑”은 “을”이 추가로 작업을 수행하는
								부분에 대한 인건비와 계약 기간은 상호 협의 하에 결정한다.</p>
						</div>
						<br>
						<br>
						<div class="text-content mt-20" style="text-align: center;">
							<h6>${map.contract.contractSdate }</h6>
							<div style="color: gray;" style="margin-left:30px">
						 &#42;계약서 작성일은 계약시작일과 같습니다
						</div>
						</div>
<!-- 						<br> -->
						<div class="text-box text-right text-xs-left  pr-70 pr-xs-0 mt-xs-15 width-75per fl" id="sign" style="float: right">

							<security:authentication property="principal" var="authMember" />
							<c:set var="role" value="${authMember.realMember.memType.get(0) }" />
							<!-- 기업회원 서명 div -->
							<div class="about-block gray-bg mb-60 padding-20 clearfix" style="background: white; margin-bottom: 10px;">
								<!-- 이미 서명한 기업회원 서명 div -->
								<div class="fr width-25per comImg" style="display:none">
									<c:if test="${map.contract.contractState eq 'SIGN' && role eq 'ROLE_COMMEM' && authMember.realMember.comId eq map.comId}">
										<img src="data:image/jpeg;base64,${map.contract.contractComsign }"
											width="200" height="100" alt="com_sign" id="saveComSign">
										<button id="btn-modify">수정</button>
									</c:if>
								</div>
								<!-- 계약 완료 되었거나 일반회원이 로그인 했을 때 div -->
									<div class="fr width-25per concludeDiv">
								<c:if test="${map.contract.contractState eq 'CONCLUDE' || (role eq 'ROLE_GENMEM' && authMember.realMember.genId eq map.genId)}">
										<c:if test="${not empty map.contract.contractComsign }">
											<img src="data:image/jpeg;base64,${map.contract.contractComsign }" width="200" height="100" alt="com_sign">
										</c:if>
								</c:if>
									</div>
									<!-- 기존 서명 불러오기 했을 때 div -->
									<div class="fr width-25per lastSign" style="display: none">
										<c:if test="${map.contract.contractState ne 'CONCLUDE' && not empty map.contract.comSign && role eq 'ROLE_COMMEM' && authMember.realMember.comId eq map.comId}">
											<img src="data:image/jpeg;base64,${map.contract.comSign }"
												width="200" height="100" id="com_sign">
												<button id="btn-modify">수정</button>
											<button id="btn-lastSignSave">저장</button>
										</c:if>
									</div>
								<!-- 기존 서명 불러오기 div -->
								<div class="text-box text-right text-xs-left  pr-70 pr-xs-0 mt-xs-15 width-75per fl loadDiv" style="padding-right: 10px">
									<div class="box-title mb-20">
										<h4 style="margin-top: 40px;">(갑) ${map.comId }</h4>
										<c:if test="${map.contract.contractState ne 'CONCLUDE' && not empty map.contract.comSign && role eq 'ROLE_COMMEM' && authMember.realMember.comId eq map.comId}">
											<button id="btn-load">기존서명 불러오기</button>
										</c:if>
									</div>
								</div>
							</div>
							
							<!-- 일반회원 서명 div -->
							<div class="about-block gray-bg mb-60 padding-20 clearfix" style="background: white; ">
								<!-- 이미 서명한 일반회원 서명 div -->
								<div class="fr width-25per genImg" style="display:none">
									<c:if test="${map.contract.contractState eq 'SIGN' &&  role eq 'ROLE_GENMEM' && authMember.realMember.genId eq map.genId}">
										<img src="data:image/jpeg;base64,${map.contract.contractGensign }"
											width="200" height="100" alt="gen_sign" id="saveGenSign">
										<button id="btn-modify">수정</button>
									</c:if>
								</div>
								<!-- 계약 완료 되었거나 기업회원이 로그인 했을 때 div -->
								<c:if test="${map.contract.contractState eq 'CONCLUDE' || (role eq 'ROLE_COMMEM' && authMember.realMember.comId eq map.comId)}">
									<div class="fr width-25per">
										<c:if test="${not empty map.contract.contractGensign }">
											<img src="data:image/jpeg;base64,${map.contract.contractGensign }" width="200" height="100" alt="gen_sign">
											</c:if>
									</div>
									</c:if>
									<!-- 기존 서명 불러오기 했을 때 div -->
									<div class="fr width-25per lastSign" style="display: none">
										<c:if test="${map.contract.contractState ne 'CONCLUDE' && not empty map.contract.genSign && role eq 'ROLE_GENMEM' && authMember.realMember.genId eq map.genId}">
											<img src="data:image/jpeg;base64,${map.contract.genSign }"
												width="200" height="100" id="gen_sign">
												<button id="btn-modify">수정</button>
											<button id="btn-lastSignSave">저장</button>
										</c:if>
									</div>
								<!-- 기존 서명 불러오기 div -->
								<div class="text-box text-right text-xs-left  pr-70 pr-xs-0 mt-xs-15 width-75per fl" style="padding-right: 10px">
									<div class="box-title mb-20">
										<h4 style="margin-top: 40px;" id="genId">(을) ${map.genId }</h4>
										<c:if test="${map.contract.contractState ne 'CONCLUDE' && not empty map.contract.genSign && role eq 'ROLE_GENMEM' && authMember.realMember.genId eq map.genId}">
											<button id="btn-load">기존서명 불러오기</button>
										</c:if>
									</div>
								</div>
							</div>

					
							<p id="role" style="display: none">${authMember.realMember.memType.get(0) }</p>
							<p id="genState" style="display:none">${map.contract.contractGenstate }</p>
							<p id="comState" style="display:none">${map.contract.contractComstate }</p>
							<!-- 일반회원 서명 입력 div -->
							<c:if test="${role eq 'ROLE_GENMEM' && authMember.realMember.genId eq map.genId && map.contract.contractState ne 'CONCLUDE'}">
								<div class="about-block gray-bg mb-60 padding-20 clearfix genSignPad newSign" style="background: white" >
									<div class="fr width-25per">
										<div>
											<canvas id="canvas" width="200" height="100" style="border: 1px solid black"></canvas>
										</div>
										<button id="btn-clear">삭제</button>
										<button id="btn-save">저장</button>
									</div>
									<div class="text-box text-right text-xs-left  pr-70 pr-xs-0 mt-xs-15 width-75per fl" style="padding-right: 10px">
										<div class="box-title mb-20">
											<h4 style="margin-top:40px" id="genId">${map.genId } 서명</h4>
										</div>
									</div>
								</div>
							</c:if>
							<!-- 기업회원 서명 입력 div -->
							<c:if test="${role eq 'ROLE_COMMEM' && authMember.realMember.comId eq map.comId && map.contract.contractState ne 'CONCLUDE' }">
								<div class="about-block gray-bg mb-60 padding-20 clearfix comSignPad newSign" style="background: white">
									<div class="fr width-25per">
										<div>
											<canvas id="canvas" width="200" height="100" style="border: 1px solid black"></canvas>
										</div>
										<button id="btn-clear">삭제</button>
										<button id="btn-save">저장</button>
									</div>
									<div class="text-box text-right text-xs-left  pr-70 pr-xs-0 mt-xs-15 width-75per fl" style="padding-right: 10px">
										<div class="box-title mb-20">
											<h4 style="margin-top: 40px;" id="comId">${map.comId } 서명</h4>
										</div>
									</div>
								</div>
							</c:if>
						</div>
						<div>
							<ul class="widget-tag pt-15" style="float:right; margin-right: -30px; margin-top: -50px; list-style:none">
							<c:if test="${role eq 'ROLE_COMMEM' && authMember.realMember.comId eq map.comId}">
				              <li> <a href='${cPath }/outsourcing/apply/${map.contract.contractApplyid}'>지원자 확인으로 돌아가기</a> </li>
				             </c:if>
				              <li> <a href='${cPath }/myinfo/contract/project'>계약 중인 프로젝트로 돌아가기</a> </li>
				            </ul>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<button class="btn-text" type="button" id="download" name="button" onclick="getPDF();" style="float: right; margin-right:70px; margin-bottom: 20px"><i class="fa fa-file-pdf-o"></i> PDF로 저장 </button>
<c:if test="${role eq 'ROLE_COMMEM' && authMember.realMember.comId eq map.comId && map.contract.contractState ne 'CONTRACT' && not empty map.contract.contractComsign && not empty map.contract.contractGensign}">
<button class="btn-text" type="button" id="btn-conclude" name="button"style="float: right; margin-right:70px; margin-bottom: 20px">계약종료 </button>
</c:if>
 
<script>

function signSuccess() {
	Swal.fire({
	      icon: 'success',
	      title: '해당 계약에 대한 서명을 완료했습니다.',
	    });
}

function conclude() {
	Swal.fire({
	      icon: 'success',
	      title: '해당 계약을 종료했습니다.',
	    });
}


var header = '${_csrf.headerName}';
var token =  '${_csrf.token}'; 

let contractName = '${map.contract.contractName }';
let contractId  = $("#contractId").text();
let divTag = null;

var pos = {
    drawable: false,
    x: -1,
    y: -1
};
var canvas, context;
 
canvas = document.getElementById("canvas");
context = canvas.getContext("2d");
 
canvas.addEventListener("mousedown", commonListener);
canvas.addEventListener("mousemove", commonListener);
canvas.addEventListener("mouseup", commonListener);
canvas.addEventListener("mouseout", commonListener);

 
function commonListener(event){
    switch(event.type){
        case "mousedown":
            initDraw(event);
            break;
 
        case "mousemove":
            if(pos.drawable) //클릭상태인지 확인
                draw(event);
            break;
 
        case "mouseout":
        case "mouseup":
            finishDraw();
            break;
    }
}

  
function initDraw(event){
    context.beginPath(); //새로운 경로 지정
    pos.drawable = true;
    var coors = getPosition(event);
    pos.X = coors.X;
    pos.Y = coors.Y;
    context.moveTo(pos.X, pos.Y);
}
 
function draw(event){
    var coors = getPosition(event);
    context.lineTo(coors.X, coors.Y);
    pos.X = coors.X;
    pos.Y = coors.Y;
    context.stroke();
}
 
function finishDraw(){
    pos.drawable = false;
    pos.X = -1;
    pos.Y = -1;
}
 
function getPosition(event){
	//pageX 문서높이 기준
    //clienX 보이는 화면 기준
    var v_left = canvas.getBoundingClientRect().left;
    var v_top =canvas.getBoundingClientRect().top;

    var x = event.clientX - v_left;
    var y = event.clientY - v_top;

    return {X: x, Y: y};
}

/* 기업회원이 계약 종료 버튼을 클릭 */
$("#btn-conclude").on("click",function() {
	$.ajax({
		url : "${cPath}/outsourcing/contract/conclude/" + contractId,
		method : "get",
		contentType: 'application/json; charset=utf-8',
		dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
		,
		beforeSend : function(xhr)
		{
		   xhr.setRequestHeader(header,token);
		},
		success : function(resp, status, jqXHR) {
			let contract = resp;
			if(resp) {
				$("#btn-conclude").hide();
				$("#btn-modify").hide();
				$("#btn-load").hide();
				conclude();
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	}); 	 
});

$(document).ready(function() {
    let genState = $("#genState").text();
    let comState = $("#comState").text();
    let role = $("#role").text();
    
    if(genState == 0 && role == "ROLE_GENMEM") {
    	$(".genSignPad" && role == "ROLE_COMMEM").show();
    } else if(genState == 1 ) {
    	$(".genSignPad").hide();
    	$(".genImg").show();
    }
    if(comState == 0 && role == "ROLE_COMMEM") {
    	$(".comSignPad").show();
    } else if(comState == 1) {
    	$(".comSignPad").hide();
    	$(".comImg").show();
    }
});
 

/* 기존 서명 불러오기 버튼 클릭 */
$(document).on("click", "#btn-load", function() {
	$(".lastSign").show();
	$(".genImg").hide();
	$(".comImg").hide();
	$(".newSign").hide();
});

/* 수정 버튼 클릭 */
$(document).on("click", "#btn-modify", function() {
	$(".newSign").show();
	$(this).closest(".fr").hide();
	$(".lastSign").hide();
});


	/* 캔버스 초기화 */
	$("#btn-clear").on("click", function() {
		context.clearRect(0, 0, canvas.width, canvas.height);
		context.beginPath();
	});
	
	
	/* 서명 그리고 저장할 경우 */
	$("#btn-save").on("click", function() {
	    
	 	 // Convert canvas to dataURL and log to console
	    divTag = $(this).closest(".clearfix");
	    const dataURL = canvas.toDataURL();
	    const sign = getBase64StringFromDataURL(dataURL);
	    console.log("새로 그린 서명: " + sign);
	    if($("#role").text() == 'ROLE_GENMEM') {
	    	genSubmit(sign);
	    } else if($("#role").text() == 'ROLE_COMMEM') {
	    	comSubmit(sign);
	    }
	      
	});
	
	/* 기존 서명 불러와서 저장할 경우 */
	$("#btn-lastSignSave").on("click", function() {
		let img = $(this).siblings("img").attr("src");
		console.log("img: " + img);
		let baseStr = "data:image/jpeg;base64,";
		let sign = img.substr(baseStr.length, img.length);
		console.log("기존 서명: " + sign);
		if($("#role").text() == 'ROLE_GENMEM') {
	    	genSubmit(sign);
	    } else if($("#role").text() == 'ROLE_COMMEM') {
	    	comSubmit(sign);
	    }
	});
	
	/* 일반회원 서명 저장 */
	function genSubmit(sign) {
		let memId = $("#genId").text().split(" ", 2).toString().substr(4);
	    let contractGensign = sign;
		console.log("submit: " + contractGensign);
		console.log("contractId: " + contractId);
	    $.ajax({
			url : "${cPath}/outsourcing/contract/gen/" + contractId,
			method : "post",
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify({
				contractId : contractId,
	    		memId : memId,
	    		contractGensign : contractGensign
			}),
			dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
			,
			beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
			success : function(resp, status, jqXHR) {
				let contract = resp;
				console.log("contract: " + contract.genSign);
				$(".genImg").show();
				$(".genImg").empty();
				$(".newSign").hide();
				$(".lastSign").hide();
				const image = document.createElement('img');
				image.src = "data:image/jpeg;base64," + contract.contractGensign;
				console.log("sign:" + contract.genSign);
				image.height = canvas.height;
				image.width = canvas.width;
				image.style.display = 'block';
				$(".genImg").append(image);
				let button = '<button id="btn-modify">수정</button>';
				$(".genImg").append(button);
				context.clearRect(0, 0, canvas.width, canvas.height);
				context.beginPath();
				divTag.hide();
				signSuccess();
				send("[아웃소싱계약]" + "상대방이 서명을 완료했습니다. 계약을 종료해주세요.",contractRegist,"/outsourcing/contract/" + contract.contractId + "");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		}); 	 
	}
	
	/* 기업회원 서명 저장 */
	function comSubmit(sign) {
		let memId = $("#comId").text().split(" ", 1).toString();
		let contractComsign = sign;
		let genId = $("#genId").text();
		
		$.ajax({
			url : "${cPath}/outsourcing/contract/com/" + contractId,
			method : "post",
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify({
				contractId : contractId,
				memId : memId,
				contractComsign : contractComsign
			}),
			dataType : "json" 
			,
			beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
			success : function(resp, status, jqXHR) {
				let contract = resp;
				$(".comImg").show();
				$(".comImg").empty();
				$(".newSign").hide();
				$(".lastSign").hide();
				const image = document.createElement('img');
				image.src = "data:image/jpeg;base64," + contract.contractComsign;
				console.log("sign:" + contract.comSign);
				image.height = canvas.height;
				image.width = canvas.width;
				image.style.display = 'block';
				$(".comImg").append(image);
				let button = '<button id="btn-modify">수정</button>';
				$(".comImg").append(button);
				context.clearRect(0, 0, canvas.width, canvas.height);
				context.beginPath();
				divTag.hide();
				signSuccess();
				send("[아웃소싱계약]" + "새로운 계약이 생성되었습니다.",genId,"/outsourcing/contract/" + contract.contractId + "");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		}); 	
	}
	
	/* url을 base64로 인코딩 */
	const getBase64StringFromDataURL = (dataURL) =>
    dataURL.replace('data:', '').replace(/^.+,/, ''); 

    
     /* 계약서를 pdf로 저장 */
    function getPDF(){

		var HTML_Width = $(".card").width();
		var HTML_Height = $(".card").height();
		var top_left_margin = 0;
		var PDF_Width = HTML_Width+(top_left_margin*2);
		var PDF_Height = (PDF_Width*1.5)+(top_left_margin*2);
		var canvas_image_width = HTML_Width;
		var canvas_image_height = HTML_Height;
		
		var totalPDFPages = Math.ceil(HTML_Height/PDF_Height)-1;

		html2canvas($(".pdf-content")[0]).then(function(rst) { //,{allowTaint:true}
			rst.getContext('2d');

			var pdf = new jsPDF('p', 'pt',  [PDF_Width, PDF_Height]);
			
			console.log(rst.height+"  "+rst.width);
			
			
			var imgData = rst.toDataURL("image/jpeg", 1.0);
// 			var pdf = new jsPDF('p', 'mm',  'a4'); //작게나옴

			pdf.addImage(imgData, 'JPG', top_left_margin, top_left_margin,canvas_image_width,canvas_image_height);
			
			
			for (var i = 1; i <= totalPDFPages; i++) { 
				pdf.addPage(PDF_Width, PDF_Height);
				pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
			}
			
// 		    pdf.save("aa.pdf");
		    pdf.save(contractName+"_계약서.pdf"); //계약명으로 파일 저장
        });
	};
	</script>


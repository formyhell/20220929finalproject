`<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

 
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<!--   <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="http://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>
<style>
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
	th{
		width: 115px;
	}
	<%-- 첨부파일 --%>
.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}
.filebox input[type="file"] { 
     position: absolute; 
     width: 0; 
     height: 0; 
     padding: 0; 
     overflow: hidden; 
     border: 0; 
} 

#cardBody{
	height: 800px;
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

  <!-- 프로젝트 입력 폼 --> 
  
  
<%--   <form:form modelAttribute="outProj" method="post" action="${cPath }/outsourcing"> --%>
<%--   <security:csrfInput/> --%>
  <!--  @@@@@@@@@@@@@@@@@@@@@@@@@@@   -->
  
  
  
  
  
  <div class="container">
            <div class="row">
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header">
                  	<h5> 프로젝트 등록<input type="checkbox" name="checkbox" id="checkbox" onchange="check1(this)"></h5>
                  	
                  </div>
					<form:form id="insertFormId" name="insertFormId" modelAttribute="outProj" method="post" action="${cPath }/outsourcing/insert" enctype="multipart/form-data">
  					<security:csrfInput/>
					 <table class="table">
						
						<tr>
							<th>프로젝트 제목</th>
							<td>
								<form:input path="projTitle" required="required" />
								<form:errors path="projTitle" element="span" cssClass="error"/> 
							</td>
<!-- 						</tr> -->
			
						
<!-- 						<tr> -->
							<th>고용 형태</th>
							<td>
								<select id="projEmptype" name="projEmptype">
									<option value="">선택</option>
									<option value="IN">외주(도급)</option>
									<option value="OUT">상주(기간제)</option>
								</select>
								<form:errors path="projEmptype" element="span" cssClass="error"/> 
							</td>
						</tr>
						
						<tr>
							<th>프로젝트 분류</th>
							<td>
								<form:input placeholder="ex)신규개발,유지보수" path="projType" required="required" />
								<form:errors path="projType" element="span" cssClass="error"/> 
							</td>
<!-- 						</tr> -->
						
						
<!-- 						<tr> --> 
							<th>모집마감일</th>
							<td>
								<form:input  type="date" path="projRecruitfdate" required="required" />
								<form:errors path="projRecruitfdate" element="span" cssClass="error"/>
							</td>
						</tr>
						
						
						<tr>
							<th>기획상태</th>
							<td>
								<form:input path="projPlanstate" required="required" />
								<form:errors path="projPlanstate" element="span" cssClass="error"/>
							</td>
<!-- 						</tr> -->
						
						
<!-- 						<tr> -->
							<th>모집인원</th>
							<td>
								<form:input path="projMemnum" required="required" placeholder="숫자만 입력해 주세요"/>
								<form:errors path="projMemnum" element="span" cssClass="error"/>
							</td>
						</tr>
						
						
						<tr>
							<th>예상 시작일</th>
							<td>
								<form:input  type="date" path="projSdate" required="required" />
								<form:errors path="projSdate" element="span" cssClass="error"/> 
							</td>
<!-- 						</tr> -->
						
						
<!-- 						<tr> -->
							<th>예상 종료일</th>
							<td>
								<form:input  type="date" path="projFdate" required="required"/>
								<form:errors path="projFdate" element="span" cssClass="error"/> 
							</td>
						</tr>
						
						
						<tr>
							<th>프로젝트 비용</th>
							<td>
								<form:input id="projPayId" path="projEstimate" required="required"/>
								<form:errors path="projEstimate" element="span" cssClass="error"/>
							</td>
<!-- 						</tr> -->
						
						
						
						
<!-- 						<tr> -->
							<th>프로젝트 지역</th>
							<td>
								<form:select path="projLoc" class="">
								<c:if test="${not empty outLocList}">
			                       	<c:forEach items="${outLocList}" var="loc">
										<form:option value="${loc.codeName }">${loc.codeName }</form:option>
									</c:forEach>
								</c:if>
								</form:select>
								<form:errors path="projLoc" element="span" cssClass="error"/> 
							</td>
							
						</tr>
						
						
						<tr>
							<th>모집요건</th>
							<td colspan="3">
								<form:textarea path="projQualifi" required="required" style="height: 200px; width: 777px;"
								placeholder="도박/마약등 불법 관련 글은 관리자에 의해 삭제될 수 있습니다"/>
								<form:errors path="projQualifi" element="span" cssClass="error"/> 
							</td>
<!-- 						</tr> -->


<!-- 						<tr> -->
							<th></th>
							<td>
							</td>
						</tr>

						
						<tr>
							<th>업무내용</th>
							<td colspan="3">
								<form:textarea path="projContent" required="required" style="height: 200px; width: 777px;" 
								placeholder="도박/마약등 불법 관련 글은 관리자에 의해 삭제될 수 있습니다"/>
								<form:errors path="projContent" element="span" cssClass="error"/> 
							</td>
						</tr>

						
						<tr>
							<th>직무분야</th>
							<td colspan="3">
							
							
									<div class="col-sm-9">
											<input type="text" id="searchObj" class="form-control"/> <p>전체 리스트를 확인하려면 *을 입력하세요</p>
											<div id="objForm"></div> 
											<form:input path="projObj" type="hidden"/>
										
									</div>
							
							</td>
							
							
						</tr>
						
						
						
						<tr>
							<th>필요 기술</th>
							<td colspan="3">
									
								<div class="col-sm-9">
									<input type="text" id="searchSkill" class="form-control"  /> <p>전체 리스트를 확인하려면 *을 입력하세요</p>
									<div id="skillForm"></div> 
									<form:input path="projSkill" type="hidden"/>
								</div>
							</td>
						</tr>
						
						
						<tr>
							<th>첨부파일</th>
							<td colspan="3">
<!-- 								<div class="col-sm-9"> -->
									<div class="filebox">
										 <input class="upload-name" value="첨부파일" placeholder="첨부파일">
										    <label for="file" class="btn btn-outline-primary ms-2"><i data-feather="upload"></i>Upload</label> 
										    <form:input type="file" id="file" path="outProjFiles" multiple="true" />
<%-- 										    <form:errors path="outProjFiles" element="span" cssClass="error"/> --%>
<!-- 								</div> -->
									</div>
							</td>
						</tr>
						
						
						
						<tr>
							<td colspan="4">
								<p style="text-align: right; font-size:8pt; color: red;">프로젝트 저장버튼 클릭시 바로 결제창으로 이동합니다</p>
								<input type="reset" value="취소" class="btn btn-warning" style="float: right;"/>
								<input type="button" value="저장" class="btn btn-primary" onclick="pay()" style="float: right;"/>
<!-- 								<input type="submit" value="저장" class="btn btn-primary" style="float: right;"/> -->
							</td>
						</tr>
					</table>
					</form:form>
				 </div>
              </div>
           	</div>
</div>
  
  
  
  

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}'; 

let url = "${cPath }/outsourcing/form/code";


$('#searchObj').autocomplete({
	source : function(request, response) { //source: 입력시 보일 목록
		$.ajax({
 			type : 'get'
 			, url : url
 			, dataType : "json"
 			, success : function(data) {
 				console.log("data",data);
 				
 				response(
 		        	$.map(data.jobField, function(item) {
 		        		 if(request.term == "*" || item.codeName.indexOf(request.term) != -1){
 		        	       	return {
 		        	      	     label : item.codeName    	// 목록에 표시되는 값
 		        	             , value : item.codeName 		// 선택 시 input창에 표시되는 값
 		        	             , idx : item.codeId // index
 		        	       	};
 		        	  	 }
 		        	   })
 		        );
 			} 				
			, error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);
			}
		})
	}
	,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
	}
	,minLength: 1// 최소 글자수
	,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
	,delay: 100	//autocomplete 딜레이 시간(ms)
	,select : function(evt, ui) { 
      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, label/value/idx를 가짐
			console.log("ck1:",ui.item.label);
			console.log("ck2:",ui.item.idx);
			//중복체크
			let spanTags = document.querySelector("#objForm").children;
			for(let i=0; i< spanTags.length; i++){
				if(spanTags[i].innerHTML == ui.item.label){
					//alert("같은게 있어용");
					return;       // 그냥 종료
				}
			}
			
			
			$("#objForm").append( //선택한 항목 보여줌 //PfObjVO의 objCode에 저장
					$("<span>").attr("id", ui.item.idx).text(ui.item.label)
								.addClass("font-light badge badge-primary m-5 p-1")
			);
			if($("#projObj").val() != ""){ 
				$("#projObj").val($("#projObj").val() + "," + ui.item.idx);				
			} else { //없으면 그냥 저장
				$("#projObj").val(ui.item.idx);				
			}
			
			
			// ===== 클릭 시 입력한 값 제외(insert) =====
			$("#objForm").off("click"); //클릭 한 번만 작동
			$("#objForm").on("click", "span", function() {
				var target = $(this).attr('id');
				var list = $("#projObj").val().split(',');
				var value = '';
				var cnt = 0;
				$.each(list, function(i, v){
					if(v != target){
						if(cnt > 0){
							value += ',';
						}
						value += v;
						cnt ++;
					}
				});
				$("#projObj").val(value);
				
				
				$(this).remove();
				
				let rst = $("#projObj").val();
				
				console.log(rst);
				console.log("----구분용----")
				
			})
			$("#searchObj").val('');
// 			$("#searchObj")[0].reset();
// 			document.getElementById("#searchObj").value = ('');
			
	 }
});

$( "#searchSkill" ).autocomplete({
	source : function(request, response) { //source: 입력시 보일 목록
		$.ajax({
 			type : 'get'
 			, url : "${cPath }/outsourcing/form/code"
 			, dataType : "json"
//  			, async : true
 			, success : function(data) {
 				console.log("data",data);
 				
 				response(
 		        	$.map(data.skill, function(item) {
 		        		 if(request.term == "*" || item.codeName.indexOf(request.term) != -1){
 		        	       	return {
 		        	      	     label : item.codeName    	// 목록에 표시되는 값
 		        	             , value : item.codeName 		// 선택 시 input창에 표시되는 값
 		        	             , idx : item.codeId // index
 		        	       	};
 		        	  	 }
 		        	   })
				);
			} 				
			, error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);
			}
		})
	}
	,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
	}
	,minLength: 1// 최소 글자수
	,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
	,delay: 100	//autocomplete 딜레이 시간(ms)
	,select : function(evt, ui) { 
			//중복체크
			let spanTags = document.querySelector("#skillForm").children;
			for(let i=0; i< spanTags.length; i++){
				if(spanTags[i].innerHTML == ui.item.label){
					//alert("같은게 있어용");
					return;       // 그냥 종료
				}
			}
			
			$("#skillForm").append( //선택한 항목 보여줌 //PfObjVO의 objCode에 저장
				$("<span>").attr("id", ui.item.idx).text(ui.item.label)
							.addClass("font-light badge badge-dark m-5 p-1")
			)
			
			
			if($("#projSkill").val() != ""){
				$("#projSkill").val($("#projSkill").val() + "," + ui.item.idx);				
			} else {
				$("#projSkill").val(ui.item.idx);				
			}
			
			// === span 클릭 시 리스트에서 제외 ===
			$("#skillForm").off("click"); //클릭 한 번만 작동
			$("#skillForm").on("click", "span", function() {
				var target = $(this).attr('id');
				var list = $("#projSkill").val().split(',');
				var value = '';
				var cnt = 0;
				$.each(list, function(i, v){
					if(v != target){
						if(cnt > 0){
							value += ',';
						}
						value += v;
						cnt ++;
					}
				});
				$("#projSkill").val(value);
				
				
				$(this).remove();
				
				let rst = $("#projSkill").val();
				
				console.log(rst);
				console.log("----구분용----")
			})
	 }
	
	

});

<%-- 파일 이름 --%>
$("#file").on("change",function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName.substr(12));
	});
<%-- 첨부파일 삭제 --%>
let boardForm = $(".yu_div_css").on("click", ".delBtn", function(event){
	  let attNo = $(this).data("attNo");
	  console.log(attNo);
	  console.log($(this));
	  
		let inputTag = $("<input>").attr({
							type:"hidden"
							, name:"delAttNos"
						}).attr('value',attNo);

		boardForm.prepend(inputTag);
		
		console.log($(this).parents("span:first"));
		
		$(this).parents("span:first").hide();
	});



<%-- 결제 api --%>
function pay() {
	
	insertForm = document.insertFormId;
	if(insertForm.projTitle.value=="" || insertForm.projEmptype.value=="" || insertForm.projType.value=="" || insertForm.projRecruitfdate.value=="" || insertForm.projPlanstate.value=="" || 
			insertForm.projMemnum.value=="" || insertForm.projSdate.value=="" || insertForm.projFdate.value=="" || insertForm.projEstimate.value=="" || 
			insertForm.projQualifi.html=="" || insertForm.projLoc.value=="" || insertForm.projContent.value=="" || insertForm.projObj.value=="" || 
			insertForm.projSkill.value==""){
		if(insertForm.projTitle.value==""){
			alert("프로젝트 제목란이 비어있습니다. 확인해주세요")
			return insertForm.projTitle.focus();
		}else if(insertForm.projEmptype.value==""){
			alert("고용형태란이 비어있습니다. 확인해주세요")
			return insertForm.projEmptype.focus();
		}else if(insertForm.projType.value==""){
			alert("프로젝트 분류란이 비어있습니다. 확인해주세요")
			return insertForm.projType.focus();
		}else if(insertForm.projRecruitfdate.value==""){
			alert("모집 마감일란이 비어있습니다. 확인해주세요")
			return insertForm.projRecruitfdate.focus();
		}else if(insertForm.projPlanstate.value==""){
			alert("기획 상태란이 비어있습니다. 확인해주세요")
			return insertForm.projPlanstate.focus();
		}else if(insertForm.projMemnum.value==""){
			alert("모집 인원란이 비어있습니다. 확인해주세요")
			return insertForm.projMemnum.focus();
		}else if(insertForm.projSdate.value==""){
			alert("예상 시작일란이 비어있습니다. 확인해주세요")
			return insertForm.projSdate.focus();
		}else if(insertForm.projFdate.value==""){
			alert("예상 종료일란이 비어있습니다. 확인해주세요")
			return insertForm.projFdate.focus();
		}else if(insertForm.projEstimate.value==""){
			alert("프로젝트 비용란이 비어있습니다. 확인해주세요")
			return insertForm.projEstimate.focus();
		}else if(insertForm.projLoc.value==""){
			alert("프로젝트 지역란이 비어있습니다. 확인해주세요")
			return insertForm.projLoc.focus();
		}else if(insertForm.projContent.value==""){
			alert("업무 내용란이 비어있습니다. 확인해주세요")
			return insertForm.projContent.focus();
		}else if(insertForm.projQualifi.html==""){
			alert("모집 요건이 비어있습니다. 확인해주세요")
			return insertForm.projQualifi.focus();
		}else if(insertForm.projObj.value==""){
			alert("직무 분야란이 비어있습니다. 확인해주세요")
			return insertForm.projObj.focus();
		}else{
			alert("필요 스킬란이 비어있습니다. 확인해주세요")
		}
		alert("비어있는항목 입력해")
	}else{
		alert("결제로 이어갑니당")
			let IMP = window.IMP; // <- 생략해도 무방함. 
	IMP.init('imp02698706');
	IMP.request_pay({  
	    pg : 'inicis', 
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : "프로젝트 등록",          
	    amount :  1000    

	}, function(rsp) { //callback
		let payMsg = "";
	    if ( rsp.success ) { 
	    	
	    	payInsert();
	    	$("#insertFormId").submit();
	    	
	    	payMsg = '성공 : ';
	    	payMsg += '고유ID : ' + rsp.imp_uid;
	    	payMsg += '상점 거래ID : ' + rsp.merchant_uid;
	    	payMsg += '결제 금액 : ' + rsp.paid_amount;
	    	payMsg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        payMsg = '에러내용 : ' + rsp.error_msg;
	    }
	    console.log("payMsg: ",payMsg);
	})
	}
	

}
</script>


<script>

   CKEDITOR.replace('projQualifi',{
      filebrowserImageUploadUrl : "${cPath}/file/image?command=imageUpload&${_csrf.parameterName}=${_csrf.token}",
      height : 300
   });
</script>
<script src="${cPath }/resources/js/ckeditor/editorConfig.js"></script> 
  
  
<script>
function check1(f){
    if (f.checked) {
      $('#projTitle').val('PHOS와 함께하는 프로젝트!!');
      $('#projEmptype').val('IN');
      $('#projType').val('신규개발');
      $('#projRecruitfdate').val('2022-09-22');
      $('#projPlanstate').val('계획중');
      $('#projMemnum').val('6');
      $('#projSdate').val('2022-09-24');
      $('#projFdate').val('2022-10-24');
      $('#projPayId').val('10000');
      $('#projLoc').val('대전');
      $('#projContent').val('PHOS와 함께하는 프로젝트! 지금바로 참여하세요!');
      CKEDITOR.instances.projQualifi.setData('<p>프로젝트 요구사항입니다. 자세히 읽어보신후 지원해 주시길 바랍니다.</p>')
		
    } else{
    $('#projTitle').val('');
      }
    }
</script>
      
  
  
  

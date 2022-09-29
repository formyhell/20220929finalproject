<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자     		   수정내용
* ----------  ---------  -----------------
* 2022. 9. 5.      306-22        최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <style>
 td {
 	border:none;
 }
 
  .txt_line {
      width:400px;
      padding:0px;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
  }
 </style>
 
<div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>진행중인 계약</h3>
                </div>
              </div>
            </div>
          </div>
          <div class="container-fluid">
            <div class="email-wrap bookmark-wrap">
              <div class="row">
                <div class="col-xl-4 box-col-4 xl-30">
                  <div class="email-sidebar"><a class="btn btn-primary email-aside-toggle">계약중인 프로젝트</a>
                    <div class="email-left-aside">
                      <div class="card" style="min-height: 780px; overflow:auto;">
                        <div class="card-body">
                          <div class="email-app-sidebar left-bookmark">
                            <ul class="nav main-menu" role="tablist">
                              <li class="nav-item"><span class="main-title">프로젝트 리스트</span></li>
                              <li class="nav-item">
                              <div id="searchUI" class="form-field">
						<div class="row" style="margin-left:5px;margin-top:10px;">
							<div class="col-sm-9" style="padding: 0px;">
								<div class="mb-3">
									<form:input class="form-control" style="border: 1px solid #DEDEDE;" placeholder="Search Here" path="simpleCondition.searchWord" />
					            </div>
                  			</div>
							<div class="col-sm-3">
								<div class="mb-3">
					                <input type="button" id="searchBtn" class="btn btn-outline-primary" value="검색" >
					            </div>
                  			</div>
						</div>
					</div></li>
                             <c:set var="projList" value="${pagingVO.dataList }" />
                             <c:forEach items="${ projList}" var="proj">
                             	<li><a class="show active projList" id="pills-tasks-tab" data-bs-toggle="pill" role="tab" aria-controls="pills-tasks" aria-selected="true" name="${proj.projId }"><span class="title txt_line">${proj.projTitle }</span></a></li>
                             </c:forEach>
                             </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-xl-7 col-md-12 box-col-8 xl-70">
                  <div class="email-right-aside bookmark-tabcontent">
                    <div class="card email-body radius-left">
                      <div class="ps-0">
                        <div class="tab-content">
                          <div class="fade tab-pane active show" id="pills-tasks" role="tabpanel" aria-labelledby="pills-tasks-tab">
                            <div class="card mb-0">
                              <div class="card-header d-flex">
                                <h6 class="mb-0 txt-primary">프로젝트 계약</h6><button class="btn btn-primary" type="button" onclick="optenModal()">계약완료</button>
                              </div>
                              <div class="card-body p-0">
                                <div class="taskadd">
                                  <div class="table-responsive">
                                    <table class="table">
                                      <tbody>
                                      
                                      </tbody>
                                    </table>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
<!-- 모달 -->
<div id="projPassWord" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content" style="width: 550px;">
            <div class="modal-header">
                <h5>프로젝트 자동 생성</h5>
                <button type="button" class="btn" onclick="closeModal()" data-dismiss="modal" ><span aria-hidden="true">&times;</span> <span class="sr-only">close</span></button>
            </div>
            <div class="modal-body">
            
                      <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="email-wrap bookmark-wrap">
              
                <div class="col-xl-9 col-md-12 box-col-8 xl-100" style="width: 100%;">
                  <div class="email-right-aside bookmark-tabcontent contacts-tabs">
                    <div class="card email-body radius-left">
                      <div class="ps-0">
                        <div class="tab-content">
                          <div class="tab-pane fade active show" id="pills-personal" role="tabpanel" aria-labelledby="pills-personal-tab">
                            <div class="card mb-0">
                              <div class="card-body p-0">
                                <div class="row list-persons">
                                  <div class="col-xl-4 xl-100 col-md-5 box-col-6" style="width: 100%;">
                      				<div class="nav flex-column nav-pills" id="C_ProjInvolveMem" role="tablist" aria-orientation="vertical">
                      				<br>
										<p>PMS프로젝트를 자동생성 하려면 <strong><U>비밀번호</U></strong>를 입력하고 <strong><U>확인</U></strong>을 눌러주세요.</p>
										<p>비밀번호를 입력하지 않으면 생성되지 않습니다.</p>
                      				<br>
										<input type="password" name="projPass" class="form-control" placeholder="pms프로젝트 비밀번호">
                      				</div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
          </div>
          <!-- Container-fluid Ends-->
            </div>
            <div class="modal-footer">
            	<button class="btn btn-primary" id="submitBtn" onclick="projAutoCreate()">확인</button>
            </div>
        </div>
    </div>
</div>
          
<%-- <form id="passSubmit" action="${cPath}/pmsProject/${proj.projId}/autojoin" method="get"> --%>
<!-- 	<input type="hidden" name="projPass"> -->
<%-- </form> --%>
          
<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/myinfo/contract/project" method="get">
	<input type="hidden" name="page" />
	<form:input type="hidden" path="searchWord" />
</form:form>         
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}'; 
// 프로젝트 아이디
let projIdPTag = null;
$(".projList").on("click", function() {
	$(".projList").attr("class", "show projList");
	$(this).attr("class", "show active projList");
	
	let projId = $(this).attr("name");
	projIdPTag = projId;
	$.ajax({
		url : "${cPath}/myinfo/contract/project",
		method : "post",
		data : {
			projId : projId
		},
		dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
		,
		beforeSend : function(xhr)
		{
		   xhr.setRequestHeader(header,token);
		},
		success : function(resp, status, jqXHR) {
			$("tbody").empty();
			let contractList = resp;
			if(contractList && contractList.length > 0) {
				$(contractList).each(function(index, contract) {
					$("tbody").append(trTag(contract));
					$("tr[id=" + contract.contractId + "]").attr("onclick", "location.href='${cPath }/outsourcing/contract/" + contract.contractId + "';",);
				});
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	}); 
});

let trTag = function(contract) {
	let newTr = '';
	newTr += '<tr id="' + contract.contractId + '">';
	newTr += '<td>';
	newTr += '<h6 class="task_title_0 txt_line">' + contract.contractName + '</h6>';
	for(let i = 0; i < contract.applicantList.length; i++) {
		newTr += '<p class="project_name_0">' + contract.applicantList[i].applyApplicant + '</p>';
	}
	newTr += '</td>';
	newTr += '<td class="col-md-1">';
	newTr += '<span class="badge rounded-pill badge-primary">' + contract.contractState + '</span>';
	newTr += '</tr>';
	return newTr;
}

function test(contractId){
	location.href="${cPath}/outsourcing/contract/" + contractId
}

let searchForm = $("#searchForm");
let pagingArea = $(".pagingArea").on("click", "a", function(event) {
	let page = $(this).data("page");
	searchForm.find("[name=page]").val(page);
	searchForm.submit();
});

let searchUI = $("#searchUI").on("click", "#searchBtn", function(event) {
	searchForm.get(0).reset();
	let inputs = searchUI.find(":input[name]");
	$(inputs).each(function(idx, input) {
		let name = $(this).attr("name");
		let value = $(this).val();
		searchForm.find("[name=" + name + "]").val(value);
	});
	searchForm.submit();
});


// 모달
function closeModal() {
	$('#projPassWord').modal('hide');
}

function optenModal() {
	  $('#projPassWord').modal('show');
// 	  $("#passSubmit").attr("")
}

// 입력받은 비밀번호 넘기기
// let passSubmit = $('#passSubmit');
// let projPassWord = $("#projPassWord").on("click", "#submitBtn", function(event){
// 	alert(event);
// 	let input = projPassWord.find(":input[name]");
// 	let pass = $('input[name=projPass]').val();
// 	let name = $(input).attr("name");
// 	let value = $(input).val();
	
// 	passSubmit.find('[name='+name+']').val(value);
	
	
// 	passSubmit.submit();
	
// });
// function submitPass(){
	
// }

function projAutoCreate(){
	let projPass = $('input[name=projPass]').val();
	
	location.href = '${cPath}/pmsProject/'+ projIdPTag +'/autojoin?projPass='+projPass;
}



</script>
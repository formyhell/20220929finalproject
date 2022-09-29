<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자     		   수정내용
* ----------  ---------  -----------------
* 2022. 9. 3.      306-22        최초작성
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
                             	<li><a class="show active projList" id="pills-tasks-tab" data-bs-toggle="pill" href="#pills-tasks" role="tab" aria-controls="pills-tasks" aria-selected="true" name="${proj.projId }"><span class="title txt_line">${proj.projTitle }</span></a></li>
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
                                <h6 class="mb-0 txt-primary">프로젝트 계약</h6>
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
<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/myinfo/contract/project" method="get">
	<input type="hidden" name="page" />
	<form:input type="hidden" path="searchWord" />
</form:form>         
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}'; 

$(".projList").on("click", function() {
	$(".projList").attr("class", "show projList");
	$(this).attr("class", "show active projList");
	
	let projId = $(this).attr("name");
	
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
			let trTags = [];
			console.log(contractList);
			if(contractList && contractList.length > 0) {
				$(contractList).each(function(index, contract) {
					trTags.push(trTag(contract));
				});
			}
			console.log(trTags);
			$("tbody").append(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	}); 
});

let trTag = function(contract) {
	return $("<tr>").append(
				$("<td>").css("cursor", "pointer").attr({
					onclick : "location.href='${cPath}/outsourcing/contract/" + contract.contractId + "'"
				}).append(
					$("<h6>").addClass("task_title_0 txt_line").text(contract.contractName),
					$("<p>").addClass("project_name_0").text(contract.contractRegist)
				),
				$("<td>").addClass("col-md-1").append(
					$("<span>").addClass("badge rounded-pill badge-primary").text(contract.contractState)		
				)
			);
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
</script>
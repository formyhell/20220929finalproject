<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 9. 1.      작성자           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
tbody tr:hover { 
	background-color: #e6edef !important; 
	cursor: pointer;
}

  
  table {
  	 display: block;
  	 overflow: auto;
  	 min-height: 600px;
  	 width: 685px;
  	 table-layout: fixed;
  }
  
  td {
  	word-break:break-all;
  	text-overflow:ellipsis; 
  	white-space:nowrap;
  	overflow:hidden; 
  	max-width: 100px;
  }
</style>
<div class="card" style="height: 85vh">
	<div class="card-body">
		<div class="row">
			<div class="col-xl-6 col-50 box-col-6 des-xl-50">
				<div class="card latest-update-sec">
					<div class="card-header" style="padding-bottom: 10px;">
						<div class="header-top d-sm-flex align-items-center">
							<h5>승인된 공고 리스트</h5>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordernone">
								<thead>
									<tr>
										<th style="width: 21%;"><spring:message code="outProj.projId" /></th>
										<th style="width: 30%;"><spring:message code="outProj.projTitle" /></th>
										<th style="width: 20%;"><spring:message code="outProj.projRegist" /></th>
										<th style="width: 15%;"><spring:message code="outProj.projRecruitsdate" /></th>
										<th style="width: 14%;"><spring:message code="outProj.projState" /></th>
									</tr>
								</thead>
								<tbody id="listBody"></tbody>
							</table>
						</div>
					</div>
					<div  id ="pagingList" class="card-body pagingArea pagination-primary" style="display:none; width: fit-content; margin: auto;"></div>
				</div>
			</div>

			<div class="col-xl-6 col-50 box-col-6 des-xl-50">
				<div class="card latest-update-sec">
					<div class="card-header" style="padding-bottom: 10px;">
						<div class="header-top d-sm-flex align-items-center">
							<h5>반려된 공고 리스트</h5>
						</div>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordernone" style="min-height: 665px;">
								<thead>
									<tr>
										<th style="width: 21%;"><spring:message code="outProj.projId" /></th>
										<th style="width: 30%;"><spring:message code="outProj.projTitle" /></th>
										<th style="width: 20%;"><spring:message code="outProj.projRegist" /></th>
										<th style="width: 15%;"><spring:message code="outProj.projRecruitsdate" /></th>
										<th style="width: 14%;"><spring:message code="outProj.projReject" /></th>
									</tr>
								</thead>
								<tbody id="notListBody"></tbody>
							</table>
						</div>
					</div>
					<div  id ="notPagingList" class="card-body pagingArea pagination-primary" style="display:none; width: fit-content; margin: auto;"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/admin/outProjList/approve" method="get">
   <input type="hidden" name="page" />
</form:form>
<form:form id="notSearchForm" modelAttribute="simpleCondition" action="${cPath }/admin/outProjList/notApprove" method="get">
   <input type="hidden" name="page" />
</form:form>
<script src="${cPath}/resources/js/intrestProject/jquery.form.min.js" ></script>
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
window.onload=function(){
	notSearchForm;
}

<%-- notApprove --%>
let notListBody = $("#notListBody");
let notPagingList = $("#notPagingList").on("click", "a", function(event){
	let page = $(this).data("page");
	notSearchForm.find("[name=page]").val(page);
	notSearchForm.submit();
});

let notSearchForm = $("#notSearchForm").ajaxForm({
	beforeSend : function(xhr) { xhr.setRequestHeader(header,token);}
	, dataType : "json"
	, success : function(resp, status, jqXHR) {
		let pagingVO = resp;
		let outProjList = pagingVO.dataList;
		let trTags = [];
		if(pagingVO.totalRecord > pagingVO.screenSize){
			document.getElementById("notPagingList").style.display= "block";
		}else{				
			document.getElementById("notPagingList").style.display= "none";
		}
		if(outProjList && outProjList.length>0){
			$(outProjList).each(function(index, outProj){
				trTags.push(makeNotApplySingleTr(index, outProj));
			});
		}else{
			let trTag = $("<tr>").html(
				$("<td>").attr("colspan","5").html("반려된 프로젝트가 없습니다.")	
			);
			trTags.push(trTag);
		}
		notListBody.html(trTags);
		notPagingList.html(pagingVO.pagingHTMLBS);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
}).submit();

let makeNotApplySingleTr = function(index, outProj){
	var trTable = $("<tr>").attr("onClick","location.href='${cPath }/admin/outProjList/" + outProj.projId + "'").append(
			$("<td>").append(
					$("<small>").text(outProj.projId) 
				),
				$("<td>").css("width","30%").html(outProj.projTitle) ,
				$("<td>").html(outProj.projRegist) ,
				$("<td>").append(
						$("<small>").text(outProj.projRecruitsdate) 
					),
				$("<td>").html(outProj.projReject) 
	);
	return trTable;
}
<%-- approve --%>
let listBody = $("#listBody");
let pagingList = $("#pagingList").on("click", "a", function(event){
	let page = $(this).data("page");
	searchForm.find("[name=page]").val(page);
	searchForm.submit();
});

let searchForm = $("#searchForm").ajaxForm({
	beforeSend : function(xhr) { xhr.setRequestHeader(header,token);}
	, dataType : "json"
	, success : function(resp, status, jqXHR) {
		let pagingVO = resp;
		let outProjList = pagingVO.dataList;
		let trTags = [];
		if(pagingVO.totalRecord > pagingVO.screenSize){
			document.getElementById("pagingList").style.display= "block";
		}else{				
			document.getElementById("pagingList").style.display= "none";
		}
		if(outProjList && outProjList.length>0){
			$(outProjList).each(function(index, outProj){
				trTags.push(makeapplySingleTr(index, outProj));
			});
		}else{
			let trTag = $("<tr>").html(
				$("<td>").attr("colspan","4").html("승인된 프로젝트가 없습니다.")	
			);
			trTags.push(trTag);
		}
		listBody.html(trTags);
		pagingList.html(pagingVO.pagingHTMLBS);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
}).submit();

let makeapplySingleTr = function(index, outProj){
	var trTable = $("<tr>").attr("onClick","location.href='${cPath }/admin/outProjList/" + outProj.projId + "'").append(
				$("<td>").append(
						$("<small>").text(outProj.projId) 
					),
				$("<td>").html(outProj.projTitle) ,
				$("<td>").html(outProj.projRegist) ,
				$("<td>").append(
						$("<small>").text(outProj.projRecruitsdate) 
					),
				$("<td>").html(outProj.projState)
	);
	return trTable;
}
</script>

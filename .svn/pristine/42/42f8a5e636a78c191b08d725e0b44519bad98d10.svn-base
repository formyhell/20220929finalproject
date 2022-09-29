<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 1.      작성자           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<h4>pms메인</h4>
<style>
input[type="checkbox"] {
	appearance: checkbox;
	width: 20px;
	height: 20px;
	display: inline-block;
	border: 1px solid #1fcab8;
	top: 4px;
	position: relative;
	margin-right: 10px;
}

.modal-dialog {
    max-width: 550px;
    margin: 1.75rem auto;
}

.date{
	display: block;
	width: 100;
	padding: 0.375rem 0.75rem;
	font-weight: 400;
	line-height: 1.5;
	background-clip: padding-box;
	appearance: none;
    border-radius: 0.25rem;
    border: 1px solid #DEDEDE;
    display: inline-block;
	!important
} 
input[type='radio']:checked{
	accent-color: #24695c;
}
</style>
<head>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load('current', {'packages':['gantt']});
    google.charts.setOnLoadCallback(drawChart);

    function daysToMilliseconds(days) {
      return days * 24 * 60 * 60 * 1000;
    }

    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('string', 'Task ID');
      data.addColumn('string', 'Task Name');
      data.addColumn('date', 'Start Date');
      data.addColumn('date', 'End Date');
      data.addColumn('number', 'Duration');
      data.addColumn('number', 'Percent Complete');
      data.addColumn('string', 'Dependencies');
	  let index = ${fn:length(workList)};
	  
      data.addRows([
	  <c:forEach items="${workList }" var="work" varStatus="status">
// 	  	index = ${status.count}
	  	[
	  		'${work.workId}', '${work.workTitle}' , 
	  		<c:if test="${empty work.workParent}">
	  		new Date(${work.workSdate}), new Date(${work.workFdate}), null, ${work.workProgress}, null
	  		</c:if>
	  		
	  		<c:if test="${not empty work.workParent}">
				null , new Date(${work.workFdate}), daysToMilliseconds(${work.sdate}), ${work.workProgress},'${work.workParent}'
	  		</c:if>
	  		
	  	]
	  		<c:if test="${not empty work.workId}">
				,
	  		</c:if>
	  </c:forEach>
//     	['Research', 'Find sources',
//          new Date(2022, 0, 1), new Date(2022, 0, 5), null,  100,  null],
//         ['Write', 'Write paper',
//          null, new Date(2022, 0, 9), daysToMilliseconds(3), 70, 'Research,Outline'],
//         ['Cite', 'Create bibliography',
//          null, new Date(2022, 0, 7), daysToMilliseconds(1), 20, 'Research'],
//         ['Complete', 'Hand in paper',
//          null, new Date(2022, 0, 10), daysToMilliseconds(1), 0, 'Cite,Write'],
//         ['Outline', 'Outline paper',
//          null, new Date(2022, 0, 6), daysToMilliseconds(1), 100, 'Research']
      ]);
		console.log(index);
    	  let hi = (index+1) * 42;
		console.log(hi);
      var options = {
        height: hi
      };

      var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
  </script>
  
  
  
</head>
<div id="searchUI">
<div class="row">
	<table class="table" style="width: 1294px; margin:0 auto;">
		<tr>
			<th class="gray-bg">제목</th>
			<td>
				<input class="form-control" style="border: 1px solid #DEDEDE; display: inline-block;" name="workTitle"  class="form-control"/> 
				<input type="button" id="searchBtn" class="btn btn-outline-primary" value="검색" >
			</td>
		</tr>
		<tr>
			<th class="gray-bg">진행기간</th>
			<td > <input type="date" id="sdate" name="workSdate" class=" date">~
				 <input type="date" id="edate" name="workFdate" class=" date">
			</td>
			<td>
			</td>
			
		</tr>
	</table>
</div>
</div>
<div style="overflow: scroll; width: 1294px; height: 500px; margin:0 auto; ">
<div id="chart_div"></div>
</div>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card" >
				<div class="card-header">
					<!--                     검색 -->
					<!-- 	일감의 상태, 유형WORK_TYPE, 우선순위WORK_PRORITY, 담당자WORK_CHARGER -->
				</div>
				<div class="table-responsive" >
					<table class="table" >
						<thead>
							<tr>
								<th scope="col">참여자</th>
								<th scope="col">역할</th>
								<th scope="col">참여일 </th>
								<th scope="col">종료일</th>
								<th scope="col">역할 지정</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${not empty projInvolve }">
									<c:forEach items="${projInvolve }" var="involve" varStatus="status">
											<tr>
												<td>
													<a href="${cPath }/pms/${projId }/${involve.involveMem}">
														${involve.memName }
													</a>
												</td>
												<td>${involve.involveRole}</td>
												<td>${involve.involveSdate }</td>
												<td>${involve.involveFdate }</td>
												<td>${involve.involveMem}</td>
												<td>
													<input type="hidden" value="${involve.involveMem}" name="currentmem${status.index}">
													<button class="btn btn-primary" data-toggle="modal" data_target="#roleAssignment" 
													 data-memId="${involve.projId }" onclick="roleAssignment(); getMemberId('${involve.involveMem}');" id="role">역할 지정하기</button>
												</td>
											</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<th colspan="5">프로젝트 참여자 없음</th>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 모달 -->
<div id="roleAssignment" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5>역할지정</h5>
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
                      				<div class="" id="C_ProjInvolveMem" role="tablist" aria-orientation="vertical">
                      				<br>
											<c:forEach items="${pmsJopFeildList }" var="pmsJopFeild">
												<input type="radio" class="" name="pmsJopFeild" value="${pmsJopFeild.codeId }" style="height: 20px; width: 20px;">
												<label for="${pmsJopFeild.codeId }" class="mb-0">${pmsJopFeild.codeId }</label>
												&nbsp;&nbsp;&nbsp;&nbsp;
											</c:forEach>
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
            	<button class="btn btn-primary" id="submitBtn" onclick="selectInvolveMem()">확인</button>
            </div>
        </div>
    </div>
</div>

<form id="searchForm" action="${cPath }/pms/${projId }">
	<input type="hidden" name="workTitle">
	<input type="hidden" name="workProgress">
	<input type="hidden" name="workParent">
	<input type="hidden" name="workSdate">
	<input type="hidden" name="workFdate">
</form>


<script>
let searchUI = $("#searchUI");
let searchForm = $("#searchForm");
$("#searchBtn").on("click", function(event){
	let inputs = searchUI.find(":input[name]");
	$(inputs).each(function(idx, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		searchForm.find("[name="+name+"]").val(value);
	});
	searchForm.submit();
});


function closeModal() {
	$('#roleAssignment').modal('hide');
}

function roleAssignment() {
	  $('#roleAssignment').modal('show');
}



var memId = "";

function getMemberId(memberId){
	memId = memberId;
// 	alert(memId);
}

// $(document).ready(function(){
// 	$('#role').on('show.bs.modal', function(event){
// 		memId = $(event.relatedTarget).data('memId');
// 		alert(memId);
// 	});s
// });

function selectInvolveMem(){
	var role = $('input[name=pmsJopFeild]:checked').val();
// 	alert(role);
	location.href ='${cPath}/pms/${projId}/role/'+memId+'?pmsJopFeild='+role;
}

// $("#rolesubmit").attr("action", '${cPath}/pms/${projId}/role/'+memId);



</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 1.      작성자명      최초작성
* 2022. 8. 6.		홍승조	테이블 생성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<div class="container">
            <div class="row">
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header">
                    <h5>일감 목록</h5>
                    <div>
                    	<button style="float: right;" class="btn btn-primary" onclick="location='${cPath}/pms/${projId}/work/form'">등록하기</button>
                    </div>
<!--                     검색 -->
<!-- 	일감의 상태, 유형WORK_TYPE, 우선순위WORK_PRORITY, 담당자WORK_CHARGER -->
					<div id="searchUI" class="form-field">
						<div class="row">
							<div class="col-sm-2" style="padding: 0px;">
								<div class="mb-3">
									<form:select   path="simpleCondition.searchType" class="form-select form-control" >
                  						<form:option value="">전체</form:option>
                  						<form:option value="workTitle" label="제목"/>
              			    			<form:option value="workCharger" label="담당자"/>
              			    		</form:select>
					            </div>
                  			</div>
							<div class="col-sm-3" style="padding: 0px;">
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
                  	</div>
                  </div>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th scope="col">NO</th>
                          <th scope="col">유형</th>
                          <th scope="col">우선순위</th>
                          <th scope="col">상태</th>
                          <th scope="col">제목</th>
                          <th scope="col">진행도</th>
                          <th scope="col">담당자</th>
                          <th scope="col">시작일</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:set var="workList" value="${pagingVO.dataList }"/>
                      	<c:choose>
                      		<c:when test="${not empty workList }">
                      			<c:forEach items="${workList }" var="work">
                      				<tr>
                      					<td>${work.rnum }</td>
                      					<td>${work.workType }</td>
                      					<td>${work.workPrority }</td>
                      					<td>${work.workState }</td>
                      					<td>
                      						<a href="${cPath }/pms/${work.workProj}/work/${work.workId}">${work.workTitle }</a>
                      					</td>
                      					<td>${work.workProgress }</td>
                      					<td>${work.memName }</td>
                      					<td>${work.workSdate }</td>
                      				</tr>
                      			</c:forEach>
                      		</c:when>
                      		<c:otherwise>
									<tr>
										<td colspan="8" style="text-align: center;"><b>일감 없음</b></td>
									</tr>

								</c:otherwise>
                      	</c:choose>
                      </tbody>
                      <tfoot>
							<tr>
								<td colspan="8">
									<div
										class="pagingArea pagination justify-content-center pagination-primary">
										${pagingVO.pagingHTMLBS }
									</div>
								</td>
							</tr>
						</tfoot>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>      
          
<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/pms/${projId}/work" method="get">
	<input type="hidden" name="page" />
	<form:input type="hidden" path="searchType" />
	<form:input type="hidden" path="searchWord" />
</form:form>

<script>
let searchForm = $("#searchForm");
let pagingArea = $(".pagingArea").on("click", "a", function(event){
	let page = $(this).data("page");
	searchForm.find("[name=page]").val(page);
	searchForm.submit();
});
	
let searchUI = $("#searchUI").on("click", "#searchBtn", function(event){
	searchForm.get(0).reset();
	let inputs = searchUI.find(":input[name]");
	$(inputs).each(function(idx, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		searchForm.find("[name="+name+"]").val(value);
	});
	searchForm.submit();
});   
</script>
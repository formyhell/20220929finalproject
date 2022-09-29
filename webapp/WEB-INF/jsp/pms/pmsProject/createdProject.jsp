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
* 2022. 8. 16.      홍승조      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <style>
.pagingArea {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}

table, td, th {
	border-collapse: collapse;
/* 	border: 1px solid black; */
}
card {
	margin-left: 300px;
	margin-right: 300px;
}
regist {
	float: right;
}
#searchWord {
	border: 1px;
}
form-full input-lg {
	z-index:1000;
}

.ellipsis {
	width: 256px;
	text-overflow: ellipsis;
	overflow: hidden;
	max-height: 200px;
/* 	white-space:nowrap; */
	text-overflow: ellipsis;
	display: -webkit-box;
  	-webkit-line-clamp: 1; /*몇줄까지 보여줄껀지*/ */
	-webkit-box-orient: vertical; /*뭔지모름*/
}

.ellipsis:hover {
	overflow: visible; /*마우스 올리면 전체보여줌*/
}

.miniGreenlight{
	color: #FFFFFF;
	background-color: #C9CACA;
	border-radius: 5px;
	height:30px;
	width: 80px;
}

.miniGreenlight:hover{
	background-color: #1FCAB8;
}
th, td{
	text-align: center;
}
.ellipsis {
	position: relative;
	display: block;
	overflow: hidden;
	display: -webkit-box;
	-webkit-box-orient: vertical;
}

.ellipsis .tooltiptext {
	visibility: hidden;
	width: 400px;
	background-color: gray;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute;
	z-index: 1;
}

.ellipsis:hover .tooltiptext {
	visibility: visible;
}

/* 툴팁 기본 스타일 설정 끝 */

/* -------------------------- */

/* 툴팁 화살표 기본 스타일 설정 시작 */
.ellipsis .tooltiptext::after {
	content: " ";
	position: absolute;
	border-style: solid;
	border-width: 5px;
}


.ellipsis .tooltip-bottom {
	width: 120px;
	top: 150%;
	left: 50%;
	margin-left: -60px;
}

.ellipsis .tooltip-bottom::after {
	bottom: 100%;
	left: 50%;
	margin-left: -5px;
	border-color: transparent transparent black transparent;
}


</style>
<div id="services-section" class="pt-xs-60" style="padding-top: 5vh">
	<div class="container">
			<div class="row "> 
				<div class="col-sm-12"> 
					<div class="block-title v-line mb-45"> 
						<h2><span>PMS</span> Project</h2> 
						<p class="italic"> 
							본인이 생성한 프로젝트 목록
						</p> 
					</div> 
				</div> 
			</div>
            <div class="row">
              <div class="col-sm-12">
                <div>
                  <div class="card-header">
                	<div >
                		<button style="float: right;" class="btn-greenlight" onclick="location='${cPath}/pmsProject/form'">등록하기</button>
                	</div>
					<!-- 검색 -->                  	
                  	<div id="searchUI" class="form-field">
                  		<form:select  path="simpleCondition.searchType" class="selectbox">
                  			<form:option value="">전체</form:option>
                  			<form:option value="projName" label="프로젝트 이름"/>
                  			<form:option value="projArchi" label="설계자"/>
                  		</form:select>
						<form:input style="border: 1px solid #DEDEDE;" placeholder="Search Here" path="simpleCondition.searchWord" />
                  		<input type="button" id="searchBtn" class="btn-greenlight" value="검색" >
                  	</div>
                  </div>
                  <!-- 리스트 -->
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th scope="col">NO</th>
                          <th scope="col">설계자</th>
                          <th scope="col">프로젝트 이름</th>
                          <th scope="col">시작일</th>
                          <th scope="col">아웃소싱 프로젝트 연결 여부</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:set var="pmsList" value="${pagingVO.dataList }"/>
                      	<c:choose>
                      		<c:when test="${not empty pmsList }">
                      			<c:forEach items="${pmsList }" var="pms" varStatus="status">
                      				<tr onclick="location.href='${cPath }/pmsProject/${pms.projId }'" style="cursor : pointer; ">
                      					<td>${status.count}</td>
                      					<td>${pms.projArchi }</td>
                      					<td style="width: 256px;">
                      							<div class="ellipsis">
                      							${pms.projName }
                      							 <span class="tooltiptext tooltip-bottom">
                      							${pms.projName }
                      							</span>
                      						</div>
                      					</td>
                      					<td>${pms.projSdate }</td>
                      					<td>
                      						<c:if test="${pms.projOutproj eq null}">
                      							X
                      						</c:if>
                      						<c:if test="${pms.projOutproj != null}">
                      							O
                      						</c:if>
                      					</td>
                      				</tr>
                      			</c:forEach>
                      		</c:when>
                      		<c:otherwise>
                      			<tr>
                      				<td colspan="5">프로젝트 없음</td>
                      			</tr>
                      			
                      		</c:otherwise>
                      	</c:choose>
                      </tbody>
                      <!-- 페이징 -->
                      <tfoot>
                      	<tr>
                      		<td colspan="5">
                      		<div class="pagingArea pagination-nav text-left mt-60 mtb-xs-30">
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
           	</div>

					<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/pmsProject" method="get">
                    	<input type="hidden" name="page"/>
                    	<form:input  type="hidden" path="searchType"/>
                    	<form:input  type="hidden" path="searchWord"/>
                    </form:form>

                   
					

              <script>
              
              function f_modalOpen(){
            	  mymodal.style.display="block";
              }
              
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
              
              
              
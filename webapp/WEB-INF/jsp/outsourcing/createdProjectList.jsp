<%-- 아웃소싱 프로젝트 목록 리스트 --%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      고혜인     프로젝트 리스트
* 2022, 8. 29      홍승조	프로젝트 검색 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>    

<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
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
		
	.project-category{
		margin-left: 20px;
	}
		
	.table-category td{
		padding-left: 20px;
	}
	body {
		width: 100%;
	}
	.ellipsis{
		width: 250px;
		text-overflow:ellipsis;
		overflow:hidden;
		max-height: 200px;	
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2; /*몇줄까지 보여줄껀지*/
		-webkit-box-orient: vertical;/*뭔지모름*/
	}
/* 	.ellipsis:hover{ */
/* 		overflow:visible; /*마우스 올리면 전체보여줌*/ */
/* 		outline: 1px solid balck; */
/* /* 		background-color:yellow; /*마우스 올렸을때 나오는색*/ */ */
/* 	} */
	

/* 툴팁 이용해보자@@@@@@@@@@@  */
	
	/* 컨테이너 설정 */

/* .container {display:flex;justify-content:center; flex-direction: row;} */
/* .inner-container {display:flex;flex-direction: column;width: 200px;text-align:center;margin-top:50px} */

/* 컨테이너 설정 */


/* 툴팁 기본 스타일 설정 시작 */

.ellipsis {
  position: relative;
  display: block;
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

/* .ellipsis:hover .tooltiptext { */
/*   visibility: visible; */
/* } */

/* 툴팁 기본 스타일 설정 끝 */

/* -------------------------- */

/* 툴팁 화살표 기본 스타일 설정 시작 */

.ellipsis .tooltiptext::after {
  content: " ";
  position: absolute;
  border-style: solid;
  border-width: 5px;
}

/* 툴팁 화살표 기본 스타일 설정 끝 */

/* -------------------------- */

/* 툴팁 방향 설정 시작 */

/* 왼쪽 툴팁 시작 */

/* .tooltip .tooltip-left { */
/*   top: -5px; */
/*   right: 105%; */
/* } */

/* .tooltip .tooltip-left::after { */
/*   top: 50%; */
/*   left: 100%; */
/*   margin-top: -5px; */
/*   border-color: transparent transparent transparent black; */
/* } */

/* /* 왼쪽 툴팁 끝 */ */

/* /* 오른쪽 툴팁 시작 */ */

/* .tooltip .tooltip-right { */
/*   top: -5px; */
/*   left: 105%; */
/* } */

/* .tooltip .tooltip-right::after { */
/*   top: 50%; */
/*   right: 100%; */
/*   margin-top: -5px; */
/*   border-color: transparent black transparent transparent; */
/* } */

/* /* 오른쪽 툴팁 끝 */ */

/* /* 위쪽 툴팁 시작 */ */

/* .tooltip .tooltip-top { */
/*   width: 120px; */
/*   bottom: 150%; */
/*   left: 50%; */
/*   margin-left: -60px; */
/* } */

/* .tooltip .tooltip-top::after { */
/*   top: 100%; */
/*   left: 50%; */
/*   margin-left: -5px; */
/*   border-color: black transparent transparent transparent; */
/* } */

/* 아래쪽 툴팁 시작 */

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

/* 아래쪽 툴팁 시작 */

/* 툴팁 방향 설정 끝 */
	
</style>

			<!-- CONTENT -->
			<!-- Service Section -->
			
			<div id="services-section" class="pt-80 pt-xs-60">
				<div class="container">
					<div class="row "> 
						<div class="col-sm-12"> 
							<div class="block-title v-line mb-45"> 
								<h2><span>Our</span> Project</h2> 
								<p class="italic"> 
									나의 모집중인 프로젝트 정보를 확인하세요!
								</p> 
							</div> 
						</div> 
					</div> 
					<div>
						<button style="float: right;" class="btn-text"
							onclick="location='${cPath }/outsourcing/form'">등록하기</button>
					</div>
					<!-- 검색 -->
					<div class="form-field">
						
					
					
							<div class="project-category">
								<button type="button" class="btn-text" id="onOff" data-id="true" style="display: inline-block; float: left; margin: 1px;">검색 필터 보이기</button>
								<div id="searchUI" style="display : none;">
									<table class="table table-category">
										<tr>
											<th class="gray-bg">제목</th>
											<td>
												<input style="border: 1px solid #DEDEDE; padding: 12px 15px;" placeholder="Search Here" name="projTitle" />
												<input type="button" id="searchBtn" class="btn-greenlight" value="검색">
											</td>
										</tr>										
										<tr>
											<th class="gray-bg">고용형태</th>
											<td colspan="2">
												<input type="checkbox" name="projEmptype" class="empType" value="out" id="OUT">
												<label for="out"> 외주(도급)</label>
												<input type="checkbox" name="projEmptype" class="empType" value="in" id="IN">
												<label for="in"> 상주(기간제)</label>  
											</td>
										</tr>
										<tr>
											<th class="gray-bg">직무분야</th>
											<td colspan="2">
												<input type="checkbox" name="projObj" class="obj" value="WEBDESIGN" id="WEBDESIGN">
												<label for="webdesign"> 웹디자인</label>
												<input type="checkbox" name="projObj" class="obj" value="PUBLISHER" id="PUBLISHER">
												<label for="publisher"> 퍼블리셔</label>
												<input type="checkbox" name="projObj" class="obj" value="FRONTEND" id="FRONTEND">
												<label for="frontend"> 프론트엔드</label> 																
												<input type="checkbox" name="projObj" class="obj" value="BACKEND" id="BACKEND">
												<label for="backend"> 백엔드</label> 																
												<input type="checkbox" name="projObj" class="obj" value="PLANNER" id="PLANNER">
												<label for="planner"> 기획자</label> 																
											</td>
										</tr>
										<tr>
											<th class="gray-bg">기업 등급</th>
											<td colspan="2">
							                    <input type="checkbox" name="comGrd" class="grd" value="gold" id="GOLD" >
							                    <label for="gold">골드</label>
							                    <input type="checkbox" name="comGrd" class="grd" value="silver" id="SILVER">
							                    <label for="silver">실버</label>			                        
												<input type="checkbox" name="comGrd" class="grd" value="bronze" id="BRONZE">
												<label for="bronze"> 브론즈</label>
												<input type="checkbox" name="comGrd" class="grd" value="common" id="COMMON">
												<label for="common">일반</label> 										
											</td>
										</tr>
										<tr>
											<th class="gray-bg">진행기간</th>
											<td>
												시작일 <input type="date" id="sdate" name="projSdate"> ~ 종료일 <input type="date" id="edate" name="projFdate">
											</td>
										</tr>
										<tr>
											<th class="gray-bg">필요 기술</th>
											<td >
												<c:forEach items="${outSkillList}" var="skill" varStatus="i">
					                                <input type="checkbox" name="projSkill" id="${skill.codeId }" value="${skill.codeId }" class="skill"/>
					                                <label for="${skill.codeId }">${skill.codeName }</label>
					                                <c:if test="${i.count % 9 == 0 }">
					                                	<br>
					                                </c:if>
				                          </c:forEach>
											</td>
										</tr>
									</table>
								</div>
							</div>
							
					
							<div class="row">
						<div class="col-sm-12">
							<ul class="project-col-3 isotope" id="isotope">
							
								<!-- 프로젝트 목록 for-->
								<c:set value="${pagingVO.dataList }" var="projList" />
								<c:choose>
									<c:when test="${not empty createdProjectList }">
										<c:forEach items="${createdProjectList }" var="proj">
											<li>
												<security:authorize access="isAuthenticated()">
													<a href="${cPath }/outsourcing/${proj.projId}"></a>
												</security:authorize>
												<security:authorize access="isAnonymous()">
													<a href="${cPath }/login"></a>
												</security:authorize>
												<div class="about-block mb-60 mb-xs-40 clearfix height-300">
												<a href="${cPath }/outsourcing/${proj.projId}/project">

												<div class="card about-block dark-gray-bg clearfix" style="min-height: 250px; padding-right:20px; padding-left:20px" >
													<div class="text-box mt-25">
														<div class="box-title mb-15"> 
															<h3>${proj.projTitle }</h3> <!-- 프로젝트 제목 -->
														</div>
														<div class="text-content">
															<p>~ ${proj.projRecruitfdate} 까지<br>${proj.projEmptype} | ${proj.projEstimate}원 | 등록일 : ${proj.projRecruitsdate }</p>
															<p class ="ellipsis">
															${proj.projContent}<br>
															<span class="tooltiptext tooltip-bottom">${proj.projContent}</span>
															</p>
														</div>
													</div>
													</div>
												</a>
												</div>
											</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										프로젝트가 없음
									</c:otherwise>
								</c:choose>
								<!-- end for -->
							</ul>
							<div>
							</div>
						</div>
					</div>
				</div>
								<div class="pagingArea pagination-nav text-left mt-60 mtb-xs-30">
											${pagingVO.pagingHTMLBS }</div>
			</div>
			</div>
			<!-- Service Section end -->
<form:form id="searchForm" modelAttribute="detailCondition" action="${cPath }/outsourcing/creaed" method="get" >
	<input type="hidden" name="page" />
	<input type="hidden" name="projTitle"/>
	<input type="hidden" name="projemptype"/>
	<input type="hidden" name="projObj"/>
	<input type="hidden" name="comGrd"/>
	<input type="hidden" name="projSdate"/>
	<input type="hidden" name="projFdate"/>
	<input type="hidden" name="projSkill"/>
</form:form>             
<script>
$("#onOff").on("click",function(){
    if($("#onOff").data("id") == "true"){
       $("#onOff").data("id", "false");
       $("#searchUI").hide();
    }else{
       $("#onOff").data("id", "true");
       $("#searchUI").show();
    }
})
	// 스킬 받은 거
	function getSkill(){
		let skillvalue = '';
		$.each($('input.skill:checked'), function(si, sv){
			if(skillvalue != '') skillvalue += ',';
			skillvalue += $(this).attr('id'); // $(v)
		});
		$('#searchForm input[name="projSkill"]').val(skillvalue);
	}
	
	// 고용형태 받는 거
	function getEmpType(){
		let empvalue = '';
		$.each($('input.empType:checked'), function(i, v){
			if(empvalue != '') empvalue += ',';
			empvalue += $(this).attr('id'); // $(v)
		});
		$('#searchForm input[name="projemptype"]').val(empvalue);
	}
	
	// 직무 분야 받는 거
	function getObj(){
		let objvalue = '';
		$.each($('input.obj:checked'), function(i, v){
			if(objvalue != '') objvalue += ',';
			objvalue += $(v).attr('id'); // $(v)
		});
		$('#searchForm input[name="projObj"]').val(objvalue);
	}
	
	// 기업 등급 받는 거
	function getGrd(){
		let grdvalue = '';
		$.each($('input.grd:checked'), function(i, v){
			if(grdvalue != '') grdvalue += ',';
			grdvalue += $(this).attr('id'); // $(v)
		});
		$('#searchForm input[name="comGrd"]').val(grdvalue);
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
		
		
		getSkill();
		getEmpType();
		getObj();
		getGrd();
		searchForm.submit();
	});
	
	$("[name=projTitle]").val("${pagingVO.detailCondition.projTitle}");
	let chk_arr = [];
	
	$("input[name=projEmptype]").val("${pagingVO.detailCondition.projEmptype}");
	$("input[name=projObj]").val("${pagingVO.detailCondition.projObj}");
	$("input[name=comGrd]").val("${pagingVO.detailCondition.comGrd}");
	$("input[name=projSdate]").val("${pagingVO.detailCondition.projSdate}");
	$("input[name=projFdate]").val("${pagingVO.detailCondition.projFdate}");
	$("input[name=projSkill]").val(	"${pagingVO.detailCondition.projSkill}");
	
	
// 	$("#searchBtn").on("click", function(event){
// 		let inputs = searchUI.find(":input[name]:checked");
// 		$(inputs).each(function(idx, input){
// 			let name = $(this).attr("name");
// 			let value = chk_arr.push($(this).val());
// 			searchForm.find("[name="+name+"]").val(value);
// 		});
// 			console.log("name : " + name +", value : " + chk_arr);
		
		
// 		searchForm.submit();
// 	});
	
	// 프로젝트 지원 후 알러트
	const result = "${message}";
	if (result === "ok") {
		alert("프로젝트 지원 성공! 지원한 프로젝트 목록을 확인해주세요!");
	} else if(result === "duplicated"){
		alert("프로젝트 참가 실패! 이미 지원한 프로젝트 입니다. 지원한 프로젝트 목록을 확인해주세요!");
	}
	
</script>



















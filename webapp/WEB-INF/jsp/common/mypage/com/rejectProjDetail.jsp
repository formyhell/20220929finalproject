<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자     		   수정내용
* ----------  ---------  -----------------
* 2022. 9. 8.      306-22        최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<div class="container-fluid">
            <div class="row">
              <div class="col-xl-12 xl-60 box-col-8">
                <div class="card">
                  <div class="job-search">
                    <div class="card-body">
                      <div class="media">
                        <div class="media-body">
                          <div class="row">
                          	<h4 class="f-w-600 col-md-2 txt-primary" style="margin-right: -60px">${proj.projTitle }</h4>
                          	<p id="projId" style="display:none">${proj.projId }</p>
                          </div>
                          <p>${proj.projRegist }</p>
                          	<a class="btn btn-primary btn-sm btn-approve" style="float:right" href='${cPath }/outsourcing/${proj.projId }/form'>공고 수정</a>
                        </div>
                      </div>
                      <div class="job-description">
                        <h6>세부사항</h6>
                        <p>모집기간 ${proj.projRecruitsdate }-${proj.projRecruitfdate }</p>
                      	<P>프로젝트 기간 ${proj.projSdate }-${proj.projRealfdate }
                      	</P>
                      	<p>비용 ${proj.projEstimate }</p>
                      	<p>모집인원 ${proj.projMemnum }</p>
                      	<p>고용형태 ${proj.projEmptype }</p>
                      	<p>분류 ${proj.projType }</p>
                      	<p>지역 ${proj.projLoc }</p>
                      	<p class="f-w-600">프로젝트 필요기술</p>
                      	<c:if test="${not empty proj.objSingleList }">
                      		<c:forEach items="${proj.objSingleList }" var="obj">
                      			<span class="badge rounded-pill badge-primary col-sm-1">${obj }</span>
                      		</c:forEach>
                      	</c:if>
                      	<p class="f-w-600">프로젝트 모집분야</p>
                      	<c:if test="${not empty proj.skillSingleList }">
                      		<c:forEach items="${proj.skillSingleList }" var="skill">
                      			<span class="badge rounded-pill badge-light text-dark col-sm-1">${skill }</span>
                      		</c:forEach>
                      	</c:if>
                      </div>
                      <div class="job-description">
                        <h6>업무내용</h6>
                        	<pre>${proj.projContent }</pre>
                      </div>
                      <div class="job-description">
                        <h6>모집요건</h6>
                        	<pre>${proj.projQualifi }</pre>
                      </div>
                      <c:if test="${not empty proj.projReject }">
                      	<div class="job-description">
                        <h6>반려사유</h6>
                        	<p>${proj.projReject }</p>
                      </div>
                      </c:if>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<!--관심 프로젝트 시작-->
<!-- <div class="container-fluid" > -->
<!--    <div class="page-header"> -->
<!--      <div class="row"> -->
<!--        <div class="col-sm-10"> -->
<!--          <h3>InterestProject</h3> -->
<!--          <ol class="breadcrumb"> -->
<%--            <li class="breadcrumb-item"><a href="${cPath}">Home</a></li> --%>
<%--            <li class="breadcrumb-item"><a href="${cPath}/gen/myinfo">MyPage</a></li> --%>
<!--            <li class="breadcrumb-item active">InterestProject</li> -->
<!--          </ol> -->
<!--        </div> -->
<!--      </div> -->
<!--    </div> -->
<!--  </div> -->
<style>
.media-body{
	max-width: 40vh;
}
</style>
<div class="card" style="height: 80vh">
<div class="card-body">
   <div class="row">
   
     <div class="col-xl-6 col-50 box-col-6 des-xl-50">
       <div class="card latest-update-sec" >
         <div class="card-header" style="padding-bottom: 10px;">
           <div class="header-top d-sm-flex align-items-center">
             <h5>관심 목록</h5>
             <div class="center-content">
             </div>
<%--              <button class="btn-blueOcen" style="border:0px; width: auto; height:30px;" onclick="location.href='${cPath}/gen/myinfo/recommendProject'">프로젝트 추천</button> --%>
           </div>
         </div>
         <div class="card-body">
           <div id="like" class="table-responsive">
             <table class="table table-bordernone">
               <tbody id="listBody">
                 <!-- 자동 생성 테이블 들어가야 할 위치 -->
               </tbody>
             </table>
           </div>
           <div class="code-box-copy">
             <button class="code-box-copy__btn btn-clipboard" data-clipboard-target="#latest-update-sec" title="Copy"><i class="icofont icofont-copy-alt"></i></button>
           </div>
         </div>
         <div  id ="pagingList" class="card-body pagingArea pagination-primary" style="display:none; width: fit-content; margin: auto;"></div>
       </div>
     </div>
   
     <div class="col-xl-6 col-50 box-col-6 des-xl-50">
        <div class="card latest-update-sec" >
          <div class="card-header" style="padding-bottom: 10px;">
            <div class="header-top d-sm-flex align-items-center">
              <h5>지원한 프로젝트</h5>
              <div class="center-content">
              </div>
            </div>
          </div>
          <div class="card-body">
            <div id="apply" class="table-responsive">
              <table class="table table-bordernone">
                <tbody id="applyListBody">
                  <!-- 자동 생성 테이블 들어가야 할 위치 -->
                </tbody>
              </table>
            </div>
            <div class="code-box-copy">
              <button class="code-box-copy__btn btn-clipboard" data-clipboard-target="#latest-update-sec" title="Copy"><i class="icofont icofont-copy-alt"></i></button>
            </div>
          </div>
          <div  id ="applyPagingList" class="card-body pagingArea pagination-primary" style="display:none; width: fit-content; margin: auto;"></div>
        </div>
      </div>
      
   </div>
</div>
</div>


<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/gen/myinfo/interestProject" method="get">
   <input type="hidden" name="page" />
</form:form>
<form:form id="applySearchForm" modelAttribute="simpleCondition" action="${cPath }/gen/myinfo/interestProject/apply" method="get">
   <input type="hidden" name="page" />
</form:form>
<script src="${cPath}/resources/js/intrestProject/jquery.form.min.js" ></script>
<script>
   var header = '${_csrf.headerName}';
   var token =  '${_csrf.token}';
   var CPATH = "${cPath}";
   
   var jScript = document.createElement("script");
   jScript.src = "${cPath}/resources/js/intrestProject/interestProject.js";
   document.body.appendChild(jScript);
   
   var applyJScript = document.createElement("script");
   applyJScript.src = "${cPath}/resources/js/intrestProject/applyProj.js";
   document.body.appendChild(applyJScript);
</script>
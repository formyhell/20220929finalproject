<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 1.      작성자           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- toastr -->
<link href="${cPath}/resources/cal/toastr.css" rel="stylesheet" type="text/css">
<link href="${cPath}/resources/css/alert/subAlert.css" rel="stylesheet" type="text/css">
<script src="${cPath}/resources/cal/toastr.min.js"></script>

      <div class="page-main-header">
        <div class="main-header-right row m-0">
          <div class="main-header-left">
            <div class="logo-wrapper"><a href="${cPath}/pms/${projId}"><img class="img-fluid" src="${cPath}/resources/assetsPms/images/logo/logo.png" alt=""></a></div>
            <div class="dark-logo-wrapper"><a href="index.html"><img class="img-fluid" src="${cPath}/resources/assetsPms/images/logo/dark-logo.png" alt=""></a></div>
          </div>
          <div class="d-lg-none mobile-toggle pull-right w-auto"><i data-feather="more-horizontal"></i></div>
          
          <div class="nav-right col pull-right right-menu p-0">
            <ul class="nav-menus">
              <li class="dropdown" style="color: white; float: right;">
				<i data-feather="bell"></i> <span class="dot-animated"></span>
				<div class="dropdown-content"></div>
			  </li>
              <li class="onhover-dropdown p-0">
              	<button onclick="logoutForm.submit();" class="btn btn-primary-light" type="button"><i data-feather="log-out"></i>Log out</button>
             	<form:form id="logoutForm" method="post" action="${cPath}/logout"></form:form>
              </li>
            </ul>
          </div>
        </div>
      </div>
      
<script src="${cPath}/resources/js/alert/subAlert.js"></script>      
<script>
let h_header = '${_csrf.headerName}';
let h_token =  '${_csrf.token}'; 
let h_url = "${cPath}/alert";
let h_svUrl = "192.168.36.40";

connect();
alamView();

</script>      
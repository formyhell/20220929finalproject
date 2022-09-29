<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- toastr -->
<link href="${cPath}/resources/cal/toastr.css" rel="stylesheet" type="text/css">
<link href="${cPath}/resources/css/alert/subAlert.css" rel="stylesheet" type="text/css">
<script src="${cPath}/resources/cal/toastr.min.js"></script>

   <div class="page-main-header">
      <div class="main-header-right row m-0">
        <div class="main-header-left">
          <div class="logo-wrapper"><a href="${cPath}"><img class="img-fluid" src="${cPath}/resources/assetsPms/images/logo/logo.png" alt=""></a></div>
          <div class="dark-logo-wrapper"><a href="${cPath}"><img class="img-fluid" src="${cPath}/resources/assetsPms/images/logo/dark-logo.png" alt=""></a></div>
          <div class="toggle-sidebar"><i class="status_toggle middle" data-feather="align-center" id="sidebar-toggle"></i></div>
        </div>
        <div class="nav-right col pull-right right-menu p-0">
          <ul class="nav-menus">
            <!--알림 기능-->
            <li class="dropdown f-right" style="color: white;">
				<i data-feather="bell"></i> <span class="dot-animated"></span>
				<div class="dropdown-content"></div>
			</li>
            <!--알림 기능 끝-->
            <li class="onhover-dropdown p-0">
              <button class="btn btn-primary-light" type="button"><a href="${cPath}/logout"><i data-feather="log-out"></i>Log out</a></button>
            </li>
          </ul>
        </div>
        <div class="d-lg-none mobile-toggle pull-right w-auto"><i data-feather="more-horizontal"></i></div>
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
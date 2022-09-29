<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 3.      홍승조           myPage left 메뉴 생성
* 2022. 8. 3.      윤지영           myPage left 메뉴 재생성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%-- <script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script> --%>
<script src="${cPath}/resources/js/intrestProject/jquery.form.min.js" ></script>

<header class="main-nav">
<%--   <div class="sidebar-user text-center"><a class="setting-primary" href="javascript:void(0)"><i data-feather="settings"></i></a><img class="img-90 rounded-circle" src="${cPath}/resources/assetsPms/images/dashboard/1.png" alt=""><!--회원사진--> --%>
<!--     <div class="badge-bottom"><span class="badge badge-primary">New</span></div><a href="user-profile.html"> -->
<!--       <h6 class="mt-3 f-14 f-w-600">닉네임</h6></a> -->
<!--     <p class="mb-0 font-roboto">회사소개</p> -->
<!--     <ul> -->
<!--       <li><span>진행한 프로젝트 수0</span> -->
<!--         <p>Progress</p> -->
<!--       </li> -->
<!--       <li><span>완료한 프로젝트 수0</span> -->
<!--         <p>Completion</p> -->
<!--       </li> -->
<!--       <li><span>평점0</span> -->
<!--         <p>Grade</p> -->
<!--       </li> -->
<!--     </ul> -->
<!--   </div> -->
  <div class="sidebar-user text-center">
 	<form:form id="leftMenu" action="${cPath}/com/myinfo/left" method="get"></form:form>
  </div>
  <!--프로필 끝-->
  <!--목록 시작-->
  <nav>
    <div class="main-navbar">
      <div class="left-arrow" id="left-arrow"><i data-feather="arrow-left"></i></div>
      <div id="mainnav">
        <ul class="nav-menu custom-scrollbar">
          <li class="back-btn">
            <div class="mobile-back text-end"><span>Back</span><i class="fa fa-angle-right ps-2" aria-hidden="true"></i></div>
          </li>
          <li class="sidebar-main-title">
            <div>
              <h6>MyPage </h6>
            </div>
          </li>
          <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/com/myinfo"><i data-feather="git-pull-request"></i><span>회원정보</span></a></li><!-- data-feather="아이콘 이름 font>feather파일 참조" -->
          <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/com/schedule"><i data-feather="git-pull-request"></i><span>일정관리</span></a></li>
          <li class="dropdown"><a class="nav-link menu-title" href="javascript:void(0)"><i data-feather="layout"></i><span>프로젝트 관리</span></a>
            <ul class="nav-submenu menu-content">
              <li><a href="${cPath }/myinfo/rejectProj">반려된 프로젝트</a></li>
              <li><a href="${cPath }/myinfo/contract/project">프로젝트 계약</a></li>
              <li><a href="${cPath }/myinfo/project">진행/완료 프로젝트</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <div class="right-arrow" id="right-arrow"><i data-feather="arrow-right"></i></div>
    </div>
  </nav>
  <!--목록 끝-->
</header>


<script>
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	var CPATH = "${cPath}";
	
	let sidebar = $(".sidebar-user")
	
	function refreshMemList(){
	$('.sidebar-user').load(location.href+' .sidebar-user');
	}
	
	let leftMenu = $('#leftMenu').ajaxForm({
		beforeSend : function(xhr){xhr.setRequestHeader(header,token);}
		,dataType:"json"
		,success : function(data){
			console.log(data)
			makeprofile(data);
		}
		,error : function(error){
			console.log("실패")
			console.log(error);
		}
	}).submit();
	
	function makeprofile(data){
		var poto;
		let color = '';
		if(data.comGrd == 'GOLD') {
			color = '#ffd700';
		} else if(data.comGrd == 'SILVER') {
			color = '#A3A3A3';
		} else if(data.comGrd == 'BRONZE') {
			color = '#CD7F32';
		} else {
			color = '#24695c';
		}
		
		if(data.comImg == null){
			poto = CPATH+"/resources/assetsPms/images/dashboard/1.png";
		}else{
			poto = CPATH+"/resources/images/"+data.comImg;
		}	
		sidebar.append(
				$("<img>").attr("class","img-90 rounded-circle").attr("src",poto).attr("style","height: 90px").attr("onerror","this.src='${cPath }/resources/assetsPms/images/dashboard/1.png'")
				,$("<a>").attr("href",CPATH+"/com/myinfo").append(
					$("<h6>").attr("class","mt-3 f-14 f-w-600").html(data.comNick).append(
							$("<div>").attr("class","leftGrdDiv").css("color",color).append(
									$("<i>").addClass("fa-sharp fa-solid fa-award")		
								)
							)
				)
				,$("<p>").attr("class","mb-0 font-roboto").html(data.comName)
				,$("<ul>").append(
					$("<li>").append($("<span>").html(data.progress),$("<p>").html("Progress"))		
					,$("<li>").append($("<span>").html(data.completion),$("<p>").html("Completion"))		
					,$("<li>").append($("<span>").html(data.grade),$("<p>").html("Grade"))
				)
			)
	}

</script>  
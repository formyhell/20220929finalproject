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

        <header class="main-nav">
          <nav>
            <div class="main-navbar">
              <div class="left-arrow" id="left-arrow"><i data-feather="arrow-left"></i></div>
              <div id="mainnav">           
                <ul class="nav-menu custom-scrollbar" style="height: calc(100vh - 75px);">
                  <li class="back-btn">
                    <div class="mobile-back text-end"><span>Back</span><i class="fa fa-angle-right ps-2" aria-hidden="true"></i></div>
                  </li>
                  <li class="sidebar-main-title">
                    <div>
                      <h6>PHOS관리자</h6>
                    </div>
                  </li>
                  <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/admin/stats"><i data-feather="home"></i><span>통계</span></a></li><!--data-feather = 아이콘 -->
                   <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/admin/member"><i data-feather="airplay"></i><span>회원관리</span></a></li>
                  <li class="dropdown"><a class="nav-link menu-title link-nav" href="#"><i data-feather="airplay"></i><span>공고관리</span></a>
                    <ul class="nav-submenu menu-content">
                      <li><a href="${cPath }/admin/checkList">검토 리스트</a></li>
                      <li><a href="${cPath }/admin/checkList/require">필수 검토 리스트</a></li>
                      <li><a href="${cPath }/admin/outProjList">공고 리스트</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="nav-link menu-title link-nav" href="#"><i data-feather="layout"></i><span>게시판관리</span></a>
                    <ul class="nav-submenu menu-content">
                      <li><a href="${cPath }/admin/noticeList">공지사항 관리</a></li>
                      <li><a href="${cPath }/admin/communityRepList">커뮤니티 신고 리스트</a></li>
                    </ul>
                  </li>
                  <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/admin/code"><i data-feather="layout"></i><span>공통코드 관리</span></a></li>
                  <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/admin/pms"><i data-feather="layout"></i><span>pms관리</span></a></li>
                    </ul>
                  </li>
                    </ul>
                  </li>
                  <li><a class="nav-link menu-title link-nav" href="#"><i data-feather="headphones"></i><span>Support Ticket</span></a></li>
                </ul>
              </div>
              <div class="right-arrow" id="right-arrow"><i data-feather="arrow-right"></i></div>
            </div>
          </nav>
        </header>
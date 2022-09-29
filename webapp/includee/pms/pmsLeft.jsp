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
                      <h6>PMS             </h6>
                    </div>
                  </li>
                  <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/pms/${projId}"><i data-feather="home"></i><span>종합현황표</span></a></li><!--data-feather = 아이콘 -->
                  <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/pms/${projId}/work"><i data-feather="airplay"></i><span>일감관리</span></a></li>
                  <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/pms/${projId}/report"><i data-feather="layout"></i><span>업무보고</span></a></li>
                  <li class="dropdown"><a class="nav-link menu-title link-nav" href="${cPath }/pms/${projId}/issue"><i data-feather="layout"></i><span>이슈관리</span></a></li>
                    </ul>
                  <li><a class="nav-link menu-title link-nav" href="#"><i data-feather="headphones"></i><span>Support Ticket</span></a></li>
                </ul>
              </div>
              <div class="right-arrow" id="right-arrow"><i data-feather="arrow-right"></i></div>
            </div>
          </nav>
        </header>
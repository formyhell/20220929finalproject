<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      홍승조      관리자 통계 페이지 생성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

<div class="row">
	<div class="col-sm-6 col-xl-3 col-lg-6">
		<div class="card o-hidden border-0">
			<div class="bg-primary b-r-4 card-body">
				<div class="media static-top-widget">
					<div class="align-self-center text-center">
						<i data-feather="database"></i>
					</div>
					<div class="media-body"> 
						<%-- PHOS 총 수입 --%>
						<span class="m-0">Earnings(₩)</span>
						<h4 class="mb-0 counter">${topMap.get("T_PAY") }</h4>
						<i class="icon-bg" data-feather="database"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-6 col-xl-3 col-lg-6">
		<div class="card o-hidden border-0">
			<div class="bg-secondary b-r-4 card-body">
				<div class="media static-top-widget">
					<div class="align-self-center text-center">
						<i data-feather="shopping-bag"></i>
					</div>
					<div class="media-body" onclick="location.href='${cPath }/admin/outProjList'" style="cursor: pointer;">
						<%-- PHOS 총 아웃소싱 프로젝트 수 --%>
						<span class="m-0">Project</span>
						<h4 class="mb-0 counter">${topMap.get("T_OUTPJ") }</h4>
						<i class="icon-bg" data-feather="shopping-bag"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-6 col-xl-3 col-lg-6">
		<div class="card o-hidden border-0">
			<div class="bg-success b-r-4 card-body">
				<div class="media static-top-widget">
					<div class="align-self-center text-center">
						<i data-feather="message-circle"></i>
					</div>
					<div class="media-body">
						<%-- PHOS 총 커뮤니티 게시글 수 --%>
						<span class="m-0" onclick="location.href='${cPath }/community'">Community</span>
						<h4 class="mb-0 counter">${topMap.get("T_COMMU") }</h4>
						<i class="icon-bg" data-feather="message-circle"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-6 col-xl-3 col-lg-6">
		<div class="card o-hidden border-0">
			<div class="bg-info b-r-4 card-body">
				<div class="media static-top-widget">
					<div class="align-self-center text-center">
						<i data-feather="user-plus"></i>
					</div>
					<div class="media-body" onclick="location.href='${cPath }/admin/member'" style="cursor: pointer;">
						<%-- PHOS 총 유저 수 --%>
						<span class="m-0">User</span>
						<h4 class="mb-0 counter">${topMap.get("T_MEM") }</h4>
						<i class="icon-bg" data-feather="user-plus"></i>
					</div>      
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-6 col-md-12 box-col-12">
		<div class="card">
			<div class="card-header pb-0">
				<h5>누적 회원수</h5>
			</div>
			<div class="card-body chart-block">
				<canvas id="memNumChart"></canvas>
			</div>
		</div>
		<div class="card">
			<div class="card-header pb-0">
				<h5>프로젝트 등록건수</h5>
			</div>
			<div class="card-body chart-block">
				<canvas id="projNumChart"></canvas>
			</div>
		</div>
	</div>
	<div class="col-xl-6 col-md-12 box-col-12">
		<div class="card browser-widget">
                  <div class="media card-body">
                    <div class="media-img"><img src="../assets/images/dashboard/chrome.png" alt=""></div>
                    <div class="media-body align-self-center">
                      <div><a href="${cPath }/admin/checkList">
                        <p>공고 검토 </p>
                        <h4><span class="counter">${ckMap.get("ckCount") }</span>건</h4></a>
                      </div>
                      <div><a href="${cPath }/admin/checkList/require">
                        <p>공고 필수 검토 </p>
                        <h4><span class="counter">${ckMap.get("rckCount")}</span>건</h4></a>
                      </div>
                      <div><a href="${cPath }/admin/communityRepList">
                        <p>커뮤니티 신고 </p>
                        <h4><span class="counter">${trepMap.get("TREP")}</span>건</h4></a>
                      </div>
                    </div>
                  </div>
                </div>
		<div class="card">
			<div class="card-header pb-0">
				<h5>skill별 회원수</h5>
			</div>
			<div class="card-body chart-block">
				<canvas id="skillNumChart" height="700"></canvas>
			</div>
		</div>
	</div>
</div>

<%-- 누적 회원 --%>
<script>
	let m_labels = [ 'Jan.', 'Feb.', 'Mar.', 'Apr.', 'May.', 'Jun.', 'Jul.', 'Aug.', 'Sept.', 'Oct.', 'Nov.', 'Dec.'];

	let m_data = {
		labels : m_labels,
		datasets : [ {
			label : 'Gen Member',
			backgroundColor : '#24695c',
			borderColor : '#24695c',
			data : [${genMap.get("01") }, 
					${genMap.get("02") },
					${genMap.get("03") }, 
					${genMap.get("04") }, 
					${genMap.get("05") },
					${genMap.get("06") }, 
					${genMap.get("07") },
					${genMap.get("08") },
					${genMap.get("09") },
					${genMap.get("10") },
					${genMap.get("11") },
					${genMap.get("12") }],
		},
		{
			label : 'Com Member',
			backgroundColor : '#ba895d',
			borderColor : '#ba895d',
			data : [${genMap.get("01") }, 
				${comMap.get("02") },
				${comMap.get("03") }, 
				${comMap.get("04") }, 
				${comMap.get("05") },
				${comMap.get("06") }, 
				${comMap.get("07") },
				${comMap.get("08") },
				${comMap.get("09") },
				${comMap.get("10") },
				${comMap.get("11") },
				${comMap.get("12") }],
		} ]
	};

	let m_config = {
		type : 'line',
		data : m_data,
		options : {
			responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      }
		    }
			
		}
	};
	
  let memNumChart = new Chart(
    document.getElementById('memNumChart'),
    m_config
  );
</script>

<%-- 기술별 회원 --%>
<script>
			  
function makeColor() {
	const r = Math.floor(Math.random() * (256 - 130 + 1)) + 130;
	const g = Math.floor(Math.random() * (256 - 130 + 1)) + 130;
	const b = Math.floor(Math.random() * (256 - 130 + 1)) + 130;
	return `rgb(\${r},\${g},\${b})`;
}

console.log("ran: ", makeColor())

let s_data = {
		  labels: [ <c:forEach items="${skillMap }" var="entry" varStatus="vs">
					  	"${entry.value[0]}",
					</c:forEach> ],
		  datasets: [
		    {
		      label: 'Dataset 1',
		      data: [
		    	  <c:forEach items="${skillMap }" var="entry" varStatus="vs">
				  	"${entry.value[1]}",
				  </c:forEach> ],
		      backgroundColor: [ <c:forEach items="${skillMap }" var="entry">
						    	 	makeColor() ,
								 </c:forEach> ],
		    }
		  ]
		};

let s_config = {
		  type: 'doughnut',
		  data: s_data,
		  plugins: [ChartDataLabels],
		  options: {
		    responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      },
		      datalabels: {
                  color: "black",
                  	formatter: function(value, context) {
                   	return (value > 1) ? value : null <%-- data가 1 미만이면 출력되지 않음 --%>
                   }
               },
// 		      title: {
// 		        display: true,
// 		        text: 'Chart.js Doughnut Chart'
// 		      }
		    }
		  },
		};
let skillNumChart = new Chart(
	    document.getElementById('skillNumChart'),
	    s_config
	  );
</script>

<%-- 월별 프로젝트 등록 수 --%>
<script>
let p_data = {
		labels : m_labels,
		datasets : [ {
			label : 'Outsourcing',
			backgroundColor : '#24695c',
			borderColor : '#24695c',
			borderWidth: 2,
		    borderRadius: 5,
		    borderSkipped: false,
			data : [${outProjMap.get("01") }, 
					${outProjMap.get("02") },
					${outProjMap.get("03") }, 
					${outProjMap.get("04") }, 
					${outProjMap.get("05") },
					${outProjMap.get("06") }, 
					${outProjMap.get("07") },
					${outProjMap.get("08") },
					${outProjMap.get("09") },
					${outProjMap.get("10") },
					${outProjMap.get("11") },
					${outProjMap.get("12") }],
		},
		{
			label : 'PMS',
			backgroundColor : '#ba895d',
			borderColor : '#ba895d',
			borderWidth: 2,
		    borderRadius: 5,
		    borderSkipped: false,
			data : [${genMap.get("01") }, 
				${pmsProjMap.get("02") },
				${pmsProjMap.get("03") }, 
				${pmsProjMap.get("04") }, 
				${pmsProjMap.get("05") },
				${pmsProjMap.get("06") }, 
				${pmsProjMap.get("07") },
				${pmsProjMap.get("08") },
				${pmsProjMap.get("09") },
				${pmsProjMap.get("10") },
				${pmsProjMap.get("11") },
				${pmsProjMap.get("12") }],
		} ]
	};

	let p_config = {
		type : 'bar',
		data : p_data,
		options : {
			responsive: true,
		    plugins: {
		      legend: {
		        position: 'top',
		      }
		    }
			
		}
	};
	
  let projNumChart = new Chart(
    document.getElementById('projNumChart'),
    p_config
  );
</script>

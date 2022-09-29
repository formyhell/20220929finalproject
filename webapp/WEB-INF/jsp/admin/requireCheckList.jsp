<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%--
* [[개정이력(Modification Information)]]
* 	수정일              수정자      	  수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.   조채원     		 컨트롤러 연결
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<style>
.filterDiv:not(:last-child) {
	border-bottom: 1px solid #e6edef;
	margin-bottom: 30px;
}
</style>
<div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <div class="page-header-left">
                    <h3>필수 검토 리스트</h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
	<!-- Modal -->
	<div class="modal fade" id="denyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">반려 사유 입력</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      <form>
	      		<textarea class="form-control input-air-primary" style="margin-bottom:20px" name="projReject" cols="60" rows="3"></textarea>
	        	<input name="projId" style="display:none">
	        <sec:csrfInput/>
	        <input type="submit" class="btn btn-primary" style="float:right;margin-left:10px" id="btn_submit" value="저장" />
	        <button type="button" class="btn btn-secondary" style="float:right" data-bs-dismiss="modal">취소</button>
	      </form>
	      </div>
	    </div>
	  </div>
	</div>

	<div class="row" style="padding: 50px;">
		<div class="col-xl-3 col-50 box-col-6 des-xl-50">
			<table>
				<thead>
					<tr>
						<th colspan="3">
							<h4 style="padding-right: 20px; display: inline-block;">필터링 단어</h4>
						</th>
						<th>
							<button onclick="WordsDel()" class="btn btn-light btn-sm" style="padding-left: 16px; padding-right: 16px;">일괄삭제</button>
						</th>
					</tr>
					<tr style="height: 15px;"></tr>
				</thead>
				<tbody id="filterListBody">
				</tbody>
				<tfoot>
					<tr style="height: 15px;"></tr>
					<tr>
						<form method="post" action="${cPath }/admin/filtering">
							<td colspan="3">
								<sec:csrfInput/>
								<input type="text" name="filterWord" /> 
							</td>
							<td>
								<input type="submit" value="등록" class="btn btn-primary btn-sm"/>
							</td>
						</form>
					</tr>
				</tfoot>
			</table>
		</div>

		<div class="col-xl col-50 box-col-6 des-xl-50">
	        <div class="default-according" id="accordion">
	        </div>
	    </div>
    </div>
	
	<form id="searchForm" action="${cPath}/admin/filtering/delList" method="post">
		<sec:csrfInput/>
		<input type="hidden" name="chkList" />
	</form>


	<script>
	let header = '${_csrf.headerName}';
	let token =  '${_csrf.token}'; 
	
	function approveAlert() {
		Swal.fire({
		      icon: 'success',
		      title: '프로젝트 공고가 승인되었습니다.',
		    });
	}

	function denyAlert() {
		Swal.fire({
		      icon: 'success',
		      title: '프로젝트 공고가 반려되었습니다.',
		    });
	}

	function errerAlert() {
		Swal.fire({
			icon: 'error',
		      title: '처리에 실패했습니다. 다시 시도하세요.',
		    });
	}
	
	$.ajax({
		url : "${cPath}/admin/checkList/require",
		method : "get",
		dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
		,
		success : function(resp, status, jqXHR) {
			let projList = resp;
			let divTags = [];
			if (projList && projList.length > 0) {
				$(projList).each(function(index, proj) {
					$("#accordion").append(makeCard(proj));
					$(proj.filterList).each(function(index, filter) {
						let cardDiv = $("p[class=" + proj.projId + "]").siblings(".collapse").children(".card-body");
						if(proj.projTitle.includes(filter)) {
							cardDiv.append(
							  $("<div>").addClass("filterDiv").append(
									$("<strong>").addClass("txt-primary").css("margin-right","10px").text("프로젝트 제목"),
									$("<p>").addClass("projTitle").text(proj.projTitle)
							   )
							);
							let pTag = cardDiv.children(".filterDiv").children(".projTitle");
							pTag.html(  pTag.text().replace(filter, "<span class='txt-danger'>"+filter+"</span>") );
						} if(proj.projType.includes(filter)) {
							cardDiv.append(
							  $("<div>").addClass("filterDiv").append(
									$("<strong>").addClass("txt-primary").css("margin-right","10px").text("프로젝트 상태"),
									$("<p>").addClass("projType").text(proj.projType)
							   )
							);
							let pTag = cardDiv.children(".filterDiv").children(".projType");
							pTag.html(  pTag.text().replace(filter, "<span class='txt-danger'>"+filter+"</span>") );
						} if(proj.projContent.includes(filter)) {
							cardDiv.append(
								$("<div>").addClass("filterDiv").append(
									$("<strong>").addClass("txt-primary").css("margin-right","10px").text("프로젝트 본문"),
									$("<p>").addClass("projContent").text(proj.projContent)
								)
							);
							let pTag = cardDiv.children(".filterDiv").children(".projContent");
							pTag.html(  pTag.text().replace(filter, "<span class='txt-danger'>"+filter+"</span>") );
						}  if(proj.projQualifi.includes(filter)) {
							cardDiv.append(
								$("<div>").addClass("filterDiv").append(
									$("<strong>").addClass("txt-primary").css("margin-right","10px").text("프로젝트 자격요건"),
									$("<p>").addClass("projQualifi").text(proj.projQualifi)
								)
							);
							let pTag = cardDiv.children(".filterDiv").children(".projQualifi");
							pTag.html(  pTag.text().replace(filter, "<span class='txt-danger'>"+filter+"</span>") );
						}  
						
					});
				});
			} 
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
	let makeCard = function(proj) {
		return $("<div>").addClass("card").append(
					$("<p>").addClass(proj.projId).css("display","none").text(proj.projId),
					$("<div>").addClass("card-header").append(
						$("<h5>").addClass("mb-0").append(
							$("<button>").addClass("btn btn-link collapsed").attr({
								"data-bs-toggle" : "collapse",
								"data-bs-target" : "#collapseicon",
								"aria-expanded" : "false"
							}).text(proj.projTitle)	
						)
					),
					$("<div>").addClass("collapse").attr({
						"id" : "collapseicon",
						"aria-labelledby" : "collapseicon",
						"data-bs-parent" : "#accordionoc",
						// "onclick" : "location.href='${cPath}/admin/checkList/require/" + proj.projId + "/form'"
					}).append(
						$("<div>").addClass("card-body"),
						$("<div>").addClass("col-md-6").css({
							"float" : "right",
							"margin-right" : "10px",
							"margin-bottom" : "10px"
						}).append(
							$("<a>").addClass("btn btn-danger btn-sm btn-deny").css("float","right").attr({
								"data-bs-toggle" : "modal",
								"data-bs-target" : "#denyModal"
							}).text("반려"),
							$("<a>").addClass("btn btn-primary btn-sm btn-approve").css({"float":"right","margin-right":"10px"}).text("승인")
						)
					)
			);
	}
	$(document).on("click", ".btn-approve", function() {
		let projId = $(this).closest(".collapse").siblings("p").text();
		 $.ajax({
			url : "${cPath}/admin/checkList/require",
			method : "put",
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify({
				projId : projId
			}),
			dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
			,
			beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
			success : function(resp, status, jqXHR) {
				let proj = resp;
				if(proj) {
					approveAlert();
					$("p[class=" + proj.projId + "]").parent(".card").remove();
					send("[아웃소싱공고]" + proj.projTitle + "에 대한 공고가 승인되었습니다.",proj.projRegist,"#");
				} else {
					errerAlert();
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		}); 
	});
	
	$(document).on("click", ".btn-deny", function() {
		let id = $(this).closest(".collapse").siblings("p").text();
		$("input[name=projId]").val(id);
	});
	
	$(document).on("click", "#btn_submit", function(event) {
		event.preventDefault();
		let projId = $("input[name=projId]").val();
		let projReject = $("textarea[name=projReject]").val();
		
		$.ajax({
			url : "${cPath}/admin/checkList/require",
			method : "delete",
			contentType: 'application/json; charset=utf-8',
			data : JSON.stringify({
				projId : projId,
				projReject : projReject
			}),
			dataType : "json" // text, html, json, xml, script -> main type : text, 파일 업로드 처리를 비동기로? (FormData)
			,
			beforeSend : function(xhr)
			{
			   xhr.setRequestHeader(header,token);
			},
			success : function(resp, status, jqXHR) {
				let proj = resp;
				if(proj){
					denyAlert();
					$('#denyModal').modal('hide');
					$("p[class=" + proj.projId + "]").parent(".card").remove();
					send("[아웃소싱공고]" + proj.projTitle + "에 대한 공고가 반려되었습니다.",proj.projRegist,"#");
				} 
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
				errerAlert();
			}
		}); 
	});

	<%-- 필터링 단어 --%>	
	var filterList;
	let filterListBody = $("#filterListBody");
	let makeFilterSingleTr = function(index, word) {
		return $("<tr>").append(
			$("<td>").html(word["RNUM"]).attr("style","width: fit-content;"),
			$("<td>").html(word["FILTER_WORD"]),
			$("<td>").append(
					$("<input>").attr({
						"class": "checkbox_animated",
						"id": `chk-ani\${word["FILTER_NO"]}`,
						"type": "checkbox"
					})),
			$("<td>").append(
				$("<form>").attr({
					"action": `${cPath }/admin/filtering/\${word["FILTER_NO"] }`,
					"method": "post"
				}).append(
					`<sec:csrfInput/>`,
					$("<input>").attr({
						"type": "hidden",
						"name": "_method",
						"value": "delete"
					}),
					$("<input>").attr({
						"type": "submit",
						"class": "btn btn-light btn-sm",
						"value": "삭제"
					})
				)
			)
		);
	}
	<%-- 필터링 단어리스트 --%>
	$.ajax({
		url : "${cPath}/admin/filtering",
		method : "get",
		dataType : "json",
		beforeSend : function(xhr) { 
			xhr.setRequestHeader(header,token);
		},
		success : function(resp, status, jqXHR) {
			let trTags = [];
			let wordList = resp;
			
			if (wordList && wordList.length > 0) {
				$(wordList).each(function(index, word) {
					console.log("word: ", word);
					trTags.push(makeFilterSingleTr(index, word));
				});
			}else{
				let trTag = $("<tr>").html(
						$("<td>").attr("colspan", "2").html(
								"등록된 필터링 단어가 없습니다."));
				trTags.push(trTag);
			}
			filterListBody.html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	<%-- 일괄 삭제 --%>
	function WordsDel() {
		let ret = $('input[class=checkbox_animated]');
		let chkList = [];
		$('input[class=checkbox_animated]').each(function(index, chkbox) {
			if(chkbox.checked){
				console.log(chkbox["id"].substring(7));
				chkList.push(chkbox["id"].substring(7));
			}
		})
		if(chkList!=null && chkList.length>0){
			$("#searchForm").find("[name=chkList]").val(chkList);
			$("#searchForm").submit();
		}
	}
	</script>	
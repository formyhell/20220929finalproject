<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
tr.trRow:hover { background-color: #e6edef; }
</style>   

<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message }");
	</script>
	<c:remove var="message" scope="session" />
</c:if>
 
 <div class="container-fluid">
	<div class="card">
		<div class="row" style="padding: 50px;">
			<div class="col-xl col-50 box-col-6 des-xl-50">
				<h4>일반회원</h4>
				<br>
				<!-- 검색 -->
				<div id="searchUI" class="form-field">
					<div class="row">
						<div class="col-sm-3" style="padding: 0px; width: auto;">
							<div class="mb-3" style="margin-left: 20px; padding-top: 10px;">
								<div>
									<label class="me-3"> <input type="radio"
										name="searchMemType" checked="checked" value=""> 전체
									</label> <label class="me-3"> <input type="radio"
										name="searchMemType" value="ROLE_GENMEM"> 일반
									</label> <label class="me-3"> <input type="radio"
										name="searchMemType" value="ROLE_COMMEM"> 기업
									</label>
								</div>
							</div>
						</div>
						<div class="col-sm-1" style="padding-right: 0;">
							<div class="mb-3">
								<form:select id="searchType" path="simpleCondition.searchType"
									class="form-select form-control">
									<form:option value="">전체</form:option>
									<form:option value="memId" label="ID" />
									<form:option value="memName" label="이름" />
									<form:option value="memNick" label="닉네임" />
								</form:select>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="mb-3">
								<form:input id="searchWord" class="form-control"
									style="border: 1px solid #DEDEDE;" placeholder="Search Here"
									path="simpleCondition.searchWord" />
							</div>
						</div>
						<div class="col-sm-3">
							<div class="mb-3">
								<input type="button" id="searchBtn"
									class="btn btn-outline-primary" value="검색">
							</div>
						</div>
					</div>
				</div>

				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col" style="width: 10px !important;"></th>
							<th scope="col">회원ID</th>
							<th scope="col">이름</th>
							<th scope="col">닉네임</th>
							<th scope="col">회원타입</th>
							<th scope="col">평점</th>
							<th scope="col">등급</th>
							<th scope="col" style="width: 4% !important;">탈퇴</th>
							<th scope="col" style="width: 4% !important;">활동</th>
							<th scope="col" style="width: 6% !important;">
								<button class="btn btn-light btn-sm p-1" type="button" data-original-title="btn btn-light btn-sm p-1"
										style="color: black; padding: 0;" onclick="memDisabled();">회원정지</button></th>
						</tr>
					</thead>
					<tbody>
						<c:set var="memList" value="${pagingVO.dataList }" />
						<c:choose>
							<c:when test="${not empty memList }">
								<c:forEach items="${memList }" var="mem">
									<tr class="trRow">
										<td onClick="memModalOpen('${mem['MEM_ID']}','${mem['MEM_TYPE']}')" style="cursor: pointer;">${mem["RNUM"] }</td>
										<td onClick="memModalOpen('${mem['MEM_ID']}','${mem['MEM_TYPE']}')" style="cursor: pointer;">${mem["MEM_ID"] }</td>
										<td onClick="memModalOpen('${mem['MEM_ID']}','${mem['MEM_TYPE']}')" style="cursor: pointer;">${mem["MEM_NAME"] }</td>
										<td onClick="memModalOpen('${mem['MEM_ID']}','${mem['MEM_TYPE']}')" style="cursor: pointer;">${mem["MEM_NICK"] }</td>
										<td onClick="memModalOpen('${mem['MEM_ID']}','${mem['MEM_TYPE']}')" style="cursor: pointer;">${mem["MEM_TYPE"].substring(5,8) }</td>
										<td onClick="memModalOpen('${mem['MEM_ID']}','${mem['MEM_TYPE']}')" style="cursor: pointer;">${mem["MEM_RATING"] }</td>
										<td onClick="memModalOpen('${mem['MEM_ID']}','${mem['MEM_TYPE']}')" style="cursor: pointer;">${mem["MEM_GRD"] }</td>
										<td style="padding-left: 1.5%;">
											<c:if test="${mem['MEM_DELETE']==1 }">
												X
											</c:if>
										</td>
										<td style="padding-left: 1.5%;">
											<c:if test="${mem['MEM_ENABLED']==0 }">
												X
											</c:if>
										</td>
										<td style="padding-left: 2%;"><input class="checkbox_animated" type="checkbox"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8">회원이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="10">
								<div class="pagingArea pagination justify-content-center pagination-primary">
									${pagingVO.pagingHTMLBS }</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- 상세 조회 폼 -->
<div id="selectModal" class="modal fade" >
	<div class="modal-dialog" style="max-width: 900px !important;">
		<div class="modal-content" style="width: 900px;">
			<div class="modal-header">
				<h4>회원정보</h4>
				<button type="button" class="btn" data-dismiss="modal"
					onclick="closeModal()">
					<span aria-hidden="true">&times;</span> <span class="sr-only">close</span>
				</button>
			</div>
			<div id="modalBody" class="modal-body"></div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>
<form:form id="searchForm" modelAttribute="simpleCondition" action="${cPath }/admin/member" method="get">
	<input type="hidden" name="page" />
	<input type="hidden" name="searchMemType" />
	<form:input type="hidden" path="searchType" />
	<form:input type="hidden" path="searchWord" />
</form:form>
<form:form id="disabledForm" action="${cPath}/admin/member/disabled" method="post">
		<input type="hidden" name="genChkList" />
		<input type="hidden" name="comChkList" />
</form:form>
<form:form id="enabledForm" action="${cPath}/admin/member/enabled" method="post">
		<input type="hidden" name="memId" />
		<input type="hidden" name="memType" />
</form:form>
<script>
	let searchForm = $("#searchForm");
	$(":radio[name='searchMemType'][value='${searchMemType}']").attr('checked', true);

	let pagingArea = $(".pagingArea").on("click", "a", function(event) {
		let page = $(this).data("page");
		let searchMemType = $('input[name="searchMemType"]:checked').val();
		searchForm.find("[name=page]").val(page);
		searchForm.find("[name=searchMemType]").val(searchMemType);
		searchForm.submit();
	});

	let searchUI = $("#searchUI").on("click", "#searchBtn", function(event) {
		searchForm.get(0).reset();
		let searchType = $("#searchType").val();
		let searchWord = $("#searchWord").val();
		let searchMemType = $('input[name="searchMemType"]:checked').val();
		searchForm.find("[name=searchType]").val(searchType);
		searchForm.find("[name=searchWord]").val(searchWord);
		searchForm.find("[name=searchMemType]").val(searchMemType);
		searchForm.submit();
	});

	function memModalOpen(memId, memType) {
		console.log("memId", memId);
		console.log("memType", memType);
		let data = {
			memId:memId ,
			memType:memType
		}
		if(memType == "ROLE_GENMEM"){
			$.ajax({
				type:"GET",
				url: "${cPath}/admin/member/gen",
				data: data,
				success: function(result) {
// 					console.log("result: ", result);
// 					console.log("genId: ", result.genId);
					console.log("enabled: ", result.enabled);
					$("#modalBody").children().remove();
					$(".modal-footer").children().remove();
					makeGenModal(result);
					if(result.enabled==0 && result.genDelete==0){
						makeEnabledButton(result.genId, "gen");
					}
					makeCancelButton();
					
					
			},
				error:function(request, status, err){
					console.log(request);
					console.log(status);
					console.log(err);				
				}
			});
			
		}else{
			$.ajax({
				type:"GET",
				url: "${cPath}/admin/member/com",
				data: data,
				success: function(result) {
					$("#modalBody").children().remove();
					$(".modal-footer").children().remove();
					makeComModal(result);
					if(result.enabled==0 && result.comDelete==0){
						makeEnabledButton(result.comId, "com");
					}
					makeCancelButton();
			},
				error:function(request, status, err){
					console.log(request);
					console.log(status);
					console.log(err);				
				}
			});
		}
		$('#selectModal').modal('show');
	}
	
	
	let makeGenModal = function(genMember) {
		let deletedate = genMember.genDeletedate;
		if(deletedate!=null){
			deletedate = genMember.genDeletedate.substr(0,10);
		}
		$("#modalBody").append(
			$("<div>").attr("class","row").append(
				makeDiv("회원ID",genMember.genId)
				, makeDiv("회원명",genMember.genName)
				, makeDiv("닉네임",genMember.genNick)
			),
			$("<div>").attr("class","row").append(
				makeDiv("생년월일",genMember.genBirth.substr(0,10))
				, makeDiv("가입일",genMember.genJoindate.substr(0,10))
				, makeDiv("탈퇴일",deletedate)
			),
			$("<div>").attr("class","row").append(
				makeDiv("이메일",genMember.genMail)
				, makeDiv("전화번호",genMember.genHp)
				, makeDiv("탈퇴여부",genMember.genDelete)
			),
			$("<div>").attr("class","row").append(
				makeDiv("평점",genMember.genRating)
				, makeDiv("등급",genMember.genGrd)
				, makeDiv("활동",genMember.enabled)
			)
		);
	}
	
	let makeComModal = function(comMember) {
		let deletedate = comMember.comDeletedate;
		if(deletedate!=null){
			deletedate = comMember.comDeletedate.substr(0,10);
		}
		$("#modalBody").append(
				$("<div>").attr("class","row").append(
					makeDiv("회원ID",comMember.comId)
					, makeDiv("회원명",comMember.comName)
					, makeDiv("닉네임",comMember.comNick)
				),
				$("<div>").attr("class","row").append(
					makeDiv("전화번호",comMember.comHp)
					, makeDiv("가입일",comMember.comJoindate.substr(0,10))
					, makeDiv("탈퇴일",deletedate)
				),
				$("<div>").attr("class","row").append(
					makeDiv("탈퇴여부",comMember.comDelete)
					, makeDiv("평점",comMember.comRating)
					, makeDiv("등급",comMember.comGrd)
				),
				$("<div>").attr("class","row").append(
					makeDiv("활동",comMember.enabled)
				),$("<br>"),
				$("<div>").attr("class","row").append(
					makeDiv("회사명",comMember.comComname)
					, makeDiv("회사메일",comMember.comMail)
					, makeDiv("회사전화번호",comMember.comComtel)
				),
				$("<div>").attr("class","row").append(
					makeDiv("회사대표자명",comMember.comComceo)
					, makeDiv("사업자등록번호",comMember.comCbr)
					, makeDiv("개업일자",comMember.comOpendate.substr(0,10))
				)
			);
	}	
	
	let makeDiv = function(m_label,m_value){
		let rtnDiv = $("<div>").attr("class","col-sm-4").append(
						$("<div>").attr("class","mb-3 row").append(
							$("<label>").attr("class","col-sm-5 col-form-label").text(m_label) ,
							$("<div>").attr({"class":"col-sm-7","style":"padding-top: 7px;"}).html(m_value) 
						) 
					)
		return 	rtnDiv;		
	}
	
	let makeEnabledButton = function(memId, memType) {
		$(".modal-footer").append(
			$("<button>").attr({
				"type":"button",
				"class":"btn btn-primary",
				"onclick":"memEnabled('" + memId + "','" + memType + "')"
			}).html("회원 활성화")
		)
	}
	let makeCancelButton = function() {
		$(".modal-footer").append(
			$("<button>").attr({
				"type":"button",
				"class":"btn",
				"data-dismiss":"modal",
				"onclick":"closeModal()"
			}).html("취소")
		)
	}
	
	function closeModal() {
		$('#selectModal').modal('hide');
	}
	
	<%-- 일괄 정지 --%>
	function memDisabled() {
		let ret = $('input[class=checkbox_animated]');
		let genChkList = [];
		let comChkList = [];
		
		$('input[class=checkbox_animated]').each(function(index, chkbox) {
			if(chkbox.checked){
				if(chkbox.parentNode.parentNode.children[4].innerHTML=="GEN"){
					genChkList.push(chkbox.parentNode.parentNode.children[1].innerHTML);
				}else{
					comChkList.push(chkbox.parentNode.parentNode.children[1].innerHTML);
				}
			}
		})
		if((genChkList!=null && genChkList.length>0) || (comChkList!=null && comChkList.length>0)){
			$("#disabledForm").find("[name=genChkList]").val(genChkList);
			$("#disabledForm").find("[name=comChkList]").val(comChkList);
			let title="";
			if(genChkList!=null && genChkList.length && comChkList!=null && comChkList.length){
				title = genChkList + "," + comChkList;
			}else if(genChkList!=null && genChkList.length){
				title = genChkList;
			}else if(comChkList!=null && comChkList.length){
				title = comChkList;
			}
			Swal.fire({
				title: '[' + title + '] <br> 활동을 정지하시겠습니까?',
		        icon: 'warning',
		        showCancelButton: true,
		        confirmButtonColor: '#3085d6',
		        cancelButtonColor: '#d33',
		        confirmButtonText: '확인',
		        cancelButtonText: '취소'
		    }).then((result) => {
		        if (result.isConfirmed) {
		        	$("#disabledForm").submit();
		        }
		    })
		}else{
			warningAlert("회원을 선택해주세요.");
			return;
		}
		
	}
	<%-- 회원 활성화 --%>
	function memEnabled(memId,memType) {
		$("#enabledForm").find("[name=memId]").val(memId);
		$("#enabledForm").find("[name=memType]").val(memType);
		Swal.fire({
			title: '[' + memId + '] <br> 님을 활성화하시겠습니까?',
	        icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '확인',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	$("#enabledForm").submit();
	        }
	    })
	}
	<%-- 실패 alert창 --%>
	function warningAlert(msg) {
		Swal.fire({ 
	         icon: 'warning',
	         title: msg
	     });
	}
	<%-- 성공 alert창 --%>
	function successAlert(msg){
		Swal.fire({
	        icon: 'success',
	        title: msg
	    });
	}


</script>
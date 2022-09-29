<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 25.      홍승조      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<style>
#mymodal {
	position: fixed;
	width: 100%;
	height: 100%;
	left: 0;
	top: 0;
	z-index: 1000;
	background-color: rgba(107, 107, 107, 0.8); /* 반투명 */
	display: none; /* 첨엔 안 보이깅*/
}

.modal-content {
	position: relative;
	left: 750px;
	top: 100px;
}

.pmstable {
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	height: 300px;
}

th, td {
	text-align: center;
}

.card-header{
	padding: 10px;
	padding-left: 15px;
}

</style>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<h2 style="text-align : center;">${PMSProject.projName }</h2>
					</span>
				</div>
					<br><br><br>
				<div class="table-responsive" style="height: 450px;">
					<table class="pmstable" border="1">
						<tr>
							<th>프로젝트 이름</th>
							<td>${PMSProject.projName }</td>
							<th>프로젝트 설계자</th>
							<td>${PMSProject.projArchi }</td>
						</tr>
						<tr>
							<th>시작일</th>
							<td>${PMSProject.projSdate }</td>
							<th>종료일</th>
							<td>${PMSProject.projFdate }</td>
						</tr>
						<tr>
							<th colspan="2">아웃소싱 프로젝트</th>
							<td colspan="2">${PMSProject.projOutproj }</td>
						</tr>
						<tr>
							<th colspan="2">상태</th>
							<td colspan="2">${PMSProject.projState }</td>
						</tr>
						<c:if test="${role == 'ROLE_GENMEM'}">
						<tr style="border: none;">
							<td colspan="4">
								<button class="btn-blueOcen" style="width: 40%" onclick="f_modalOpen()">프로젝트 참가하기</button>
							</td>
							<td>
						 <!-- Modal -->
								<div id="mymodal">
									<div class="modal-content" style="width: 450px; height: 180px;">
										<h3>프로젝트 키 입력</h3>
										<form action="${cPath }/pmsProject/join" method="post">
											<sec:csrfInput/>
											<input type="hidden" name="projId" value="${PMSProject.projId }" />
											<input type="text" class="form-control" name="projKey" placeholder="프로젝트 키"/>
											<br>
											<input type="button" class="btn-grayDay" value="취소"  onclick="f_check()" style="float: right; border: none;"/>
											<input type="submit" class="btn-blueOcen" data-href="${cPath }/pmsProject/join" value="확인" style="float: right; border: none;"/>
										</form>
									</div>
								</div>
							</td>
						</tr>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
function f_modalOpen(){
    mymodal.style.display="block";
}
function f_check(){
    mymodal.style.display="none";
}

</script>
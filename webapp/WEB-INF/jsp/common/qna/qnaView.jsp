<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      홍승조      컨트롤러 생성
* 2022. 8. 9.      고혜인      내용 추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="${cPath}/resources/assetsPms/js/jquery-3.5.1.min.js" type="text/javascript"></script>
<link href="${cPath }/resources/css/pre/preStyle.css" rel="stylesheet">

<!-- Intro Section -->
<!-- QNA Section -->
<div id="services-section" class="pt-xs-60" style="padding-top: 5vh">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="block-title v-line mb-45">
					<h2>
						Q<span>&</span>A
					</h2>
					<p class="italic">질문 게시판</p>
				</div>
				<div class="col-sm-12 blog-post-hr post-section">
					<div class="blog-post mb-30">
						<div class="post-meta">

							<span>by <c:out value="${qna.qnaWriter }" />,</span> 
							<span><c:out value="${qna.qnaDate }" /></span>
							<div class="float-right">
								<security:authorize access="isAuthenticated()">
									<!--  						작성자에게만 수정 삭제 버튼이 보임 -->
									<security:authentication property="principal" var="authMember" />
									<c:if test="${authMember.realMember.memType.get(0) eq 'ROLE_GENMEM' }">
										<c:if test="${qna.qnaWriter eq authMember.realMember.genNick }">
											<button onclick="location='${cPath }/qna/${qna.qnaNo }/form'" class="btn btn-blueOcean">수정</button>


											<form:form action="${cPath }/qna/${qna.qnaNo}" method="post" modelAttribute="qna" style="display: inline-block;" id="delForm">
												<input type="hidden" name="_method" value="delete" />

												<input type="submit" value="삭제" data-href="${cPath }/qna/${qna.qnaNo }" class="btn btn-grayDay" id="delBtn" />
												<form:input type="hidden" path="qnaNo" id="qnaNo" value="${qna.qnaNo }" />
											</form:form>
										</c:if>
									</c:if>
									<c:if test="${authMember.realMember.memType.get(0) eq 'ROLE_COMMEM' }">
										<c:if test="${qna.qnaWriter eq authMember.realMember.comNick }">
											<button onclick="location='${cPath }/qna/${qna.qnaNo }/form'" class="btn btn-blueOcean">수정</button>

											<form:form action="${cPath }/qna/${qna.qnaNo}" method="post" modelAttribute="qna" style="display: inline-block;" id="delForm">
												<input type="hidden" name="_method" value="delete" />

												<input type="submit" value="삭제" data-href="${cPath }/qna/${qna.qnaNo }" class="btn btn-grayDay" id="delBtn"/>
												<form:input type="hidden" path="qnaNo" id="qnaNo" value="${qna.qnaNo }" />
											</form:form>
										</c:if>
									</c:if>
								</security:authorize>
							</div>

							<div class="post-header" style="color: black;">
								<h2>
									${qna.qnaTitle }
								</h2>
							</div>
							<div class="post-entry" style="color: black; min-height: 300px; text-align: left;">
								<pre><c:out value="${qna.qnaContent }"/></pre>
							</div>
						</div>
						<hr />

						<div class="clearfix"></div>

						<!-- 댓글 -->
						<div class="post-comment mtb-30">

							<div id="replyView">
								<!-- 댓글 보는 화면(다 보임) -->
							</div>

							<!-- 댓글 수정창(관리자만) -->
							<form method="post" id="repUpdate" style="display: none">
								<input type="hidden" name="_method" value="put">
								<div class="col-md-12">
									<input type="text" class="input-lg form-full" placeholder="제목"
										name="repTitle" id="upRepTitle" required />
									<textarea placeholder="내용" name="repContent" id="upRepContent"
										class="form-full" required></textarea>
								</div>
								<div class="col-md-12">
									<button type="button" class="btn btn-blueOcean" id="repUpBtn">수정</button>
									<button type="button" class="btn btn-grayDay"
										id="repUpCancelBtn">취소</button>
								</div>
							</form>


						</div>
						<div class="clearfix"></div>

						<%-- 					<c:if test="${qna.qnaAnswer eq 0 }"> --%>
						<%-- 댓글 입력창 : 관리자에게만 보임 --%>
						<security:authorize access="isAuthenticated()">
							<security:authentication property="principal" var="authMember" />
							<c:if
								test="${authMember.realMember.memType.get(0) eq 'ROLE_ADMIN' }">
								<form method="post" id="repInput">
									<security:csrfInput />

									<input type="hidden" id="repAdmin" name="repAdmin" value="${authMember.realMember.memId }" />
									<!-- 														<input type="text" id="repAdmin" name="repAdmin"  /> -->
									<div class="mtb-60">
										<div class="repForm">
											<div class="row mt-30">
												<div class="col-md-12">
													<input type="text" id="repParent" name="repParent" value="${qna.qnaNo }"> <input type="text" class="input-lg form-full" placeholder="제목" name="repTitle" id="repTitle" required />
													<textarea placeholder="내용" name="repContent" id="repContent" class="form-full" required></textarea>
												</div>
												<div class="col-md-12">
													<button type="button" class="btn-text" id="repInBtn">등록</button>
												</div>
											</div>
										</div>
									</div>

								</form>
								<!-- 댓글 입력 -->
							</c:if>
						</security:authorize>
						<%-- 					</c:if> --%>
					</div>

				</div>
			</div>
		</div>

	</div>
</div>
<script>
	$(document).ready(function() {
		getRep();
	});

	let replyView = $("#replyView");
	let repParent = '${qnaNo}'; //값 확인하기
	let url = "${cPath}/qna/"+repParent+"/reply";

	let header = '${_csrf.headerName}';
	let token =  '${_csrf.token}'; 
	

	
	//========== 댓글 불러오기 ==========
	
	function getRep(){

		$.ajax({
			type:'get',
			url:url,
			dataType:'json',
			success:function(resp){
				let rep = resp.result;
				console.log("답변 여부 : ", resp);
				let div = $("<div id='repView'>").append("<div class='comment-detail'>");
				if(rep == 'no'){
					div.html("<h6>답변이 없습니다</h6>")
				} else {
// 					$(rep).each(function() {
						div.append(
                        	$("<p>").html("관리자&nbsp").append(
                            	$("<span>").addClass("post-meta").attr("id","repDate").text(rep.repDate)
                         	),
                         	$("<div>").append(
	                            $("<h6>").attr("id", "repTitle").text(rep.repTitle),
	                            $("<pre>").attr("id", "repContent").text(rep.repContent)
							<security:authorize access="isAuthenticated()">    
							<security:authentication property="principal" var="authMember" />
	                        <c:if test="${authMember.realMember.memType.get(0) eq 'ROLE_ADMIN'}">
	                            ,$("<button>").attr({
	                            	"type":"button",
	                            	"id": "upModeBtn",
	                                "class": "btn btn-blueOcean",
	                                "data-rno":rep.repNo
	                            }).html("수정"),
	                            $("<button>").attr({
	                            	"type":"button",
	                            	"id": "repDelBtn",
	                            	"class": "btn btn-grayDay",
	                                "data-rno":rep.repNo
	                            }).html("삭제")                         			
                         	</c:if>	
                        	</security:authorize>
                         	).attr("id","data")
                        );
// 					});	
				}
				replyView.html(div);
			},
			error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);
			}
		});
	}
	//========== 댓글 불러오기 ==========

</script>
<script src="${cPath }/resources/js/board/delAlert.js"></script>
<script src="${cPath }/resources/js/board/qna/qnaView.js"></script>
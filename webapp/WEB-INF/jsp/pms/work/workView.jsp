<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 1.      작성자명      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<style>
table {
	margin-left: auto;
	margin-right: auto;
}

span {
	margin: 0px !important;
	display:inline !important;
}

.jo_div_css {
	margin: 10px;
}
.theme-form .col-form-label{
	color: black !important;
}
.col-sm-9 {
	padding-top: 7px;
	padding-bottom: 7px;
	color: black;
}

</style>
<sec:authentication property="principal" var="authMember" /> 
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<span>BY ${work.workRegist }, </span> <span id="workDate">${work.workDate }</span>
					<br><br>
					<h5>${work.workTitle }</h5>
				</div>
				<div class="card-body">
					<div class="form theme-form">
						<div class="row">
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">일감 이름 </label>
										<div class="col-sm-9">${work.workTitle }</div>
									</div>	
								</div>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">담당자</label>
										<div class="col-sm-9">${work.chargerName }</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">일감 작성자 </label>
										<div class="col-sm-9">${work.registName }</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">등록일</label>
										<div class="col-sm-9">${work.workDate.substring(0,10) }</div>
									</div>	
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">시작일</label>
										<div class="col-sm-9">${work.workSdate }</div>
									</div>	
								</div>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">종료일</label>
										<div class="col-sm-9">${work.workFdate }</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">일감 우선순위</label>
										<div class="col-sm-9">${work.prorityName }</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">일감 관리자</label>
										<div class="col-sm-9">${work.managerName }</div>
									</div>
								</div>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">일감 유형</label>
										<div class="col-sm-9">${work.typeName }</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">상위 일감</label>
										<div class="col-sm-9">${work.workParentNm }</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">	
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">상태</label>
										<div class="col-sm-9">${work.stateName }</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="mb-3">
									<div class="mb-3 row">
										<label class="col-sm-3 col-form-label">일감 진행도</label>
										<div class="col-sm-9">${work.workProgress }</div>
									</div>
								</div>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-12">
								<div class="mb-3">
									<label>내용</label>
									<div class="jo_div_css">${work.workContent }</div>
								</div>
							</div>
						</div>	
							<div class="row">
								<div class="col-sm">
									<div class="mb-3">
										<label>첨부파일</label>
										<div class="yu_div_css">
											<c:if test="${not empty work.attatchList }">
												<c:forEach items="${work.attatchList }" var="attatch"
													varStatus="vs">
													<a
														href="${cPath}/pms/${work.workProj}/work/${attatch.attId}/attatch">${attatch.attFilename }</a>
													<br>
													<c:if test="${not vs.last }">
													</c:if>
												</c:forEach>
											</c:if>
										</div>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col">
									<div class="text-end">
											<button class="btn btn-primary"onclick="location='${cPath}/pms/${work.workProj}/work/${work.workId}/form'">수정</button>
											<form:form action="${cPath}/pms/${work.workProj }/work/${work.workId }"
											method="post" modelAttribute="work" style="display: inline-block;">
												<input type="hidden" name="_method" value="delete" />
												<input type="submit"
													data-href="${cPath}/pms/${work.workProj }/work/${work.workId }" class="btn btn-info"
													value="삭제" />

										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<h5>댓글</h5><br>
					<form method="post" id="repInsertFormID">
						<div class="form theme-form">
							<div class="row">
								<div class="col-sm-11">
									<div class="mb-3">
										<sec:csrfInput />
										<input type="hidden" name="repDate" id='currentDateR' />
										<input type="hidden" name="repWriter" value="${authMember.realMember.memId }" />
										<input type="hidden" name="repIssue" value="${work.workId }" />
										<textarea placeholder="내용을 입력해주세요." id="repContentID" name="repContent" class="form-control" rows="3" style="resize: none;" required></textarea>
									</div>
								</div>
								<div class="col-sm-1">
									<div class="mb-3">
										<button type="submit" class="btn btn-primary" id="repInBtn">등록</button>
									</div>
								</div>
							</div>
						</div>			
					</form>
				</div>
				<div class="card-body" style="padding-top: 0;">
					<div class="form theme-form" id="replyView">
					
					</div>
				</div>
				<div class="card-foot">
					<div id="pagingID" class="pagingArea pagination justify-content-center pagination-primary">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
let header = '${_csrf.headerName}';
let token =  '${_csrf.token}'; 

var repInsertForm = $('#repInsertFormID');
var paging = $('#pagingID');
var currentPage = 1;
var replyLength = 0;
let url = "${cPath}/pms/${work.workProj}/issue/${work.workId}/reply";
let replyView = $("#replyView");

document.getElementById('currentDateR').value = new Date().toISOString().substring(0, 10);

<%-- 댓글 리스트 불러오기 --%>
var page = 1;
$(document).ready(function() {
	getRep(page);
});

<%-- form데이터 serialize  --%>
jQuery.fn.serializeObject = function() {
	    var obj = null;
	    try {
	        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
	            var arr = this.serializeArray();
	            if (arr) {
	                obj = {};
	                jQuery.each(arr, function() {
	                    obj[this.name] = this.value;
	                });
	            }
	        }
	    } catch (e) {
	        alert(e.message);
	    } finally {
	    }
	    return obj;
};

<%-- 댓글 등록  --%>
repInsertForm.on("submit",function(){
	event.preventDefault();
	let data = repInsertForm.serializeObject();
	
	$.ajax({
		type:"POST",
		url:url,
		data:JSON.stringify(data),
		contentType: 'application/json',
		beforeSend : function(xhr){
			xhr.setRequestHeader(header,token);
		},
		success: function(result) {
			$("#repContentID").val("");
 			getRep(currentPage);
		},
		error:function(request, status, err){
			console.log(request);
			console.log(status);
			console.log(err);				
		}
	});
});

<%-- 댓글 페이징  --%>
let pagingArea = $(".pagingArea").on("click", "a", function(event) {
		currentPage = $(this).data("page");
		getRep(currentPage);
});


<%-- 댓글 리스트  --%>
//서버사이드에서 하는 일이 항상 클라이언트 사이드에서 하는 일 보다 먼저 실행됨!
var v_memId = "${authMember.realMember.memId}";
function getRep(page){
	let urlPage = url + "?page=" + page;
	$.ajax({
		type:"GET",
		url: urlPage,
		dataType:'json',
		success: function(result) {
			<%-- 댓글 영역 지우기  --%>
			replyView.children().remove();
 			paging.children().remove();
			
 			replyLength = result["replyList"].length;
 			
			if(replyLength == 0){
// 				replyView.html("댓글이 없습니다.");
				console.log("댓글 없음");
				
			}else{
				result["replyList"].forEach((rep,idx)=>{
					let repWriter = rep['repWriter'];
					let repNo = rep['repNo'];
					let repContent = rep['repContent'];
					
					console.log("repWriter: ", repWriter);
					console.log("memId: ","${authMember.realMember.memId}");
					
					replyView.append(
						$("<div>").attr("class","row").append(
								
							$("<div>").attr("class","col-sm-11").append(
								$("<div>").attr({
									"class": "mb-3",
									"id": `mbcon_\${repNo}`,	
									}).append(
									$("<span>").text(rep["repWriterName"].substring(0,10) + " / " + rep["repDate"].substring(0,10))
									, $("<textarea>").attr({
										"id": `con_\${repNo}`,
										"name": "repContent",
										"class": "form-control",
										"row": "3",
										"required": "required",
										"readonly": "readonly",
										"style": "background-color: white; resize: none; box-shadow: none; border: none;"
									}).val(rep["repContent"])
								)//mb
							)//col
							
							,$("<div>").attr({
								"class": "col-sm-1", 
								"style": "padding: 0;  padding-left:20px;"
							}).append(
								$("<div>").attr({
									"class": "mb-3",
									"id": `mbbtn_\${repNo}`,	
									}).append(function(p_inx,p_htmlStr){
										if(v_memId == repWriter){
											return [	
											$("<button>").attr({
												"type":"button",
				                            	"id": `repModBtn_\${repNo}`,
				                                "class": "btn btn-danger btn-sm",
				                                "data-rno":rep["repNo"],
				                                "onclick": `repModForm(\${repNo},'\${repContent}')`,
				                                "style": "margin:1px; margin-top:20px; padding:4px; padding-right:26px; padding-left:26px;"
											}).html("수정"),
											$("<button>").attr({
												"type":"button",
							                    "id": `repDelBtn_\${repNo}`,
							                    "class": "btn btn-info btn-sm",
							                    "data-rno":rep["repNo"],
							                    "onclick": `repDelForm(\${repNo})`,
							                    "style": "margin:1px; padding:4px; padding-right:26px; padding-left:26px;"
											}).html("삭제")
										    ];
										   }
									}
								)//mb
							) //col	
						)//row
					)
					
				});
				<%-- 페이징  --%>
				paging.append(
					result["pagingVO"]["pagingHTMLBS"]			
				)		
				<%-- 페이징 버튼 누르면 하단으로 가도록  --%>
				let pageLink = $(".page-link");
				for(let i=0; i<pageLink.length; i++){
					paging.children().children().children().eq(i).children().attr("href","#pagingID");
				}
			}
			
			
	},
		error:function(request, status, err){
			console.log(request);
			console.log(status);
			console.log(err);				
		}
	});
}

<%-- 댓글 수정폼  --%>
function repModForm(repNo,repContent) {
	let contentId = "con_" + repNo;
	let mbcontentId = "mbcon_" + repNo;
	let repModBtn = "repModBtn_" + repNo;
	let repDelBtn = "repDelBtn_" + repNo;
	let mbbtn = "mbbtn_" + repNo;
	
	$(`#\${contentId}`).css("display","none");
	$(`#\${mbcontentId}`).append(
		$("<textarea>").attr({
			"id": `conMod_\${repNo}`,
			"class": "form-control",
			"row": "3",
			"required": "required",
			"style": "border: solid 2px #24695c;"
		}).val(repContent)
	)
	$(`#\${repModBtn}`).css("display","none");
	$(`#\${repDelBtn}`).css("display","none");
	$(`#\${mbbtn}`).append(
		$("<button>").attr({
			"type":"button",
            "class": "btn btn-danger",
            "onclick": `repMod(\${repNo})`,
            "style": "margin:1px; margin-top:30px; padding:4px; padding-right:26px; padding-left:26px;"
		}).html("수정")
	)
	
}


<%-- 댓글 수정  --%>
function repMod(repNo) {
	let conMod = "conMod_" + repNo;
	let repContent = $(`#\${conMod}`).val();
	let repModData = {
			repNo : repNo,
			repContent : repContent
		}
	
	$.ajax({
		type: "PUT",
		url: url,
		data: JSON.stringify(repModData),
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr) { 
			xhr.setRequestHeader(header,token);
		},
		success: function (result) {
 			console.log(result)
 			getRep(currentPage);
		},
		error: function (e) { 
			console.log("ERROR : ", e);
		}
	});
	
}

<%-- 댓글 삭제  --%>
function repDelForm(repNo) {
	Swal.fire({
		title: '삭제하시겠습니까?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
        	$.ajax({
        		type: "DELETE",
        		url: url,
        		data: JSON.stringify({repNo:repNo}),
        		contentType : "application/json;charset=utf-8",
        		beforeSend : function(xhr) { 
        			xhr.setRequestHeader(header,token);
        		},
        		success: function (result) {
         			console.log(result)
	         			getRep(1);
        		},
        		error: function (e) { 
        			console.log("ERROR : ", e);
        		}
        	});
        }
    })
}

</script>
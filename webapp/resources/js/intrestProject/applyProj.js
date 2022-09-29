let applyListBody = $("#applyListBody");
let applyPagingList = $("#applyPagingList").on("click", "a", function(event){
	let page = $(this).data("page");
	applySearchForm.find("[name=page]").val(page);
	applySearchForm.submit();
});

let applySearchForm = $("#applySearchForm").ajaxForm({
	beforeSend : function(xhr) { xhr.setRequestHeader(header,token);}
	, dataType : "json"
	, success : function(resp, status, jqXHR) {
		let pagingVO = resp;
		let boardList = pagingVO.dataList;
		let trTags = [];
		if(pagingVO.totalRecord > pagingVO.screenSize){
			document.getElementById("applyPagingList").style.display= "block";
		}else{				
			document.getElementById("applyPagingList").style.display= "none";
		}
		if(boardList && boardList.length>0){
			$(boardList).each(function(index, board){
				trTags.push(makeApplySingleTr(index, board));
			});
		}else{
			let trTag = $("<tr>").html(
				$("<td>").html("아직 지원한 프로젝트가 존재하지 않습니다.")	
			);
			trTags.push(trTag);
		}
		applyListBody.html(trTags);
		applyPagingList.html(pagingVO.pagingHTMLBS);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
}).submit();


let makeApplySingleTr = function(index, board){
	var proj = $("<td>").append(
				$("<div>").attr("class","media").attr("onclick",`location.href='${CPATH}/outsourcing/${board.projId}/project'`).append(
					$("<div>").attr("class","media-body").append(
						$("<span>").html(board.projTitle)
						,$("<p>").html("등록일: "+ board.projRecruitsdate)
						,$("<p>").html("모집 마감일: "+ board.projRecruitfdate)
						,$("<p>").html("예상 프로젝트 기간: "+ board.projSdate + "-" + board.projFdate)
					)
				)
			);
	var projState = $("<td>").append(
					$("<span>").attr("style", "color: green").html(
							"모집중"));

	var trTable = $("<tr>").append(
				proj,
				projState,
				$("<td>").append(
						$("<button>").attr("class", "btn-grayDay")
								.attr("onClick",
										"deleteApply('" + board.applyId + "')")
								.html("삭제")));

	return trTable;
}

function deleteApply(applyId){
	console.log("applyId: ",applyId);
	$.ajax({
		beforeSend : function(xhr){xhr.setRequestHeader(header,token);}
        ,url: CPATH+'/gen/myinfo/interestProject/apply'
        ,dataType: "JSON"
		,data:{"applyId" : applyId}
        ,type: 'POST'
        ,success : function(data){
        	applySearchForm.find("[name=page]").val(1);
        	applySearchForm.submit();
        }
        ,error : function(jqXHR, status, error) {
    		console.log(jqXHR);
    		console.log(status);
    		console.log(error);
       }
       });
}
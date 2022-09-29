
let listBody = $("#listBody");
let pagingArea = $(".pagingArea").on("click", "a", function(event){
	let page = $(this).data("page");
	searchForm.find("[name=page]").val(page);
	searchForm.submit();
});
let searchUI = $("#searchUI");

let searchForm = $("#searchForm").ajaxForm({
	beforeSend : function(xhr) { xhr.setRequestHeader(header,token);}
	, dataType : "json"
	, success : function(resp, status, jqXHR) {
		let pagingVO = resp;
		let boardList = pagingVO.dataList;
		let divTags = [];
		if(pagingVO.totalRecord > pagingVO.screenSize){
			document.getElementById("pagingList").style.display= "block";
		}else{				
			document.getElementById("pagingList").style.display= "none";
		}
		if(boardList && boardList.length>0){
			$(boardList).each(function(index, board){
				divTags.push(makeSingleTr(index, board));
			});
		}else{
			let divTag = $("<div>").html(
				$("<p>").html("회원정보와 일치한 프로젝트가 존재하지 않습니다.")	
			);
			divTags.push(divTag);
		}
		listBody.html(divTags);
		pagingArea.html(pagingVO.pagingHTMLBS);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
	}).submit();



let makeSingleTr = function(index, board){
	var divTable = $("<div>").attr("class","col-xxl-4 col-lg-6").append(
			$("<div>").attr("class","project-box").css("min-height","330px").attr("onclick",`location.href='${CPATH}/outsourcing/${board.projId}/project'`).append(
				$("<span>").attr("class","badge badge-primary").html(board.projState)
				,$("<h6>").html(board.projTitle)
				,$("<div>").attr("class","media").append(
					$("<div>").attr("class","media-body").append(
						$("<p>").html(board.projLoc)
					)
				)
				,$("<p>").html(board.projSubQualifi)
				,$("<div>").attr("class","row details").append(
					$("<div>").attr("class","col-6").append(
						$("<span>").html('등록일')
					)
					,$("<div>").attr("class","col-6 font-primary").html(board.projRegist)
					,$("<div>").attr("class","col-6").append(
						$("<span>").html('모집 마감일')
					)
					,$("<div>").attr("class","col-6 font-primary").html(board.projRecruitfdate)
					,$("<div>").attr("class","col-6").append(
						$("<span>").html('예상 프로젝트 기간')
					)
					,$("<div>").attr("class","col-6 font-primary").html(board.projSdate+'-'+board.projFdate)
				)
				,$("<p>").html(board.projSubContent)
			)
		)
	return divTable;
}

let searchBtn = $("#searchBtn").on("click", function(event){
	searchForm.get(0).reset();
	let inputs = searchUI.find(":input[name]");
	$(inputs).each(function(idx, input){
		let name = $(this).attr("name");
		let value = $(this).val();
		searchForm.find("[name="+name+"]").val(value);
	});
	searchForm.submit();
});

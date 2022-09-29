var interPage;
let listBody = $("#listBody");
let pagingArea = $("#pagingList").on("click", "a", function(event){
	let page = $(this).data("page");
	interPage = $(this).data("page");
	console.log(page)
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
		let trTags = [];
		if(pagingVO.totalRecord > pagingVO.screenSize){
			document.getElementById("pagingList").style.display= "block";
		}else{				
			document.getElementById("pagingList").style.display= "none";
		}
		if(boardList && boardList.length>0){
			$(boardList).each(function(index, board){
				trTags.push(makeSingleTr(index, board));
			});
		}else{
			let trTag = $("<tr>").html(
				$("<td>").html("아직 관심 등록한 프로젝트가 존재하지 않습니다.")	
			);
			trTags.push(trTag);
		}
		listBody.html(trTags);
		pagingArea.html(pagingVO.pagingHTMLBS);
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
	}).submit();

let makeSingleTr = function(index, board){
	var trTable;
	var deletedproj = board.projState=="DELETE";
	var finshproj = board.projState=='FINISH';
	var recruitproj= board.projState=='RECRUIT';
	var proj = null;
	var projState = null;
	
	var today = new Date();
	var recruitfdate = new Date(board.projRecruitfdate);
	
	if(deletedproj){
		proj = $("<td>").append(
				$("<div>").attr("class","media").append(
					$("<div>").attr("class","media-body").append(
							$("<span>").html(board.projTitle)
							,$("<p>").html("프로젝트가 삭제되었습니다.")
						)
					)
				)
			projState = $("<td>").append($("<span>").attr("style","color: red").html("삭제됨"));
	}else{	
		if(recruitproj){
			proj = $("<td>").append(
					$("<div>").attr("class","media").attr("onclick",`location.href='${CPATH}/outsourcing/${board.projId}/project'`).append(
						$("<div>").attr("class","media-body").append(
							$("<span>").html(board.projTitle)
							,$("<p>").html("등록일: "+ board.projRegist)
							,$("<p>").html("모집 마감일: "+ board.projRecruitfdate)
							,$("<p>").html("예상 프로젝트 기간: "+ board.projSdate + "-" + board.projFdate)
						)
					)
				)
			projState = $("<td>").append($("<span>").attr("style","color: green").html("모집중"));
			if(today > recruitfdate){
				projState = $("<td>").append($("<span>").html("모집기간마감"));
			}
		}else if(finshproj){
			proj = $("<td>").append(
					$("<div>").attr("class","media").append(
							$("<div>").attr("class","media-body").append(
									$("<span>").html(board.projTitle)
									,$("<p>").html("등록일: "+ board.projRegist)
									,$("<p>").html("모집 마감일: "+ board.projRecruitfdate)
									,$("<p>").html("예상 프로젝트 기간: "+ board.projSdate + "-" + board.projFdate)
							)
					)
			)
			,projState = $("<td>").append($("<span>").attr("style","color: red").html("완료"));
		}else{
			proj = $("<td>").append(
					$("<div>").attr("class","media").attr("onclick",`location.href='${CPATH}/outsourcing/${board.projId}/project'`).append(
							$("<div>").attr("class","media-body").append(
									$("<span>").html(board.projTitle)
									,$("<p>").html("등록일: "+ board.projRegist)
									,$("<p>").html("모집 마감일: "+ board.projRecruitfdate)
									,$("<p>").html("예상 프로젝트 기간: "+ board.projSdate + "-" + board.projFdate)
							)
					)
			)
			projState = $("<td>").append($("<span>").html("진행중"));
		};
	};
	
	trTable = $("<tr>").append(
		proj, projState
		, $("<td>").append(
				$("<button>").attr("class","btn-grayDay").attr("onClick","deletelike('"+board.projId+"')").html("삭제")
			)
	);
	
	if(deletedproj||finshproj){
		return trTable.attr("style", "background-color: #F2F2F2");
	}else{
		return trTable;
	}
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

function refreshMemList(){
	$('#like').load(location.href+' #like');
}

function deletelike(projId){
	$.ajax({
		beforeSend : function(xhr){xhr.setRequestHeader(header,token);}
        ,url: CPATH+'/gen/myinfo/interestProject'
        ,dataType: "JSON"
		,data:{"projId" : projId}
        ,type: 'POST'
        ,success : function(data){
        	searchForm.find("[name=page]").val(interPage-1);
        	searchForm.submit();
        }
        ,error : function(){
          alert("에러")
       }
       });
	searchForm.submit();
}


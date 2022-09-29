/**
 * <pre>
 * 
 * </pre>
 * @author 작성자명
 * @since 2022. 9. 14.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2022. 9. 14.      고혜인       최초작성
 * Copyright (c) 2022 by DDIT All right reserved
 * </pre>
 */ 
	//댓글 등록
	let repInput = $("#repInBtn").on("click", function() {
		console.log("댓글 등록");
		
		let repAdmin = $("#repAdmin").val();
		let repTitle = $("#repTitle").val();
		let repContent = $("#repContent").val();

		console.log(repParent);
		
		$.ajax({
			url:url,
			type:"post",
			dataType:"json",
			data:JSON.stringify({ //400
				repAdmin:repAdmin,
				repTitle:repTitle,
				repContent:repContent,
				repParent:repParent
			}),
			contentType : "application/json;charset=utf-8", //415
			beforeSend : function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success: function(data) {
				$("#repForm").hide();
				send("답변이 등록되었습니다",repAdmin,"/qna/"+repParent+"/reply");
				getRep();
			},
			error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);				
			}
			
		})
		
	});
	
	
	//댓글 수정 버튼 클릭
	$(document).on("click", "#upModeBtn", function(event) {
		console.log("수정 버튼 클릭");
		event.preventDefault();
		$("#replyView").hide();
		$("#repUpdate").show();
				
		$("#upRepTitle").val($("#repTitle").html());
		$("#upRepContent").val($("#repContent").html());
	});
	
	// 댓글 수정
	$(document).on("click", "#repUpBtn", function(event) {
		

		let upRepTitle = $("#upRepTitle").val();
		let upRepContent = $("#upRepContent").val(); 
		let upRepNo = $("#upModeBtn").data("rno");
		
		$.ajax({
			type:'put',
			url:url,
			data:JSON.stringify({ //400
				repNo:upRepNo,
				repTitle:upRepTitle,
				repContent:upRepContent
			}),
// 			dataType:'json',
			contentType : "application/json;charset=utf-8", //415
			beforeSend : function(xhr){
			   xhr.setRequestHeader(header,token);
			},
			success:function(resp){
				successAlert("수정되었습니다");
				$("#repUpdate").hide();
				getRep();
				$("#replyView").show();
			},
			error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);				
			}
		});
	});
	
	//수정 -> 취소 버튼 클릭
	$(document).on("click", "#repUpCancelBtn", function() {
		$("#replyView").show();
		$("#repUpdate").hide();
	});
		
	
	//댓글 삭제
	$(document).on("click", "#repDelBtn", function(event) {
		event.preventDefault();
		console.log("삭제 버튼 클릭");
		
		$.ajax({
			type:'delete',
			url:url,
			dataType:'json',
			beforeSend : function(xhr){
			   xhr.setRequestHeader(header,token);
			},
			success:function(resp){
				successAlert("삭제되었습니다");
// 				$("#repView").remove();
				$("#repForm").show();
				getRep();
			},
			error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);				
			}
		});
	});

	function successAlert(message) {
		Swal.fire({ 
	         icon: 'success',
	         title: message
	     });
	}
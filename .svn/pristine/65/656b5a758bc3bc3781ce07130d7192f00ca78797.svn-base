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
let searchObj = $("#searchObj");
$(document.forms[0]).on('keyup keypress', function(e) {
	  var keyCode = e.keyCode || e.which;
	  if (keyCode === 13) { 
	    e.preventDefault();
	    return false;
	  }
});


$('#searchObj').autocomplete({
	source : function(request, response) { //source: 입력시 보일 목록
		$.ajax({
 			type : 'get'
	 		, url : $.CPATH+"/gen/myinfo/portfolio/form/code"
 			, dataType : "json"
 			, success : function(data) {
 				console.log("data",data);
 				
 				response(
 		        	$.map(data.jobField, function(item) {
 		        		 if(request.term == "*" || item.codeName.indexOf(request.term) != -1){
 		        	       	return {
 		        	      	     label : item.codeName    	// 목록에 표시되는 값
 		        	             , value : item.codeName 		// 선택 시 input창에 표시되는 값
 		        	             , idx : item.codeId // index
 		        	       	};
 		        	  	 }
 		        	   })
 		        	   
 		        );
 		        	 
 			} 				
			, error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);
			}
		})
	}
	,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
	}
	,minLength: 1// 최소 글자수
	,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
	,delay: 100	//autocomplete 딜레이 시간(ms)
	,select : function(evt, ui) { 
      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, label/value/idx를 가짐
			console.log("ck1:",ui.item.label);
			console.log("ck2:",ui.item.idx);
			//중복체크
			let spanTags = document.querySelector("#objForm").children;
			for(let i=0; i< spanTags.length; i++){
				if(spanTags[i].id == ui.item.idx){
					//alert("같은게 있어용");
					return;       // 그냥 종료
				}
			}
			
			
			$("#objForm").append( //선택한 항목 보여줌 //PfObjVO의 objCode에 저장
					$("<span>").attr("id", ui.item.idx).text(ui.item.label+" x")
								.addClass("font-light badge badge-primary m-5 p-1")
			);
			if($("#objCodes").val() != ""){ 
				$("#objCodes").val($("#objCodes").val() + "," + ui.item.idx);		
			} else { //없으면 그냥 저장
				$("#objCodes").val(ui.item.idx);
			}
			
			// ===== 클릭 시 입력한 값 제외(insert) =====
			$("#objForm").off("click"); //클릭 한 번만 작동
			$("#objForm").on("click", "span", function() {
				var target = $(this).attr('id');
				var list = $("#objCodes").val().split(',');
				var value = '';
				var cnt = 0;
				$.each(list, function(i, v){
					if(v != target){
						if(cnt > 0){
							value += ',';
						}
						value += v;
						cnt ++;
					}
				});
				$("#objCodes").val(value);
				
				
				$(this).remove();
				
				let rst = $("#objCodes").val();
			$("#searchObj").val('');
				
				console.log(rst);
				console.log("----구분용----")
			})
			
	 }
});

  $( "#searchSkill" ).autocomplete({
	source : function(request, response) { //source: 입력시 보일 목록
		$.ajax({
 			type : 'get'
 			, url : $.CPATH + "/gen/myinfo/portfolio/form/code"
 			, dataType : "json"
  			, async : true
 			, success : function(data) {
 				console.log("data",data);
 				
 				response(
 		        	$.map(data.skill, function(item) {
 		        		 if(request.term == "*" || item.codeName.indexOf(request.term) != -1){
 		        	       	return {
 		        	      	     label : item.codeName    	// 목록에 표시되는 값
 		        	             , value : item.codeName 		// 선택 시 input창에 표시되는 값
 		        	             , idx : item.codeId // index
 		        	       	};
 		        	  	 }
 		        	   })
				);
			} 				
			, error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);
			}
		})
	}
	,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
	}
	,minLength: 1// 최소 글자수
	,autoFocus : true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
	,delay: 100	//autocomplete 딜레이 시간(ms)
	,select : function(evt, ui) { 
			//중복체크
			let spanTags = document.querySelector("#skillForm").children;
			for(let i=0; i< spanTags.length; i++){
				if(spanTags[i].id == ui.item.idx){
					//alert("같은게 있어용");
					return;       // 그냥 종료
				}
			}
			
			$("#skillForm").append( //선택한 항목 보여줌 //PfObjVO의 objCode에 저장
				$("<span>").attr("id", ui.item.idx).text(ui.item.label+" x")
							.addClass("font-light badge badge-dark m-5 p-1")
			)
			
			if($("#skillCodes").val() != ""){
				$("#skillCodes").val($("#skillCodes").val() + "," + ui.item.idx);				
			} else {
				$("#skillCodes").val(ui.item.idx);				
			}
			
			// === span 클릭 시 리스트에서 제외 ===
			$("#skillForm").off("click"); //클릭 한 번만 작동
			$("#skillForm").on("click", "span", function() {
				var target = $(this).attr('id');
				var list = $("#skillCodes").val().split(',');
				var value = '';
				var cnt = 0;
				$.each(list, function(i, v){
					if(v != target){
						if(cnt > 0){
							value += ',';
						}
						value += v;
						cnt ++;
					}
				});
				$("#skillCodes").val(value);
				
				
				$(this).remove();
				
				let rst = $("#skillCodes").val();
				
				console.log(rst);
				console.log("----구분용----")
			})
	 }
	
	
});
  
	//클릭 시 값 지워짐
	$(document).on("click", "#searchObj", function() {
      	$("#searchObj").val("");
	});
	$(document).on("click", "#searchSkill", function() {
      	$("#searchSkill").val("");
	});  

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

	
	// ===== 첨부파일 삭제 =====
	let pfFileForm = $(".attFile").on("click", ".delBtn", function(event) {
		let attNo = $(this).data("attNo");
		console.log("확인용 ==> " + attNo);

		let inputTag = $("<input>").attr({
			type : "hidden",
			name : "delAttIds"
		}).attr("value", attNo);

		pfFileForm.prepend(inputTag);
		$(this).parents("span:first").hide();
	});

	$(document.forms[0]).on('keyup keypress', function(e) {
		  var keyCode = e.keyCode || e.which;
		  if (keyCode === 13) { 
		    e.preventDefault();
		    return false;
		  }
	});

	
//////////////////////////////////////////////////////////////////////////////////////
	// ===== 직무분야 자동완성 =====
	$('#searchObj').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
			$.ajax({
	 			type : 'get'
	 			, url : $.CPATH+"/gen/myinfo/portfolio/form/code"
	 			, dataType : "json"
	 			, async : true
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
				let spanTags = $("#objForm").children();
				let delList = $("#delObjList").children();
				
				console.log("objTags ==>> ", spanTags);
				console.log("delObjList ==>> ", delList);

				for(let i=0; i< spanTags.length; i++){
						if(spanTags[i].id == ui.item.idx && $(spanTags[i]).css("display")!="none" ){//&& delList[j].defaultValue != ui.item.idx
	// 						alert("같은게 있어용");
							return;       // 그냥 넘어감
						}
				}
				
				console.log("length", $("#" + ui.item.idx).length )
				
				if ( $("#" + ui.item.idx).css("display")=="none"){
					$("#" + ui.item.idx).show()
				}else{
					$("#objForm").append( //선택한 항목 보여줌 //PfObjVO의 objCode에 저장
							$("<span>").attr("id", ui.item.idx).text(ui.item.label+" x")
										.addClass("font-light badge badge-primary m-5 p-1")
					);
				}
				
				if($("#objCodes").val() != ""){ 
					$("#objCodes").val($("#objCodes").val() + "," + ui.item.idx);				
				} else { //없으면 그냥 저장
					$("#objCodes").val(ui.item.idx);				
				}
				
		 }
	});

	// ===== 기술 자동완성(직무분야랑 똑같음) =====
	$('#searchSkill').autocomplete({
		source : function(request, response) { //source: 입력시 보일 목록
			$.ajax({
	 			type : 'get'
	 			, url : $.CPATH+"/gen/myinfo/portfolio/form/code"
	 			, dataType : "json"
	 			, async : true
	 			, success : function(data) {
	 				console.log("data=>",data);
	 				
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
				let spanTags = $("#skillForm").children();
				let delList = $("#delskillList").children();
				
				console.log("skillTags ==>> ", spanTags);
				console.log("delSkillList ==>> ", delList);
				
				for(let i=0; i< spanTags.length; i++){
						if(spanTags[i].id == ui.item.idx && $(spanTags[i]).css("display")!="none" ){
	// 						alert("같은게 있어용");
							return ;
						}
				}
				
			
				console.log("length", $("#" + ui.item.idx).length )
				
				if ( $("#" + ui.item.idx).css("display")=="none"){
					$("#" + ui.item.idx).show()
				} else {
					$("#skillForm").append( 
						$("<span>").attr("id", ui.item.idx).text(ui.item.label+" x")
									.addClass("font-light badge badge-dark m-5 p-1")
					);
				}
				
				if($("#skillCodes").val() != ""){
					$("#skillCodes").val($("#skillCodes").val() + "," + ui.item.idx);				
				} else {
					$("#skillCodes").val(ui.item.idx);				
				}
				
		 }
	});
	
	
	let delskillList = $("#delskillList");
	let delObjList = $("#delObjList");
	
	// === 기술 이미 입력된 값 삭제 ===
	let delSkillForm = $("#skillForm").on("click", "span", function() {
		
		let skillCode = $(this).attr('id');
		
		let skillTag = $("<input>").attr({
							type:"hidden"
							, name:"delSkillCodes"
							, "class":"delSkillCodes"
						}).attr('value', skillCode);	
		
		delskillList.append(skillTag);
		
		console.log("delskillList => ", delskillList);

		$(this).hide();
		
	});
	// === 직무분야 이미 입력된 값 삭제 ===
	let delObjForm = $("#objForm").on("click", "span", function() {
		
		let objCode = $(this).attr('id');

		let objTag = $("<input>").attr({
							type:"hidden"
							, name:"delObjCodes"
							, "class":"delObjCodes"
						}).attr('value', objCode);	
		
		delObjList.append(objTag);
		
		console.log("delObjList ==>>>>", delObjList);
		
		$(this).hide();
		
	});

	//클릭 시 값 지워짐
	$(document).on("click", "#searchObj", function() {
        	$("#searchObj").val("");
	});
	$(document).on("click", "#searchSkill", function() {
        	$("#searchSkill").val("");
	});
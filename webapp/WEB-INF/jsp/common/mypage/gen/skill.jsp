<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/autocomplete.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="/autocomplete.js"></script>
</head>
<body>
	<!-- body 부분 -->
	<input type='text' id='inputSearch'/> <button class="btn btn-primary" id="btn-sumbit">등록</button>
	
<script>
$('#inputSearch').autocomplete({
	 source : function(request, response) { //source: 입력시 보일 목록
	     $.ajax({
	           url : "${cPath}/gen/myinfo/skill"   
	         , type : "get"
	         , dataType: "JSON"
	         , data : {value: request.term}	// 검색 키워드
	         , success : function(data){ 	// 성공
	             response(
	                 $.map(data.skillList, function(item) {
	                    	 console.log(item.CODE_NAME);
	                    	 console.log(item.CODE_ID);
	                     return {
	                    	     label : item.CODE_NAME    	// 목록에 표시되는 값
	                           , value : item.CODE_NAME 		// 선택 시 input창에 표시되는 값
	                           , id : item.CODE_ID // index
	                     };
	                 })
	             );    //response
	         }
	         ,error : function(){ //실패
	             alert("오류가 발생했습니다.");
	         }
	     });
	 }
		,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
			return false;
		},
		minLength: 1,// 최소 글자수
		delay: 100	//autocomplete 딜레이 시간(ms),
		, select : function(evt, ui) { 
     	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
			console.log(ui.item.label);
			console.log(ui.item.id);
			$("#btn-sumbit").on("click", function() {
				alert("버튼 클릭함!!!!");
			});
	 }
});
</script>




</body>
</body>
</html>
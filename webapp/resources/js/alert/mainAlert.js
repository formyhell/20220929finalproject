//<%-- 웹소켓 연결 --%>
function connect() {
	webSocket = new WebSocket("ws://" + h_svUrl + "/PHOS/alram");
	webSocket.onopen = onOpen;
	webSocket.onmessage = onMessage;
}

//<%-- 웹소켓 종료 --%>
function disconnect() {
	webSocket.send(myId + "님이 연결을 종료함");
	webSocket.close();
}

//연결 시
function onOpen() {
	console.log("웹소켓 연결됨");
} 

//<%-- 실시간 알림 받기 --%>
function onMessage() {
	let h_msg = event.data;
	let h_len = h_msg.indexOf(">") + 20;
	if (h_msg.length > h_len) {
		h_msg = h_msg.substr(0,h_len) + "...";
	}
	toastr.info(h_msg);
	alamView();
}

//<%-- 알림 전송 --%>
function send(msg,receiver,url) {
	let socketMsg = msg + "," + receiver + "," + url ;
	webSocket.send(socketMsg);
}

//<%-- 알람 리스트 조회 --%>
function alamView() {
	$.ajax({
		type:"GET",
		url: h_url,
		dataType:'json',
		success: function(result) {
			$(".dropdown-content").children().remove();
			
			if(result!=null && result.length > 0){
				let alertChk = 0;
				result.forEach((rep,idx)=>{
					makeAlamList(rep);
					if(rep['alertCheck'] == 0){
						alertChk++
					}
				});
				if(alertChk>0){
					$(".dot-animated").css('display', 'block');
				}else{
					$(".dot-animated").css('display', 'none');
				}
			}else{
				$(".dropdown-content").append( $("<div>").html("알림이 없습니다."))	
				$(".dot-animated").css('display', 'none');
			}
		}, error:function(request, status, err){
			console.log(request);
			console.log(status);
			console.log(err);				
		}
	});
}
let makeAlamList = function(rep) {
	let alramUrl = "http://" + h_svUrl + "/PHOS/" + rep['alertUrl'];
	if(alramUrl == null){ alramUrl = "#"; }
	$(".dropdown-content").append(
		$("<div>").attr("class","alertChk_" + rep['alertCheck']).append(
			$("<span>").attr({
				"style": "font-size: x-small;"}).html(rep['alertTime'])
			, $("<i>").attr({
				"class":"fa fa-times" ,
				"style":"float: right;",
				"onclick":"deleteAlram(" + rep['alertNo'] + ")"})
			, "<br>"	
			, $("<a>").attr({"href":alramUrl, "onclick":"updateAlram(" + rep['alertNo'] + "," + rep['alertCheck'] + ")"}).append(rep['alertContent'])	
		)
	);
}
//<%-- 알람 삭제 --%>
function deleteAlram(alertNo) {
	$.ajax({
		type:"DELETE",
		url: h_url,
		data: JSON.stringify({alertNo:alertNo}),
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr) { 
			xhr.setRequestHeader(h_header,h_token);
		},
		success: function(result) {
			console.log(result);
			alamView();
		}, error:function(request, status, err){
			console.log(request);
			console.log(status);
			console.log(err);				
		}
	});
}
//<%-- 알람 읽음 처리 --%>
function updateAlram(alertNo, alertCheck) {
	if(alertCheck==0){ //안읽음 상태라면
		$.ajax({
			type:"PUT",
			url: h_url,
			data: JSON.stringify({alertNo:alertNo}),
			contentType : "application/json;charset=utf-8",
			beforeSend : function(xhr) { 
				xhr.setRequestHeader(h_header,h_token);
			},
			success: function(result) {
				console.log(result);
				alamView();
			}, error:function(request, status, err){
				console.log(request);
				console.log(status);
				console.log(err);				
			}
		});
	}
}
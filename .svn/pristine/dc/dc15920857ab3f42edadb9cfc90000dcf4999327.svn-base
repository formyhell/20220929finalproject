<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	아웃소싱 프로젝트 계약 페이지
	
	<!-- <div style="width: 300px; height: 300px;">
				<canvas id="canvas" style="border: 1px solid black"></canvas>
			</div> -->
		
		<button id="opt01">버튼임</button>
	<div>
        <canvas id="canvas" width="200" height="200" style="border: 1px solid black">
 
        </canvas>
    </div>
<script>
		/* (function(obj) {
			obj.init();
			$(obj.onLoad);
		})((function() {
			var canvas = $("#canvas");
			var div = canvas.parent("div");
			// 캔버스의 오브젝트를 가져옵니다.      
			var ctx = canvas[0].getContext("2d");
			var drawble = false;
			// 이제 html 버그인지는 모르겠는데 canvas의 style의 height와 width를 수정하게 되면 그림이 이상하게 그려집니다.      
			function canvasResize() {
				canvas[0].height = div.height();
				canvas[0].width = div.width();
			} // pc에서 서명을 할 경우 사용되는 이벤트입니다.      
			function draw(e) {
				function getPosition() {
					return {
						X : e.pageX - canvas[0].offsetLeft,
						Y : e.pageY - canvas[0].offsetTop
					}
				}
				switch (e.type) {
				case "mousedown": {
					drawble = true;
					ctx.beginPath();
					ctx.moveTo(getPosition().X, getPosition().Y);
				}
					break;
				case "mousemove": {
					if (drawble) {
						ctx.lineTo(getPosition().X, getPosition().Y);
						ctx.stroke();
					}
				}
					break;
				case "mouseup":
				case "mouseout": {
					drawble = false;
					ctx.closePath();
				}
					break;
				}
			}   
			return {
				init : function() {
					// 캔버스 사이즈 조절          
					$(window).on("resize", canvasResize);
					canvas.on("mousedown", draw);
					canvas.on("mousemove", draw);
					canvas.on("mouseup", draw);
					canvas.on("mouseout", draw);
					
					// save 버튼을 누르면 imageupload.php로 base64코드를 보내서 이미지로 변환합니다.          
					$("#save").on("click", function() {
						// a 태그를 만들어서 다운로드를 만듭니다.            
						var link = document.createElement('a');
						// base64데이터 링크 달기            
						link.href = canvas[0].toDataURL("image/png");
						// 다운로드시 파일명 지정            
						link.download = "image.png";
						// body에 추가            
						document.body.appendChild(link);
						link.click();
						document.body.removeChild(link);
						// 다운로드용 a 태그는 다운로드가 끝나면 삭제합니다.           
						form.remove();
					});
				},
				onLoad : function() {
					// 캔버스 사이즈 조절          
					canvasResize();
				}
			}
		})());
		
		
		$("#btn").on("click", function() {

		    // Convert canvas to dataURL and log to console
		 	const canvas = document.getElementById('canvas');
		    
		 	 // Convert canvas to dataURL and log to console
		    const dataURL = canvas.toDataURL();
		    console.log(dataURL);
		    // Logs data:image/png;base64,wL2dvYWwgbW9yZ...

		    // Convert to Base64 string
		    const base64 = getBase64StringFromDataURL(dataURL);
		    console.log(base64);
		    // Logs wL2dvYWwgbW9yZ...
		});
		
		const getBase64StringFromDataURL = (dataURL) =>
	    dataURL.replace('data:', '').replace(/^.+,/, ''); */
	    
var pos = {
    drawable: false,
    x: -1,
    y: -1
};
var canvas, context;
 
canvas = document.getElementById("canvas");
context = canvas.getContext("2d");
 
canvas.addEventListener("mousedown", commonListener);
canvas.addEventListener("mousemove", commonListener);
canvas.addEventListener("mouseup", commonListener);
canvas.addEventListener("mouseout", commonListener);

 
function commonListener(event){
    switch(event.type){
        case "mousedown":
            initDraw(event);
            break;
 
        case "mousemove":
            if(pos.drawable) //클릭상태인지 확인
                draw(event);
            break;
 
        case "mouseout":
        case "mouseup":
            finishDraw();
            break;
    }
}

  
function initDraw(event){
    context.beginPath(); //새로운 경로 지정
    pos.drawable = true;
    var coors = getPosition(event);
    pos.X = coors.X;
    pos.Y = coors.Y;
    context.moveTo(pos.X, pos.Y);
}
 
function draw(event){
    var coors = getPosition(event);
    context.lineTo(coors.X, coors.Y);
    pos.X = coors.X;
    pos.Y = coors.Y;
    context.stroke();
}
 
function finishDraw(){
    pos.drawable = false;
    pos.X = -1;
    pos.Y = -1;
}
 
function getPosition(event){
    var x = event.pageX - canvas.offsetLeft;
    var y = event.pageY - canvas.offsetTop;
    return {X: x, Y: y};
}

$(document).ready(function(){
	$("#opt01").click(function(){
	        window.open("", "test", "height=200,width=200");
	});
	});

	</script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		crossorigin="anonymous"></script>
</body>
</html>
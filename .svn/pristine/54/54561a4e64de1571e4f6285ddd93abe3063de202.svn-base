var getURI = window.location.pathname;
var hostIndex = location.href.indexOf(location.host)+ location.host.length;
var cpath = location.href.substring(hostIndex, location.href.indexOf('/',hostIndex+ 1));

//첫 방문시 버튼 생성
function refreshMemList(){
	$('#heart').load(location.href+' #heart');
}

var imgLike = $("<img>").attr({onclick:"projLike("+projId+")", id:"heart"});
var onHeart = cpath + "/resources/images/heart/heart.png";
var offHeart = cpath + "/resources/images/heart/heartbackground.png";

window.onload=function(){	
	$.ajax({
		beforeSend : function(xhr) { xhr.setRequestHeader(header,token);}
		,url: cpath +'/gen/myinfo/interestProject/'+projId
		,dataType : "json"
		,type: "get"
		,data:{"getURI" : getURI}
		,success : function(data) {
			if(data.like==true){
				$('#heart').attr("src",onHeart).attr("onclick","projLike('"+projId+"')");
			}else{
				$('#heart').attr("src",offHeart).attr("onclick","projLike('"+projId+"')");
			}
		},
		error : function (request, status, error) {
	        console.log("code: " + request.status)
	        console.log("message: " + request.responseText)
	        console.log("error: " + error)
		}
	});
}

//클릭시 버튼 활성/비활성
function projLike(projId){
	$.ajax({
		beforeSend : function(xhr){xhr.setRequestHeader(header,token);}
        ,url: cpath +'/gen/myinfo/interestProject/'+projId
        ,dataType: "JSON"
		,data:{"getURI" : getURI}
	    ,type: 'POST'
        ,success : function(likeProj){
        	if(likeProj.cheakInterest){
        		$("#heart").attr("src",onHeart);
        	}else{
        		$("#heart").attr("src",offHeart);	        		
        	}
            refreshMemList();
        }
        ,error : function(){
            refreshMemList();
       }
    });
	
}
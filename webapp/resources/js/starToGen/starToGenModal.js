let result = new Map(); //별점 보낼때

/* 모달 */
const open = () =>{
  document.querySelector(".modal").classList.remove("hidden");
	  takeList();
	}
  
const close = () =>{
	  $('.starAll span').removeClass('on');
  document.querySelector(".modal").classList.add("hidden");
	}
  
document.querySelector(".openBtn").addEventListener("click", open);
document.querySelector(".closeBtn").addEventListener("click", close);
document.querySelector(".bg").addEventListener("click", close); 


/* 리스트 출력 */
let starList = $("#starList");
function takeList(){
	$.ajax({
		beforeSend : function(xhr){xhr.setRequestHeader(header,token);}
        ,url: CPATH+'/star'
        ,dataType: "JSON"
		,data: {"projId":projId}
        ,type: 'GET'
        ,success : function(data){
        	let starTags = [];
        	if(data && data.length>0){
    			$(data).each(function(index, worker){
    				starTags.push(makeStarTr(index, worker));
    			});
    		}else{
    			starTags.push();
    		}
        	starList.html(starTags);
        	makestar();
        }
        ,error : function(data){
        	alert("실패");
        	console.log(data)
       }
	});
}

/* 별점 만들기  */
function makestar(){
	$('.starRev span').click(function(){
		var obj = $(this);
		obj.parent().children("span").removeClass("on");
		obj.addClass("on").prevAll("span").addClass("on");
		var genId = obj.attr('genId');
		var value = obj.attr('value');
		result.set(genId,value);
		//console.log(result);
	});
	
	$('.starAll span').click(function(){
		var obj = $(this);
		obj.parent().children("span").removeClass("on");
		obj.addClass("on").prevAll("span").addClass("on");
		var select = obj.attr('data-value')-1;

		$('.starRev').each(function(i,v){
			$(v).find("span").each(function(j,vv){
				if(j==select){
					$(vv).click();
				}
			});
			
		});
	});
}

/* 리스트생성 */
let makeStarTr = function(index, worker){
	var workImg;
	if(worker.genImg != null){
		workerImg = CPATH+"/resources/genImages/"+worker.genImg;
	}else{
		workerImg = CPATH+"/resources/assetsPms/images/dashboard/1.png";
	}
	
	if(worker.genDelete == 1){
		var Tr = $("<tr>").append(
			$("<div>").attr("style","background-color:#CCCCCC").attr("class","listCard").append(
					$("<td>").append($("<div>").attr("class","profileBox").append($("<img>").attr("class","profile").attr("src",CPATH+"/resources/assetsPms/images/dashboard/1.png").attr("style","")))
					,$("<td>").append($("<b>").html("NoName"))
					,$("<td>").html(worker.genId)
					,$("<td>").attr("colspan","3").attr("style","width:300px").html("이미 탈퇴한 회원입니다.")
				)
		)
	}else{			
		var Tr = $("<tr>")
		.attr("data-name",worker.genName)
		.attr("data-id",worker.genId)
		.attr("data-fdate",worker.applyObj)
		.attr("data-sdate",worker.contractSdate)
		.attr("data-fdate",worker.contractFdate)
		.append(
			$("<div>").attr("class","listCard").append(
				$("<td>").append($("<div>").attr("class","profileBox").append($("<img>").attr("class","profile").attr("src",workerImg).attr("style","")))
				,$("<td>").append($("<b>").html(worker.genName))
				,$("<td>").html(worker.genId)
				,$("<td>").html(worker.applyObj)
				,$("<td>").html(worker.contractSdate+"-"+ worker.contractFdate)
				,$("<td>").append(
						$("<div>").attr("class","starRev").append(
							$("<span>").attr("class","starR").attr({genId:worker.genId, value:"1"}).html("★")
							,$("<span>").attr("class","starR").attr({genId:worker.genId, value:"2"}).html("★")
							,$("<span>").attr("class","starR").attr({genId:worker.genId, value:"3"}).html("★")
							,$("<span>").attr("class","starR").attr({genId:worker.genId, value:"4"}).html("★")
							,$("<span>").attr("class","starR").attr({genId:worker.genId, value:"5"}).html("★")
						)
					)
				)
			);
	}
	return Tr;
}

/*별점보낼때 */
function nextBtn(){
	var data = Object.fromEntries(result);
	console.log(data);
	if(result=!null){
		$.ajax({
			beforeSend : function(xhr){xhr.setRequestHeader(header,token);}
	        ,url: CPATH+'/star'
	        ,dataType: "JSON"
			,data: data
	        ,type: 'POST'
	        ,success : function(data){
	        	close();
	        }
	        ,error : function(data){
	        	alert("실패");
	        	console.log(data)
	       }
		});
	}else{
		
	}
}
/*리스트 재배열*/
var option = null;
var option2 = false;
$("#attribution th").click(function(){
	var starList = document.querySelector("#starList");
	var starTrs = starList.children;
	var arrTrs = [];
    for(var i=0; i<starTrs.length; i++){ arrTrs[i] = starTrs[i];}
	
    oldOption = option;
	option = $(this).attr("opt");
	console.log(option);
	
	
	if(oldOption==option){
		if(option2 == false){
			option2  = true;
		} else{
			option2  = false;
		}
	}else{
		option2  = false;
	}
	
	if(option=="date"){
		if(option2){
			$(this).children("b").html("시작일");
			arrTrs = arrTrs.sort(function(a,b){
				return replaceAll(a.dataset.contractSdate,".","")-replaceAll(b.dataset.contractSdate,".","");
			});
		}else{
			$(this).children("b").html("종료일");
			arrTrs = arrTrs.sort(function(a,b){
				return replaceAll(a.dataset.contractFdate,".","")-replaceAll(b.dataset.contractFdate,".","");
			});
		}
	}else{			
		if(option2){
			$(this).children("b").html("∨");
			arrTrs = arrTrs.sort(function(a,b){
				if(a.dataset[option] >= b.dataset[option]) return -1;
				else return +1;
			})
		}else{			
			$(this).children("b").html("∧");
			arrTrs = arrTrs.sort(function(a,b){
				if(a.dataset[option] >= b.dataset[option]) return +1;
				else return -1;
			})
		}
	}
	//순서대로 집어넣기
    for(var i=0; i<arrTrs.length; i++){
    	starList.appendChild(arrTrs[i]); // 이미 객체가 있는 경우는 옮겨, 맨뒤로
    }
})


function replaceAll(str,searchStr,replaceStr) {
   return str.split(searchStr).reverse().join(replaceStr);
}
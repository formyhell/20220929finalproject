<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 25.      작성자           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>     
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
	<c:choose> 
		<c:when test="${not empty resultMap }">
			if("${resultMap['result']}"==true){
			 	Swal.fire({ 
			         icon: 'success',
			         title: "${resultMap['message']}"
			     });
			}else{
			 	Swal.fire({ 
			         icon: 'warning',
			         title: "${resultMap['message']}"
			     });
			}
		</c:when>
	</c:choose>
</script>

    <div>
    	<button class="btn-grayDay" data-bs-toggle="modal" data-bs-target="#m_change">비밀번호 변경</button>
    </div>
    
	<!-- Modal -->
	<div class="modal fade" id="m_change" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title" id="exampleModalLabel">비밀번호 변경</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <form method="post" id="changePWId" action="${cPath }/gen/myinfo/changePW" onsubmit="return submitCheck();">
	      <sec:csrfInput/>
		      <div class="modal-body">
		      	<p>안전한 비밀번호로 내정보를 보호하세요 <br>
		      	- 다른 아이디/사이트에서 사용한 적 없는 비밀번호 <br>
		      	- 이전에 사용한 적 없는 비밀번호가 안전합니다. <br> 
		      	- 비밀번호는 8~16자로 영문, 숫자, 특수문자를 사용하세요.</p>                                                            
		        <input id="inputPass" type="text" placeholder="현재 비밀번호" name="inputPass" class="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[`~!@#$%^&*()-_=+])[A-Za-z\d`~!@#$%^&*()-_=+]{8,16}$" required /> <br>
		        <input id="newPass" type="password" placeholder="새 비밀번호" name="newPass" class="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[`~!@#$%^&*()-_=+])[A-Za-z\d`~!@#$%^&*()-_=+]{8,16}$" required />
		        <input id="newPassChk" type="password" placeholder="새 비밀번호 확인" class="form-control" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[`~!@#$%^&*()-_=+])[A-Za-z\d`~!@#$%^&*()-_=+]{8,16}$" />
		      	<font id="chkNotice" size="2"></font>
		      </div>
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-danger" onclick="submitCheck()">확인</button>
		        <button type="button" class="btn" data-bs-dismiss="modal">취소</button>
		      </div>
	      </form> 
	    </div>
	  </div>
	</div>

<script>

function submitCheck() {
	if(passChk==0) {
		alert();
		return false;
	 }
	return true;
}

function alert() {
	Swal.fire({
        icon: 'warning',
        title: "비밀번호를 확인하세요."
    });
}

// 비밀번호 일치 여부
var passChk = 0;
$(function(){
    $('#newPass').keyup(function(){
      $('#chkNotice').html('');
      $('#newPassChk').val('');
    });

    $('#newPassChk').keyup(function(){
        if($('#newPass').val() != $('#newPassChk').val()){
          $('#chkNotice').html('비밀번호 일치하지 않음');
          $('#chkNotice').attr('color', '#f82a2aa3');
          passChk = 0;
        } else{
          $('#chkNotice').html('비밀번호 일치함');
          $('#chkNotice').attr('color', '#199894b3');
          passChk = 1;
        }
    });
});

</script>	
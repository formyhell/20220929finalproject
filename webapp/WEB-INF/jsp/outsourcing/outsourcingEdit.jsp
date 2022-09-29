<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="${cPath}/resources/assets/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<script src="http://cdn.ckeditor.com/4.19.1/standard/ckeditor.js"></script>

<style>
<%-- 첨부파일 --%>
.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}
.filebox input[type="file"] { 
     position: absolute; 
     width: 0; 
     height: 0; 
     padding: 0; 
     overflow: hidden; 
     border: 0; 
} 

#cardBody{
	height: 800px;
}
</style>


    <!-- Login Section -->
    <div class="container">
      <div class="row">
        <div class="main-body">
          <div class="body-inner">
            <div class="card bg-white">
                  <ul class="nav nav-tabs">
				  </ul>
              <div class="card-content">
                <section class="logo text-center">
                </section>
                
    				<div id="com" >  
    					<!-- 기업 회원 수정 폼 -->
    					<form:form action="${cPath }/outsourcing/${outProj.projId }" modelAttribute="outProj" method="post" enctype="multipart/form-data">
						<sec:csrfInput/>
						

								
							<div class="form-group">
		                      <div class="ui-input-group">
		                        <input type="hidden" name="projId" value="${outProj.projId }">
		                      </div>
		                    </div>
							<div class="form-group">
		                      <div class="ui-input-group">
		                        <div><label>프로젝트 명</label></div>
		                        <form:input path="projTitle" value="${outProj.projTitle}" class="form-control" required="required"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="projTitle" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                   
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <div><label>프로젝트 모집 마감일</label></div>
		                        <form:input type="date" path="projRecruitfdate" value="${outProj.projRecruitfdate }" class="form-control" required="required"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="projRecruitfdate" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div>
		                      
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <div><label>프로젝트 예상 시작일</label></div>
		                        <form:input type="date" path="projSdate" value="${outProj.projSdate }" class="form-control" required="required"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="projSdate" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <div><label>프로젝트 예상 종료일</label></div>
		                        <form:input type="date" path="projFdate" value="${outProj.projFdate}" class="form-control" required="required"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="projFdate" element="span" cssClass="error"></form:errors>
		                      </div>
		                     </div> 
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                        <div><label>고용형태</label></div>
		                        <form:input path="projEmptype" value="${outProj.projEmptype }" class="form-control" required="required"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="projEmptype" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                     <div class="form-group">
		                      <div class="ui-input-group">
		                        <div><label>모집인원</label></div>
		                        <form:input path="projMemnum" value="${outProj.projMemnum }" class="form-control" required="required"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="projMemnum" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                     <div class="form-group">
		                      <div class="ui-input-group">
		                       <div> <label>내용</label></div>
		                        <form:textarea path="projContent" value="${outProj.projContent }" class="form-control" required="required"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="projContent" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                     <div class="form-group">
		                      <div class="ui-input-group">
		                       <div> <label>모집 요건</label></div>
		                        <form:textarea path="projQualifi" value="${outProj.projQualifi }" class="form-control" required="required"/>
		                        <span class="input-bar"></span>
		                        <form:errors path="projQualifi" element="span" cssClass="error"></form:errors>
		                      </div>
		                    </div>
		                     <div class="form-group">
		                      <div class="ui-input-group">
		                       <div> <label>장소</label></div>
		                       
								<form:select path="projLoc" class="">
								<c:if test="${not empty outLocList}">
			                       	<c:forEach items="${outLocList}" var="loc">
										<form:option value="${loc.codeName }">${loc.codeName }</form:option>
									</c:forEach>
								</c:if>
								</form:select>
								<form:errors path="projLoc" element="span" cssClass="error"/> 
		                      </div>
		                    </div>
		                    
		                    
		                    <div class="form-group">
		                      <div class="ui-input-group">
		                       <div> <label>첨부파일</label></div>
		                       <div class="yu_div_css">
								 <c:if test="${not empty outProj.attatchList }">
									<c:forEach items="${outProj.attatchList }" var="attatch" varStatus="vs">
										<span>
										${attatch.attFilename }<br>
											<span class="btn btn-danger delBtn" data-att-no="${attatch.attId }">DEL</span>
											<c:if test="${not vs.last }">  </c:if>
											</span>
										</c:forEach>
									</c:if>
<%-- 											<c:if test="${empty outProj.attatchList }">등록한 첨부파일이 없습니다.</c:if> --%>
								
								</div>
										<div class="filebox">
										    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
										    <label for="file" class="btn btn-outline-primary ms-2"><i data-feather="upload"></i>Upload</label> 
										    <form:input type="file" id="file" path="outProjFiles" multiple="true" />
										    <form:errors path="outProjFiles" element="span" cssClass="error"/>
										</div>

		                      </div>
		                    </div>
		                    
		                    <div class="spacer"></div>
		                    <div class="card-action no-border text-right">
		                    	<input id="btn-update" type="submit" class="btn-blueOcen" value="저장">
		                    </div>
		                </form:form>
				    </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
  <%-- 파일 이름 --%>
  $("#file").on("change",function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName.substr(12));
	});
  
  <%-- 첨부파일 삭제 --%>
  let boardForm = $(".yu_div_css").on("click", ".delBtn", function(event){
	  let attNo = $(this).data("attNo");
	  console.log(attNo);
	  console.log($(this));
	  
		let inputTag = $("<input>").attr({
							type:"hidden"
							, name:"delAttNos"
						}).attr('value',attNo);
  
		boardForm.prepend(inputTag);
		
		console.log($(this).parents("span:first"));
		
		$(this).parents("span:first").hide();
	});
  </script>
  
<script>

   CKEDITOR.replace('projQualifi',{
      filebrowserImageUploadUrl : "${cPath}/file/image?command=imageUpload&${_csrf.parameterName}=${_csrf.token}",
      height : 300
   });
</script>
<script src="${cPath }/resources/js/ckeditor/editorConfig.js"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 26.      작성자           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                수정자          수정내용
* ----------  ---------  -----------------
* 2022. 8. 26.      작성자           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="viho admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
    <meta name="keywords" content="admin template, viho admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="pixelstrap">
    <link rel="icon" href="${cPath}/resources/assetsPms/images/favicon.png" type="image/x-icon">
    <link rel="shortcut icon" href="${cPath}/resources/assetsPms/images/favicon.png" type="image/x-icon">
    <title>PHOS-PMS</title>
    <!-- Google font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">
    <!-- Font Awesome-->
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/fontawesome.css">
    <!-- ico-font-->
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/icofont.css">
    <!-- Themify icon-->
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/themify.css">
    <!-- Flag icon-->
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/flag-icon.css">
    <!-- Feather icon-->
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/feather-icon.css">
    <!-- Plugins css start-->
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/animate.css">
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/chartist.css">
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/date-picker.css">
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/prism.css">
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/vector-map.css">
    <!-- Plugins css Ends-->
    <!-- Bootstrap css-->
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/bootstrap.css">
    <!-- App css-->
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/style.css">
    <link id="color" rel="stylesheet" href="${cPath}/resources/assetsPms/css/color-1.css" media="screen">
    <!-- Responsive css-->
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assetsPms/css/responsive.css">
    <!-- latest jquery-->
    <script src="${cPath}/resources/assetsPms/js/jquery-3.5.1.min.js"></script>
    
    <style>
    	body {
    		color: #f5f7fb;
    		background-color: #f5f7fb;
    	}
    	.container{
    		padding: 15%;
    		max-width: 55%
    	}
		.card {
			margin: 0;
			text-align: center;
		}
		
	</style>
  </head>
  <body>
    <!-- Loader starts-->
    <div class="loader-wrapper">
      <div class="theme-loader">    
        <div class="loader-p"></div>
      </div>
    </div>
    <!-- Loader ends-->
    <!-- page-wrapper Start       -->
    <div class="page-wrapper compact-wrapper" id="pageWrapper">
    	<!-- Page Body Start-->
		<div class="page-body">
			<div id="login" class="ptb ptb-xs-60 page-signin">
				<div class="container">
					<div class="row">
						<div class="main-body">
							<div class="body-inner">
								<div class="card bg-white">
									<div
										class="card-header bg-primary d-flex justify-content-between align-items-center">
										<h5 class="text-white">Admin Login</h5>
									</div>
									<div class="card-body">
										<form:form name="f" action="${cPath }/login"
											class="form-horizontal ng-pristine ng-valid"
											modelAttribute="genMember" method="post">
											<fieldset>
												<div class="form-group">
													<div class="ui-input-group">
														<input type="text" name="username" required
															class="form-control" placeholder="아이디">
													</div>
												</div>
												<div class="form-group">
													<div class="ui-input-group">
														<input type="password" name="password" required
															class="form-control" placeholder="비밀번호"> <span
															class="input-bar"></span>
													</div>
													<input type="hidden" name="${_csrf.parameterName}"
														value="${_csrf.token}" />
												</div>
												<div class="card-action no-border text-right">
													<input type="submit" name="submit" class="btn btn-primary"
														value="Login">
												</div>
											</fieldset>
										</form:form>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<p style="color: black;">
							© 2022 (재)대덕인재개발원 All
							Rights Reserved.
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
    
    <!-- feather icon js-->
    <script src="${cPath}/resources/assetsPms/js/icons/feather-icon/feather.min.js"></script>
    <script src="${cPath}/resources/assetsPms/js/icons/feather-icon/feather-icon.js"></script>
    <!-- Sidebar jquery-->
    <script src="${cPath}/resources/assetsPms/js/config.js"></script>
    <!-- Bootstrap js-->
    <script src="${cPath}/resources/assetsPms/js/bootstrap/popper.min.js"></script>
    <script src="${cPath}/resources/assetsPms/js/bootstrap/bootstrap.min.js"></script>
    <!-- Plugins JS start-->
    <script src="${cPath}/resources/assetsPms/js/prism/prism.min.js"></script>
    <script src="${cPath}/resources/assetsPms/js/clipboard/clipboard.min.js"></script>
    <script src="${cPath}/resources/assetsPms/js/custom-card/custom-card.js"></script>
    <!-- Plugins JS Ends-->
    <!-- Theme js-->
    <script src="${cPath}/resources/assetsPms/js/script.js"></script>
    <script src="${cPath}/resources/assetsPms/js/theme-customizer/customizer.js"></script>
    <!-- login js-->
    <!-- Plugin used-->
  </body>
</html>
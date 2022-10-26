<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<script
	  src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>커미션 포스트</title>
</head>
<body>
	
	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div  class="d-flex justify-content-center">
				<div>
					<img width="300" height="400" alt="그림 샘플" src="${postInfo.thumbnail }">
				</div>
				
				<div class="ml-3" id="infoBox" style="width: 380px">
					<div>
						<div class="d-flex justify-content-between">
							<label class="font-weight-bold" style="font-size:25px">${postInfo.title }</label>
							<a href="#"><i class="bi bi-bookmark text-warning" style="font-size:25px"></i></a>
							<a href="#"><i class="bi bi-bookmark-check-fill text-warning" style="font-size:25px"></i></a>
						</div>
						
						<a href="#" style="text-decoration:none" class="text-dark font-weight-bold">${userInfo.nickname }</a> <br>
						
						<label class="mt-1">
							<fmt:formatNumber value="${postInfo.minimumPrice }" type="number"/>
							~ 
							<fmt:formatNumber value="${postInfo.maximumPrice }" type="number"/>
						</label> 
						
						<br>
						
						<label>${postInfo.deadline }일 이내 전달</label> <br>
						
						<div style="height: 152px">
							<%-- 버튼 높이 맞추기용 --%>
						</div>
						
						<a class="btn btn-dark btn-lg form-control mt-5 text-white" style="position:relative; bottom:50;">신청하기</a>
					</div>
				</div>
			</div>
			
			<hr>
			<div class="d-flex justify-content-center">
				<div style="width: 500px; " class="text-center mt-3 mb-5">
					　 
					${postInfo.content }
				
				</div>
			</div>
			
		</section>
	
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>

</body>
</html>
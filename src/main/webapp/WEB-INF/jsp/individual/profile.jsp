<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>개인페이지</title>



</head>
<body>

		<div class="container">
			<header>
				<c:import url="/WEB-INF/jsp/include/header.jsp" />
			</header>
			
			<section>
				<div class="d-flex justify-content-center mt-5">
					<div class="text-center">
						<img class="rounded" width="100" height="100" alt="프로필 사진" src="https://cdn.pixabay.com/photo/2015/03/30/12/37/jellyfish-698521_960_720.jpg">
						<br>
						<h5 class="mt-3 font-weight-bold">사용자 닉네임</h5>
						
						<a href="/individual/profile/setting/view" class="btn btn-outline-secondary mt-3 mb-5">프로필 편집</a>
					</div>
				</div>
				
				<div class="mb-5">
					<h4>채널</h4>
					<hr>
					<div class="d-flex">
						<a href="#"><img class="rounded" width="100" height="100" alt="채널 프로필 이미지" src="https://cdn.pixabay.com/photo/2017/06/24/16/57/peony-2438192_960_720.jpg"></a>
						<div class="mt-3 ml-2">
							<a href="#" style="text-decoration:none"><h5 class="font-weight-bold text-dark">채널제목(ex.Les baguettes)</h5>
							<span class="text-secondary">구독자 38명</span></a>
						</div>
					</div>
					<div class="mt-3 text-secondary">
						채널소개(ex. 생각나는 것들을 적어나가는 곳)
					</div>
				</div>
				
			</section>
			
			<footer>
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
			</footer>
		
		</div>
		
		
	

</body>
</html>
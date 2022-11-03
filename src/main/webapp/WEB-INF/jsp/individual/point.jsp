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
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div class="d-flex justify-content-center">
				<div>
					<div class="rounded p-3" style="width:280px; background-color:rgb(164, 221, 240);">
						<label>보유포인트</label> <br>
						<div class="d-flex justify-content-between">
							<label class="mt-1 font-weight-bold">5,000p</label> 
							<a href="/individual/point/charge/view" class="btn btn-primary ml-3 text-white">충전하기</a>
						</div>
					</div>
				</div>
				
				<div style="width:400px;">
					<div class="ml-3">
						<h3> 구매/후원 내역 </h3>
						<hr>
						
						<div class="border border-outline-secondary p-2 mt-2">
							<label> 포스트 제목(사례와 함께하는 회계원리)</label> <br>
							<label> 포스트 생성자의 닉네임(회계강좌교수님)</label> <br>
							<label class="font-weight-bold"> 500P</label>
						</div>
						
						<div class="border border-outline-secondary p-2 mt-2">
							<label> 포스트 제목(사례와 함께하는 회계원리)</label> <br>
							<label> 포스트 생성자의 닉네임(회계강좌교수님)</label> <br>
							<label class="font-weight-bold"> 500P</label>
						</div>
						
						<div class="border border-outline-secondary p-2 mt-2">
							<label> 포스트 제목(사례와 함께하는 회계원리)</label> <br>
							<label> 포스트 생성자의 닉네임(회계강좌교수님)</label> <br>
							<label class="font-weight-bold"> 500P</label>
						</div>
						
					</div>
				</div>
			</div>
		</section>
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

	<script
	  src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">

<meta charset="UTF-8">
<title>채널 생성 페이지</title>
</head>
<body>
	
	<div class="container">
	
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
		
		<section>
			<div class="d-flex justify-content-center mt-4" >
				<div>
					<div>
						<h2>내 채널 만들기</h2>
						<h5 class="mt-4">채널 프로필 사진</h5>
						<div class="profile-section">
							<input class="form-control form-control-sm mt-2" type="file">
							<a href="#" class="text-secondary text-end" style="float: right">이미지 삭제</a>
						</div>
					</div>
					
					<div class="mt-5">
						<h5>채널 제목</h5>
						<input class="form-control form-control-sm mt-2">
						<label class="text-secondary">크리에이터님의 채널에 이름을 붙여주세요. (최대32자)</label>
					</div>
					
					<div class="mt-1">
						<h5>채널 소개</h5>
						<textarea class="form-control"></textarea>
						
					</div>
					
					<div class="mt-5 mb-3">
						<div class="d-flex justify-content-between">
							<a class="btn btn-outline-secondary text-dark" href="/individual/profile/view">취소</a>
							<button class="btn text-white" type="button" style="background-color:deepskyblue">채널 생성</button>
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
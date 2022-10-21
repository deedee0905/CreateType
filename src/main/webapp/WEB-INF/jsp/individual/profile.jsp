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
						<img class="rounded" width="100" height="100" alt="프로필 사진" src="${user.profileImagePath }">
						<br>
						<h5 class="mt-3 font-weight-bold">${user.nickname }</h5>
						
						<a href="/individual/profile/setting/view" class="btn btn-outline-secondary mt-3 mb-5">프로필 편집</a>
					</div>
				</div>
				
				<div class="mb-5">
					<h4>채널</h4>
					<hr>
					
						<c:choose>
							<c:when test="${channel.id > 0}">
								<div class="d-flex">
									<a href="/individual/channel/view?channelId=${channel.id}"><img class="rounded" width="100" height="100" alt="채널 프로필 이미지" src="${channel.channelImagePath }"></a>
									<div class="mt-3 ml-2">
										<a href="/individual/channel/view" style="text-decoration:none"><h5 class="font-weight-bold text-dark">${channel.channelName }</h5>
										<span class="text-secondary">구독자 ${subscriber }명</span></a>
									</div>
								</div>
								<div class="mt-3 text-secondary">
									${channel.channelInfo }
								</div>
							</c:when>
						
						
							<c:otherwise>
								<div>
									<span class="text-secondary mt-1">아직 채널이 없습니다.</span> <br>
									
									<c:choose>
										<c:when test="${channelId == 0 && id == userId}">
											<a href="/individual/channel/create/view" class="btn btn-outline-secondary mt-3" href="#">채널 만들기</a>
										</c:when>
										
										<c:otherwise></c:otherwise>
									</c:choose>
									
									
								</div>
							</c:otherwise>
						</c:choose>
					
				</div>
				
			</section>
			
			<footer>
				<c:import url="/WEB-INF/jsp/include/footer.jsp" />
			</footer>
		
		</div>
		
		
	

</body>
</html>
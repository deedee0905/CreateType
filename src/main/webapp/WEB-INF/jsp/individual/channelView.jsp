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
<title>MY채널 </title>
</head>
<body>

	<div class="container">
		
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
		
		<div>
			<div class="d-flex justify-content-between">
				<div>
					<img class="rounded ml-1" width="90" height="90" alt="채널 프로필" src="${channel.channelImagePath }">
					<h5 class="font-weight-bold mt-2 ml-1">${channel.channelName }</h5>
					<div class="d-flex mt-2 mb-3 ml-1">
						<span class="text-secondary">구독자 ${subscirber }명</span>
						
						<c:choose>
							<c:when test="${channelNumber eq channelId }">
								<a href="/individual/channel/setting/view" class="btn btn-sm btn-primary ml-3 text-white">프로필 편집</a>
							</c:when>
							
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						
						
					</div>
					<div class="border border-secondary p-2 rounded introduce-box">
						${channel.channelInfo }
					</div>
				</div>
				
				<div>
					<div id="empty-box">
						<label></label>
					</div>
					<a class="btn btn-outline-secondary" href="/post/create/newPost/view" style="position: relative">새 포스트</a>
					<a class="btn btn-outline-secondary ml-3" href="/commision/postCreate/view">새 커미션</a>
				</div>
			</div>
			
			<hr>
			
			<%--창작 컨텐츠 box~ --%>
			<div class="mb-5">
				<div class="d-flex">
					<h4>최신 포스트(창작 컨텐츠)  </h4>
					<a href="/post/postAll/view?userId=${channel.userId }" style="text-decoration:none"><h4 class="ml-2"><i class="bi bi-plus-square text-dark"></i></h4></a>
				</div>
				
				<div>
				<c:forEach var="post" items="${postList }">
					<div class="border border-outline-secondary p-2 mt-2">
						
						<a href="/post/create/postObject/view?id=${post.post.id }&channelId=${post.post.channelId}" style="text-decoration: none">
							<span class="font-weight-bold text-dark mb-2" style="font-size:20px;">${post.post.title }</span>
						</a> <br>

						<a href="/post/create/postObject/view?id=${post.post.id }&channelId=${post.post.channelId}" style="text-decoration: none" class="text-dark" class="mt-2">
							${post.post.content }
						</a>
						<hr>
						<span><i class="bi bi-heart-fill text-danger"></i></span>
						<label>${post.likeCount }</label>
						<label> / </label>
						<label>view ${post.viewCount }</label>
					</div>
				</c:forEach>	
				</div>
			
			</div>
			<%--~창작 컨텐츠 box --%>
			
			<hr>
			
			<%--커미션 컨텐츠 box~ --%>
			<div class="mt-4">
				<div class="d-flex">
					<h4>최신 포스트(커미션)  </h4>
					<a href="#" style="text-decoration:none"><h4 class="ml-2"><i class="bi bi-plus-square text-dark"></i></h4></a>
				</div>
				
				<div class="mt-2">
					<div class="d-flex">
						<a href="#"><img class="rounded" width="180" height="200" alt="커미션1" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2Fbc%2Fbe%2F57%2Fbcbe577d8bab4eb850a83fd8bffb632a.jpg&type=sc960_832"></a>
						<div class="p-2">
							<a href="#" style="text-decoration:none"><span class="font-weight-bold text-dark" style="font-size:20px">표지 커미션</span> <br>
							<span class="text-dark">#카테고리(그림, 글 디자인 중 1개)</span> <br>
							<span class="text-dark">가격 20,000원 ~ 50,000원</span> <br>
							<span class="text-dark">NN 이내 전달</span></a>
						</div>
					</div>
				</div>
				
				
				
			</div>
			<%--~커미션 컨텐츠 box --%>
		</div>
			
		</section>
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>
	
	<script>
		$(document).ready(function() {
			
			
			
		});
	</script>
	

</body>
</html>
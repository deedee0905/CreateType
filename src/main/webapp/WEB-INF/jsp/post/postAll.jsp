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

<title>posts</title>
</head>
<body>

	<div class="container">
	
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div>
				<div>
					<span class="font-weight-bold p-1" style="font-size: 20px">포스트</span> <br>
					<label class="p-1">25개의 포스트</label>
					<hr>
					
					<c:forEach var="postList" items="${postList }">
						<div class="d-flex mt-3">
							<div>
								<a href="#">
									<img class="rounded" width="180" height="260" alt="웹툰1" src="${postList.post.thumbnail }">
								</a>
							</div>
							
							<div class="ml-3">
								<%--제목 --%>
								<a href="#" style="text-decoration:none">
									<h3 class="text-dark">${postList.post.title }</h3>
								</a>
								<%--작성자 / 조회수 / 덧글수 / 좋아요수 --%>
								<h5 class="text-dark">${postList.user.nickname }  <label class="ml-1">조회수 ${postList.viewCount }</label>   <i class="bi bi-chat-dots ml-2"></i> ${postList.commentCount }  <i class="bi bi-suit-heart ml-2"></i> ${postList.likeCount } </h5>
								<p>
									<a href="#" class="text-dark count" style="text-decoration:none"> </a>
								</p>
								
							</div>
						</div>
					</c:forEach>
					
				</div>	
			</div>
		</section>
	
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>

</body>
</html>
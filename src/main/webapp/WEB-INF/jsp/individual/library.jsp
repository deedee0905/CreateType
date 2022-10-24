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

<title>보관함</title>
</head>
<body>
	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
		
		
		<section>
			
			<h3 class="mb-2">보관함</h3>
			<hr>
			
			<c:forEach var="likeList" items="${likeList }">
			
			
					<div class="border border-outline-secondary p-2 mt-2">
						
						<a href="/post/create/postObject/view?id=${likeList.post.id }&channelId=${likeList.post.channelId}" style="text-decoration: none">
							<span class="font-weight-bold text-dark mb-2" style="font-size:20px;">${likeList.post.title }</span>
						</a> <br>
		
						<a href="/post/create/postObject/view?id=${likeList.post.id }&channelId=${likeList.post.channelId}" style="text-decoration: none" class="text-dark" class="mt-2">
							${likeList.post.content }
						</a>
						<hr>
						<div class="d-flex justify-content-between">
							<div>
								<span><i class="bi bi-heart-fill text-danger"></i></span>
								<label>${likeList.likeCount }</label>
								<label> / </label>
								<label>view ${likeList.viewCount }</label>
							</div>
							
							<div class="ml-3">
								<button class="btn btn-outline-secoundary deleteLike" data-post-id="${likeList.post.id }"><i class="bi bi-heart-fill text-danger mr-1"></i>좋아요</button>
							</div>
						</div>
						
					</div>
				
		
			
			
			
			</c:forEach>
			
			
		</section>
		
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</footer>
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			$(".deleteLike").on("click", function() {
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					,url:"/post/like/delete"
					,data:{"postId":postId}
					,success: function(data) {
						
						if(data.result == "success"){
							location.reload();
							return;
						} else {
							alert("좋아요 삭제 실패");
							return;
						}
					}
					,error: function() {
						alert("좋아요 삭제 에러");
					}
				});

			});
			
			
			
			
			
		});
	
	</script>

</body>
</html>
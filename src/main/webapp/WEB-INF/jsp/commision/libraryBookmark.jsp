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
<title>보관함 - 북마크</title>
</head>
<body>

	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div class="d-flex justify-content-between">
				<h3 class="mb-2">보관함 - 북마크</h3>
				
				<div>
					<a href="/individual/library/view" class="btn btn-outline-primary">좋아요</a>
					<a href="/commision/library/view" class="btn btn-outline-primary ml-2">북마크</a>
				</div>
			</div>
			<hr>
			
			<c:forEach var="bookmark" items="${bookmarkList }">
				<div class="mt-4">
					<div class="mt-2">
						<div class="d-flex">
							<a href="/commision/postObject/view?id=${bookmark.commisionPost.id }&channelId=${bookmark.commisionPost.channelId}">
								<img class="rounded" width="180" height="200" alt="커미션" src="${bookmark.commisionPost.thumbnail }">
							</a>
							<div class="p-2">
								<a href="/commision/postObject/view?id=${bookmark.commisionPost.id }&channelId=${bookmark.commisionPost.channelId}" style="text-decoration:none"><span class="font-weight-bold text-dark" style="font-size:20px">${bookmark.commisionPost.title }</span> <br>
									<span class="text-dark">${bookmark.user.nickname }</span>
									<c:choose>
										<c:when test="${bookmark.commisionPost.category == 1 }">
											<span class="text-dark">#일러스트</span> <br>
										</c:when>
										
										<c:when test="${bookmark.commisionPost.category == 2 }">
											<span class="text-dark">#글</span> <br>
										</c:when>
										
										<c:otherwise>
											<span class="text-dark">#디자인</span> <br>
										</c:otherwise>
									</c:choose>
									<span class="text-dark">가격 <fmt:formatNumber value="${bookmark.commisionPost.minimumPrice }" type="number"/>원 ~ <fmt:formatNumber value="${bookmark.commisionPost.minimumPrice }" type="number"/>원</span> <br>
									<span class="text-dark">${bookmark.commisionPost.deadline }일 이내 전달</span>
								</a> <br>
								<button class="btn btn-sm btn-outline-secondary mt-3 deleteBookmark" data-post-id="${bookmark.commisionPost.id }" data-channel-id="${bookmark.commisionPost.channelId }">북마크 해제</button>
							</div>
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
			
			$(".deleteBookmark").on("click", function() {
				let postId = $(this).data("post-id");
				let channelId = $(this).data("channel-id");
				
				$.ajax({
					type:"get"
					,url:"/commision/bookmark/delete"
					,data:{"postId":postId, "channelId":channelId}
					,success: function(data){
						if(data.result == "success"){
							location.reload();
							return
						} else {
							alert("북마크 해제 실패");
							return;
						}
					}
					,error: function(){
						alert("북마크 해제 오류");
					}
					
				});
				
			});
			
		});
				
	</script>

</body>
</html>
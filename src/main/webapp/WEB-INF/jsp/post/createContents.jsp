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
<title>개인창작 컨텐츠</title>
</head>
<body>

	<div class="container">
		
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div class="d-flex justify-content-between mt-3">
				<h2 id="contentTitle">개인 창작 컨텐츠</h2>
				<div class="d-flex">
					<a href="/post/createList/view?category=1" style="text-decoration:none" ><span id="webtoon" class="create text-dark" style="font-size:28px">#웹툰</span></a>
					<a href="/post/createList/view?category=2" style="text-decoration:none" ><span id="webnovel" class="create ml-3 text-dark" style="font-size:28px">#웹소설</span></a>
					<a href="/post/createList/view?category=3" style="text-decoration:none" ><span id="design" class="create ml-3 text-dark" style="font-size:28px">#디자인</span></a>
					<a href="/post/createList/view?category=4" style="text-decoration:none" ><span id="readymade" class="create ml-3 text-dark" style="font-size:28px">#레디메이드</span></a>
				</div>
			</div>
			
			<hr>
			
				<c:forEach var="postList" items="${postList }">
				<div class="d-flex mt-3">
					<div>
						<a class="count" href="/post/create/postObject/view?id=${postList.post.id }&channelId=${postList.post.channelId}" data-post-id="${postList.post.id }">
							<img class="rounded" width="200" height="290" alt="웹툰1" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjhfNTYg%2FMDAxNjU5MDAxMjYyMTgz.o2JI_WETBFSnERaqwskDQgIgrwkZ2bkkbVi6uETMO_Mg.BWprgR0GaHKsrTe9GVSTbBOmHNv63o_ZPT1bjUmTeckg.JPEG.buzar_777%2FScreenshot%25A3%25DF20220728%25A3%25AD183507%25A3%25DFNAVER.jpg&type=sc960_832">
						</a>
					</div>
					
					<div class="ml-3">
						<%--제목 --%>
						<a class="count" href="/post/create/postObject/view?id=${postList.post.id }&channelId=${postList.post.channelId}" style="text-decoration:none" data-post-id="${postList.post.id }">
							<h3 class="text-dark count">${postList.post.title }</h3>
						</a>
						<%--작성자 / 조회수 / 덧글수 / 좋아요수 --%>
						<h5 class="text-dark">${postList.user.nickname }  <label class="ml-1">view ${postList.viewCount }</label>   <i class="bi bi-chat-dots ml-2"></i> ${postList.commentCount }   <i class="bi bi-suit-heart ml-2"></i> ${postList.likeCount } </h5>
						<p>
							<a href="/post/create/postObject/view?id=${postList.post.id }&channelId=${postList.post.channelId}" data-post-id="${postList.post.id }" class="text-dark count" style="text-decoration:none"> </a>
						</p>
						
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
			
			$(".count").on("click", function(e) {
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/viewCount"
					,data: {"postId":postId}
					,success: function(data) {
						
						if(data.result == "success"){
							
						} else {
							alert("조회수 입력 실패");
							
						}
						
					}
					,error: function() {
						alert("조회수 입력 에러");
						return;
					}
					
				});
				
			});
			
		
			
			
		});
	
	</script>

</body>
</html>
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
<title>Commision posts</title>
</head>
<body>
	
	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div>
				<span class="font-weight-bold p-1" style="font-size: 20px">${count }개의 커미션 포스트</span> <br>
				<hr>
			</div>
			
			<c:choose>
				<c:when test="${count == 0 }">
					<div class="mt-5 mb-5 text-center">
						<img width="150" height="150" alt="경고" src="https://cdn.pixabay.com/photo/2016/07/25/14/42/close-1540630_960_720.png" >
						<br>
						<h4 class="mt-3 mb-5">작성된 게시물이 없습니다.</h4>
					</div>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="postList" items="${postList }">
						<div class="mt-4">
							<div class="mt-2">
								<div class="d-flex">
									<a href="/commision/postObject/view?id=${postList.id }&channelId=${postList.channelId }"><img class="rounded" width="180" height="200" alt="커미션" src="${postList.thumbnail }"></a>
									<div class="p-2">
										<a href="/commision/postObject/view?id=${postList.id }&channelId=${postList.channelId }" style="text-decoration:none"><span class="font-weight-bold text-dark" style="font-size:20px">${postList.title }</span> <br>
										<c:choose>
											<c:when test="${postList.category == 1 }">
												<span class="text-dark">#일러스트</span> <br>
											</c:when>
											
											<c:when test="${postList.category == 2 }">
												<span class="text-dark">#글</span> <br>
											</c:when>
											
											<c:otherwise>
												<span class="text-dark">#디자인</span> <br>
											</c:otherwise>
										</c:choose>
										<span class="text-dark">가격 <fmt:formatNumber value="${postList.minimumPrice }" type="number"/>원 ~ <fmt:formatNumber value="${postList.maximumPrice }" type="number"/>원</span> <br>
										<span class="text-dark">${postList.deadline }일 이내 전달</span></a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
				
			</c:choose>
			
		</section>
	
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>
	
</body>
</html>
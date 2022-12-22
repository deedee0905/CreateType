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
	
<title>커미션 포스트</title>
</head>
<body>

	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div>
				<div class="d-flex justify-content-between mt-3">
				<h2 id="contentTitle">커미션 포스트</h2>
				<div class="d-flex">
					<a href="/commision/List/view?category=1" style="text-decoration:none" ><span id="il" class="create text-dark" style="font-size:28px">#일러스트</span></a>
					<a href="/commision/List/view?category=2" style="text-decoration:none" ><span id="webnovel" class="create ml-3 text-dark" style="font-size:28px">#글</span></a>
					<a href="/commision/List/view?category=3" style="text-decoration:none" ><span id="design" class="create ml-3 text-dark" style="font-size:28px">#디자인</span></a>
				</div>
			</div>
			
			<hr>
			</div>
			
			<c:forEach var="commisionList" items="${commisionPostList }">
				<div class="d-flex mt-3">
						<div>
							<a href="/commision/postObject/view?id=${commisionList.commisionPost.id }&channelId=${commisionList.commisionPost.channelId}">
								<img class="rounded" width="180" height="260" alt="웹툰1" src="${commisionList.commisionPost.thumbnail }">
							</a>
						</div>
						
						<div class="ml-3">
							<%--제목 / 작성자 / 마감기한 --%>
							<a class="" href="/commision/postObject/view?id=${commisionList.commisionPost.id }&channelId=${commisionList.commisionPost.channelId}" style="text-decoration:none">
								<h3 class="text-dark">${commisionList.commisionPost.title }</h3>
								<h5 class="text-dark"> ${commisionList.user.nickname } </h5>
								
								<c:choose>
									<c:when test="${commisionList.commisionPost.deadline == 0}">
										<label class="text-danger">*신청 마감된 커미션입니다.</label>
									</c:when>
									
									<c:otherwise>
										<h5 class="text-dark">${commisionList.commisionPost.deadline } 일 이내 전달</h5>	
									</c:otherwise>
								</c:choose>
									
							</a>
							
										
						</div>
				</div>
			</c:forEach>
			
			
			
		</section>
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	
	</div>

</body>
</html>
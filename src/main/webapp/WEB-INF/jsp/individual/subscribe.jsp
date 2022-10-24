<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>구독채널 view</title>
</head>
<body>

	<div class="container">
		
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div>
				<h4 class="ml-4">구독 채널</h4>
				<hr>
			</div>
			
			<c:choose>
				<c:when test="${channelCount == 0}">
					<div class="text-center">
						아직 구독중인 채널이 없습니다.
					</div>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="subscription" items="${subscriptionList }">
						<div class="list-group list-group-flush">
						
						<ul class="list-group list-group-flush">
						  <li class="list-group-item center">
						  	<div class="d-flex justify-content-between">
						  		<div class="d-flex">
						  			<a href="#">
						  				<img class="rounded" width="80" height="80" alt="사진" src="${subscription.channel.channelImagePath }">
						  			</a>
						  			<div>
							  			<a href="#" style="text-decoration:none">
								  			<span style="font-size:20px" class="ml-3 text-dark" >${subscription.channel.channelName } </span> <br>
								  			<span class="ml-3 text-secondary">${subscription.channel.channelInfo }</span>
							  			</a>
						  			</div>
						  		</div>
						  		
						  		<div>
						  			<button class="btn btn-outline-white text-dark mt-3 deleteBtn" data-channel-id="${subscription.channel.id }">구독중</button>
						  		</div>
						  	</div>
						  </li>
						</ul>
						<hr>
					</div>
					</c:forEach>
				
				</c:otherwise>
			
			</c:choose>
			
			
			
		
			
		</section>
		
	
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	
	</div>
	
	<script>
		$(document).ready(function() {
			
			$(".deleteBtn").on("click", function(e) {
				e.preventDefault();
				
				let channelId = $(this).data("channel-id");
				
				$.ajax({
					type:"get"
					, url:"/individual/subscription/delete"
					, data:{"channelId":channelId}
					, success: function(data){
						
						if(data.result == "success"){
							location.reload();
							return;
						} else {
							alert("구독취소 실패");
							return;
						}
						
					}
					, error: function(){
						alert("구독취소 에러");
					}
					
				});
				
			});
			
		});
	
	</script>

</body>
</html>
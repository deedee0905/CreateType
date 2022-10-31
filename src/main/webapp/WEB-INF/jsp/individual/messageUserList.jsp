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
<title>메세지</title>
</head>
<body>

	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div>
				<label class="font-weight-bold" style="font-size:25px">메세지</label>
				<hr>
			</div>
			
			<div class="d-flex justify-content-center">
				<div>
					
					<div class="text-center mb-3"><h4>메세지 목록</h4></div>
					
					<div>
						<c:forEach var="dms" items="${dms }">
							<div class="mt-1 mb-1 border border-outline-secondary p-3">
								<div class="d-flex" >
									<a href="/individual/messageList/view?userIdOthers=${dms.dm.userIdOthers }" data-userid-others="${dms.dm.userIdOthers }" style="text-decoration:none" >
										<img   class="rounded" width="50" height="50" alt="프로필사진" src="${dms.user.profileImagePath }">
										<label class="mt-2 ml-3 font-weight-bold text-dark">${dms.user.nickname }</label> 
										<label class="text-dark">님과의 대화목록</label> 
									</a>
								</div>
							</div>
						</c:forEach>
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
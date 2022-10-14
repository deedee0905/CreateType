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
			
			<div class="list-group list-group-flush">
				<ul class="list-group list-group-flush">
				  <li class="list-group-item center">
				  	<div class="d-flex justify-content-around">
				  		<div class="d-flex">
				  			<img class="rounded" width="80" height="80" alt="사진" src="https://cdn.pixabay.com/photo/2016/11/29/05/45/astronomy-1867616_960_720.jpg">
				  			<div>
					  			<span style="font-size:20px" class="ml-3">채널이름</span> <br>
					  			<span class="ml-3 text-secondary">채널 소개 샘플</span>
				  			</div>
				  		</div>
				  		
				  		<div>
				  			<button class="btn btn-outline-white text-dark mt-3">구독중</button>
				  		</div>
				  	</div>
				  </li>
				  
				  <li class="list-group-item">
				  	<div class="d-flex justify-content-around">
				  		<div class="d-flex">
				  			<img class="rounded" width="80" height="80" alt="사진" src="https://cdn.pixabay.com/photo/2019/11/03/20/33/raspberry-4599580_960_720.jpg">
				  			<div>
					  			<span style="font-size:20px" class="ml-3">채널이름2</span> <br>
					  			<span class="ml-3 text-secondary">채널 소개 샘플2</span>
				  			</div>
				  		</div>
				  		
				  		<div>
				  			<button class="btn btn-outline-white text-dark mt-3">구독중</button>
				  		</div>
				  	</div>
				  </li>
				  
				  <li class="list-group-item">
				  	<div class="d-flex justify-content-around">
				  		<div class="d-flex">
				  			<img class="rounded" width="80" height="80" alt="사진" src="https://cdn.pixabay.com/photo/2016/02/22/10/06/hedgehog-1215140_960_720.jpg">
				  			<div>
					  			<span style="font-size:20px" class="ml-3">채널이름3</span> <br>
					  			<span class="ml-3 text-secondary">채널 소개 샘플3</span>
				  			</div>
				  		</div>
				  		
				  		<div>
				  			<button class="btn btn-outline-white text-dark mt-3">구독중</button>
				  		</div>
				  	</div>
				  </li>
				  
				  <li class="list-group-item">
				  	<div class="d-flex justify-content-around">
				  		<div class="d-flex">
				  			<img class="rounded" width="80" height="80" alt="사진" src="https://cdn.pixabay.com/photo/2020/05/13/11/38/cherry-blossoms-5167156_960_720.jpg">
				  			<div>
					  			<span style="font-size:20px" class="ml-3">채널이름4</span> <br>
					  			<span class="ml-3 text-secondary">채널 소개 샘플4</span>
				  			</div>
				  		</div>
				  		
				  		<div>
				  			<button class="btn btn-outline-white text-dark mt-3">구독중</button>
				  		</div>
				  	</div>
				  </li>
				  
				  
				</ul>
			</div>
			
			
		</section>
		
	
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	
	</div>

</body>
</html>
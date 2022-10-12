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
				<h2>개인 창작 컨텐츠</h2>
				<div class="d-flex">
					<a href="#" style="text-decoration:none" ><h3 id="webtoon" class="create text-primary">#웹툰</h3></a>
					<a href="#" style="text-decoration:none"><h3 id="webnovel" class="create ml-3 text-dark">#웹소설</h3></a>
					<a href="#" style="text-decoration:none"><h3 id="design" class="create ml-3 text-dark">#디자인</h3></a>
					<a href="#" style="text-decoration:none"><h3 id="readymade" class="create ml-3 text-dark">#레디메이드</h3></a>
				</div>
			</div>
			
			<hr>
			
				<c:forEach var="category" items="${postCategory }">
				<div class="d-flex mt-3">
					<div>
						<img class="rounded" width="200" height="300" alt="웹툰1" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjhfNTYg%2FMDAxNjU5MDAxMjYyMTgz.o2JI_WETBFSnERaqwskDQgIgrwkZ2bkkbVi6uETMO_Mg.BWprgR0GaHKsrTe9GVSTbBOmHNv63o_ZPT1bjUmTeckg.JPEG.buzar_777%2FScreenshot%25A3%25DF20220728%25A3%25AD183507%25A3%25DFNAVER.jpg&type=sc960_832">
					</div>
					
					<div class="ml-3">
						<h4>${category.title }</h4>
						<h5>닉네임 / view 34 / 덧글 4 / ♡ 5</h5>
						<p>
						${category.content }
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
			
			$(".create").on("click", function(e) {
				e.preventDefault();
				
				
				$("#webtoon").attr("class", "text-dark")
				$("#webnovel").attr("class", "text-dark ml-3")
				$("#design").attr("class", "text-dark  ml-3")
				$("#readymade").attr("class", "text-dark  ml-3")
				$(this).attr("class", "text-primary ml-3");

			});
			
		
			
			
		});
	
	</script>

</body>
</html>
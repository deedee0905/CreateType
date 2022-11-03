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
<title>Insert title here</title>
</head>
<body>

	<div class="container">
	
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div>
				<div>
					<h5>
						<button id="testBtn" class="btn btn-success">테스트용 버튼</button>
					</h5>
				</div>
				
				<div>
					<%-- 충전할 포인트 selec radio-box --%>
					<div class="d-flex justify-content-center">
						<div style="width:150px">
							<h5 class="mt-1">충전할 포인트</h5>
						</div>
						<div class="rounded border border-secondary ml-3" style="width:300px">
							<div class="mt-3 ml-3">
								<input class="point" type="radio" name="point" checked value="5000">
								<label> <fmt:formatNumber value="5000" type="number"/>p</label>
							</div>
							
							<hr>
							
							<div class="mt-3 ml-3">
								<input type="radio" name="point" value="10000">
								<label> <fmt:formatNumber value="10000" type="number"/>p</label>
							</div>
							
							<hr>
							
							<div class="mt-3 ml-3">
								<input type="radio" name="point" value="15000">
								<label> <fmt:formatNumber value="15000" type="number"/>p</label>
							</div>
							
							<hr>
							
							<div class="mt-3 ml-3">
								<input type="radio" name="point" value="20000">
								<label> <fmt:formatNumber value="20000" type="number"/>p</label>
							</div>
							
							<hr>
							
							<div class="mt-3 ml-3">
								<input type="radio" name="point" value="30000">
								<label> <fmt:formatNumber value="30000" type="number"/>p</label>
							</div>
							
							<hr>
							
							<div class="mt-3 ml-3 mb-3">
								<input type="radio" name="point" value="50000">
								<label> <fmt:formatNumber value="50000" type="number"/>p</label>
							</div>
						</div>
					</div>
					
					
					<%--결제 수단 --%>
					<div class="d-flex justify-content-center mt-3">
						<div style="width:150px">
							<h5 class="mt-1">결제 수단</h5>
						</div>
						
						<div class="rounded border border-secondary ml-3" style="width:300px">
							<div class="mt-3 ml-3">
								<input type="radio" name="payment" value="카카오페이">
								<label>카카오페이</label>
							</div>
							
							<hr>
							
							<div class="mt-3 ml-3">
								<input type="radio" name="payment" value="신용 카드">
								<label>신용 카드</label>
							</div>
							
							<hr>
							
							<div class="mt-3 ml-3">
								<input type="radio" name="payment" value="무통장 입금">
								<label>무통장 입금</label>
							</div>
							
							<hr>
							
							<div class="mt-3 ml-3 mb-3">
								<input type="radio" name="payment" value="Paypal">
								<label>Paypal(Global)</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>

	<script>
		$(document).ready(function() {
			
			$("#testBtn").on("click", function() {
				
				let test = $('input[name="payment"]:checked').val();
				
				alert(test);
				return;
				
			});
			
		});
	
	</script>

</body>
</html>
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
<title>내 수익내역</title>
</head>
<body>

	<div class="container">
	
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div class="d-flex justify-content-center">
				<div>
					<div class="rounded p-3" style="width:280px; background-color:rgb(164, 221, 240);">
						<label>포스트 수익</label> <br>
						<div class="d-flex justify-content-between">
							<label class="mt-1 font-weight-bold"><fmt:formatNumber value="${revenue }" type="number"/>P</label> 
							<button class="btn btn-primary ml-3 text-white" data-toggle="modal" data-target="#exampleModal">출금하기</button>
						</div>
					</div>
				</div>
				
				<div style="width:400px;">
					<div class="ml-3">
						<h3> 수익 내역 </h3>
						<hr>
						
						<div>
							<c:forEach var="revenueList" items="${revenueList }">
								<div class="border border-outline-secondary p-2 mt-2">
									<a class="font-weight-bold text-dark" href="/post/create/postObject/view?id=${revenueList.post.id }&channelId=${revenueList.post.channelId}" style="text-decoration:none"> ${revenueList.post.title }</a> <br>
									<a class="text-dark" href="/post/create/postObject/view?id=${revenueList.post.id }&channelId=${revenueList.post.channelId}" style="text-decoration:none"> 구매자 : ${revenueList.user.nickname }</a> <br>
									<label class="text-info">${revenueList.point.methodOfPayment }</label>
								</div>
							</c:forEach>
						</div>
						
						
		
						
					</div>
				</div>
			</div>
		</section>
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>
	
	<!--출금하기 Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      
	        <table class="table text-center">
	        	<thead>
	        		<tr>
	        			<th>출금 가능 포인트</th>
	        			<th>출금할 포인트</th>
	        			
	        		</tr>
	        	</thead>
	        		
	        	<tbody>
	        		<tr>
	        			<c:set var="revenue" value="${revenue }"/>
	        			<td><fmt:formatNumber value="${revenue }" type="number" />P</td>
	        			<td><input id="withdrawInput" class="form-control form-control-sm"></td>
	        			
	        		</tr>
	        	</tbody>
	        </table>
	        
	        <hr>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	        <button id="withdrawBtn" type="button" class="btn btn-primary">출금하기</button>
	      </div>
	    </div>
	  </div>
	</div>

	<script>
		$(document).ready(function() {
			
			$("#withdrawBtn").on("click", function(e) {
				e.preventDefault();
				
				let myPoint = ${revenue}
				let price = $("#withdrawInput").val();
				let balance = myPoint - price;
				let methodOfPayment = "출금";
				let channelId = ${channelId}
				
				if(balance < 0){
					alert("수익 포인트 이상으로 출금 할 수 없습니다.");
					return;
				}
				
				$.ajax({
					type:"get"
					, url:"/individual/point/withdraw"
					, data:{"methodOfPayment":methodOfPayment, "price":price}
					, success: function(data){
						
						if(data.result == "success"){
							location.reload();
							return;
						} else {
							alert("포인트 출금 실패");
							return;
						}
						
					}
					, error: function(){
						alert("포인트 출금 에러");
						return
					}
				});
				
			});
			
		});
	</script>

</body>
</html>
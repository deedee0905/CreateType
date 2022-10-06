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
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<meta charset="UTF-8">
<title>새 포스트</title>
</head>
<body>

	<div class="container">
	
		<header class="d-flex justify-content-between">
			<div class="mr-2 mt-4">
				<a href="/individual/channel/view" style="text-decoration: none; font-size:20px" class="text-secondary">뒤로가기</a>
			</div>
			<div>
				<a href="/post/main/view" style="text-decoration:none"><h1 class="text-center mt-3 mb-3" style="color:deepskyblue">CreateType</h1></a>
			</div>
			<div class="mr-2 mt-4">
				
				<a id="saveBtn" href="#" style="text-decoration: none; font-size:20px" class="text-secondary">저장</a>
				<a href="#" style="text-decoration: none; font-size:20px" class="text-secondary ml-3" data-target="#modal" data-toggle="modal">발행<i class="ml-1 bi bi-three-dots"></i></a>
			</div>
		</header>
		
		<hr>
		
		<section>
			<div class="mt-2">
				<input class=" mt-3 form-control form-control-lg" placeholder="제목을 입력하세요" type="text"> <br>
				<input class="ml-1 mb-5 form-control form-control-sm" placeholder="부제목을 입력하세요" type="text">
			</div>
			
			<div id="summernote"></div> 
			
			
			
		</section>
	
		<%--모달~--%>	
		<div class="modal " id="modal" tabindex="-1" role="dialog" >
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		       
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body" style="height:280px">
		      
		        <div class="d-flex">
		        	<span class="font-weight-bold mt-3" style="font-size:15px">썸네일</span>
		        	<input class="form-control col-8 ml-3" type="file">
		        	<button class="btn btn-dark ml-2">삭제</button>
		        </div>
		        
		        <div class="mt-5 d-flex" style="height:30px">
		        	<span class="font-weight-bold mt-2" style="font-size:15px">카테고리</span>
		        	<select class="custom-select custom-select-lg mb-3 col-7 ml-3">
					  <option selected value="1">웹툰</option>
					  <option value="2">웹소설</option>
					  <option value="3">디자인</option>
					  <option value="4">레디메이드</option>
					</select>
		        </div>
		        
		        <div class="d-flex mt-5">
		        	<span class="font-weight-bold mt-2" style="font-size:15px">판매가격</span>
		        	<input class="form-control col-8 ml-3" type="text">
		        </div>
		        
		        <div class="d-flex mt-5">
		        	<span class="font-weight-bold mt-2" style="font-size:16px">발행시간</span>
		        	<div class="ml-3 mt-2">
			        	<div class="form-check form-check-inline">
						  <input class="form-check-input now" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
						  <label class="form-check-label now" for="inlineRadio1">지금</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input reservation" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
						  <label class="form-check-label reservation" for="inlineRadio2">예약</label>
						</div>
						<input id="postReservationDate" class="form-control ml-4 d-none" type="date">
		        	</div>
		        </div>
		        
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary">발행하기</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		<%--~모달--%>
		
	</div>

	<script>
		$(document).ready(function() {
			
			
	
			  $('#summernote').summernote();
			  
			  $(".reservation").on("click", function() {
				  $("#postReservationDate").removeClass("d-none");
				  
			  });

			  $(".now").on("click", function() {
				  $("#postReservationDate").addClass("d-none");
				  
			  });
			  
			  $("#saveBtn").on("click", function() {
				  alert("저장 완료");
			  });
			  
			  
			});
	</script>

</body>
</html>
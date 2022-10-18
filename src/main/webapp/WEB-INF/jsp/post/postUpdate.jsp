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
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<title>글 수정하기</title>
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
				<input id="titleInput" class=" mt-3 form-control form-control-lg" value="${post.title }" type="text"> <br>
				<input id="subtitleInput" class="ml-1 mb-5 form-control form-control-sm" value="${post.subtitle }" type="text">
				
			</div>

			
			<div id="summernote">
				${post.content }
			</div> 
			
			
			
		
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
		        	<input id="fileInput" class="form-control col-8 ml-3" type="file" data-post-thumbnail="${post.thumbnail }">
		        	<button class="btn btn-dark ml-2">삭제</button>
		        </div>
		        
		        <div class="mt-5 d-flex" style="height:30px">
		        	<span class="font-weight-bold mt-2" style="font-size:15px">카테고리</span>
		        	<select id="category" class="custom-select custom-select-lg mb-3 col-7 ml-3">
					  <option value="1">웹툰</option>
					  <option value="2">웹소설</option>
					  <option value="3">디자인</option>
					  <option value="4">레디메이드</option>
					</select>
		        </div>
		        <label class="text-sm text-danger">*발행 카테고리를 확인하세요.</label>
		        
		        
		        <div class="d-flex mt-5">
		        	<span class="font-weight-bold mt-2" style="font-size:15px">판매가격</span>
		        	<input id="priceInput" class="form-control col-8 ml-3" type="text" value="${post.price }">
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
		        <button id="publishBtn" type="button" class="btn btn-primary">발행하기</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		<%--~모달--%>
		
	</div>

	<script>
		
		$(document).ready(function() {
			
			// 썸머노트 기초값 셋팅
			$('#summernote').summernote({
				height : 400, // set editor height
				minHeight : null, 
				maxHeight : null, 
				focus : true,
				lang : 'ko-KR'
				
			});
			
			$("#publishBtn").on("click", function(e) {
				e.preventDefault();
				
				let id = ${post.id}
				let title = $("#titleInput").val();
				let subtitle = $("#subtitleInput").val();
				let content = $('#summernote').summernote("code");
				let category= $("#category").val();
				let price= $("#priceInput").val();
				let thumbnail = $("#fileInput").data("post-thumbnail");
				
				let url = "/post/create/postObject/view?id=" + ${post.id} + "&channelId=" + ${post.channelId};
				
				
				if(title == ""){
					alert("제목을 입력하세요");
					return;
				}
				
				if(content == ""){
					alert("본문 내용을 입력하세요.");
					return;
				}
				
				if(price == ""){
					alert("가격을 확인하세요.");
					return;
				}
				
				if(thumbnail == ""){
					alert("섬네일을 설정하세요.");
					return;
				}
				
				var formDate = new FormData();
				formDate.append("id", id);
				formDate.append("title", title);
				formDate.append("subtitle", subtitle);
				formDate.append("content", content);
				formDate.append("category", category);
				formDate.append("price", price);
				formDate.append("file", $("#fileInput")[0].files[0]);
				
				
				$.ajax({
					type:"post"
					, url: "/post/create/postUpdate"
					, data:formDate
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success: function(data) {
						
						if(data.result == "success"){
							location.href= url;
							return;
						} else {
							alert("수정 실패");
							return;
						}
						
					}
					, error: function() {
						alert("수정 에러");
					}
					
				});
				
			});
			
			
		});
	
	</script>

</body>
</html>
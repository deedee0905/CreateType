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
	
	
	
<title>New Commision Post</title>

	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

</head>
<body>

	<div class="container">
	
		
		<header class="d-flex justify-content-between">
			<div class="mr-2 mt-4">
				<a href="/individual/channel/view?channelId=${channelId }" style="text-decoration: none; font-size:20px" class="text-secondary">뒤로가기</a>
			</div>
			<div>
				<a href="/post/main/view" style="text-decoration:none"><h1 class="text-center mt-3 mb-3" style="color:deepskyblue">CreateType</h1></a>
			</div>
			<div class="mr-2 mt-4">
				
				<a href="#" style="text-decoration: none; font-size:20px" class="text-secondary ml-3" data-target="#modal" data-toggle="modal">발행<i class="ml-1 bi bi-three-dots"></i></a>
			</div>
		</header>
		
		<hr>
		
		<section>
			<div class="mt-2">
				<input id="titleInput" class=" mt-3 form-control form-control-lg" placeholder="제목을 입력하세요" type="text"> <br>
				<label style="font-size:20px">커미션 포스트 인포</label>
			</div>

			
			<div id="summernote"></div>
			
			
			<div>
				<label style="font-size:20px">커미션 신청폼 질문</label> <br>
				<textarea id="questionInput" class="form-control" rows="10"></textarea>
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
		        	<input id="thumbnailInput" class="form-control col-8 ml-3" type="file">
		        	<button id="imageDelete" class="btn btn-dark ml-2">삭제</button>
		        </div>
		        
		        <div class="mt-5 d-flex" style="height:30px">
		        	<span class="font-weight-bold mt-2" style="font-size:15px">카테고리</span>
		        	<select id="category" class="custom-select custom-select-lg mb-3 col-7 ml-3">
					  <option selected value="1">일러스트</option>
					  <option value="2">글</option>
					  <option value="3">디자인</option>
					</select>
		        </div>
		        
		        <div class="d-flex mt-5">
		        	<span class="font-weight-bold mt-2" style="font-size:15px">커미션 가격</span>
		        	<input id="minimumPriceInput" class="form-control col-3 ml-3" type="text">
		        	<label class="ml-2 mr-2 mt-1" style="font-size:16px"> ~ </label>
		        	<input id="maximumPriceInput" class="form-control col-3 ml-1" type="text">
		        </div>
		        
		        <div class="d-flex mt-5">
		        	<span class="font-weight-bold mt-2" style="font-size:16px">마감기한</span>
		        	<input id="deadlineInput" class="form-control col-3 ml-3"> <label class="mt-2 ml-1">일 이내 전달</label>
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
				lang : 'ko-KR',
				callbacks: {
				    onImageUpload: function(files) {
				    	uploadSummernoteImageFile(files[0],this);
				    }
				  }
				
			});
			
			
			function uploadSummernoteImageFile(file, editor) {
				data = new FormData();
				data.append("file", file);
				$.ajax({
					data : data,
					type : "POST",
					url : "/post/uploadSummernoteImageFile",
					contentType : false,
					processData : false,
					enctype : 'multipart/form-data',
					success : function(data) {
		            	//항상 업로드된 파일의 url이 있어야 한다.
						$(editor).summernote('insertImage', data.url);
					}
				});
			}
			
			$("#publishBtn").on("click", function(e) {
				e.preventDefault();
				
				let title = $("#titleInput").val();
				let content = $("#summernote").summernote("code");
				let category = $("#category").val();
				let minimumPrice = $("#minimumPriceInput").val();
				let maximumPrice = $("#maximumPriceInput").val();
				let deadline = $("#deadlineInput").val();
				let question = $("#questionInput").val();
				let file = $("#thumbnailInput").val();
				
			
				
				if(title == ""){
					 alert("제목을 입력하세요");
					 return
				 }
				 
				 if(content == "" || content == ("<p><br></p>")){
					 alert("내용을 입력하세요");
					 return
				 }
				 
				 if(file == ""){
					 alert("섬네일을 설정해주세요.");
					 return
				 }
				 
				 if(minimumPrice == ""){
					 alert("최소 가격을 설정해주세요.");
					 return
				 }
				 
				 if(maximumPrice == ""){
					 alert("최대 가격을 설정해주세요.");
					 return
				 }
				 
				 if(deadline == ""){
					 alert("마감 기한을 설정해주세요.");
					 return
				 }
				 
				 if(question == ""){
					 alert("커미션 신청을 위한 질문사항을 체크해주세요.");
					 return
				 }
				 
				 var formData = new FormData();
				 formData.append("title", title);
				 formData.append("content", content);
				 formData.append("category", category);
				 formData.append("minimumPrice", minimumPrice);
				 formData.append("maximumPrice", maximumPrice);
				 formData.append("deadline", deadline);
				 formData.append("question", question);
				 formData.append("file", $("#thumbnailInput")[0].files[0]);
				 
			
				$.ajax({
					type:"post"
					,url:"/commision/postCreate"
					,data:formData
					,enctype:"multipart/form-data"
					,processData:false
					,contentType:false
					,success: function(data){
						
						if(data.result == "success"){
							location.reload();
							return;
						} else {
							alert("커미션 포스트 발행 실패");
							return;
						}
					}
					,error: function(){
						alert("커미션 포스트 발행 에러");
						return;
					}
					
				});
			
		});
		
		
	});	
			
	
	</script>

</body>
</html>
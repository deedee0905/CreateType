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
	
<title>커미션 신청 페이지</title>
</head>
<body>
	<div class="container">
		
		<header class="d-flex justify-content-center">
			<div>
				<a href="/post/main/view" style="text-decoration:none"><h1 class="text-center mt-3 mb-3" style="color:deepskyblue">CreateType</h1></a>
			</div>
		</header>
		
		<hr>
	
		<section>
			<div class="d-flex justify-content-center">
				<div style="width:750px">
					<div>
						<a href="/individual/channel/view?channelId=${commisionPost.channelId }" style="text-decoration:none; color:rgb(236, 130, 171); font-size:20px;" class="font-weight-bold">${user.nickname }</a> 
						<label style="font-size:20px;"> 님의</label> 
						<label style="font-size:20px;">${commisionPost.title } 커미션</label>
						<p style="font-size:20px;">
							신청을 위해 아래 질문사항을 채워주세요!
						</p>
					</div>
					
					<div class="mt-5" style="font-size:20px;">
						<label>${commisionPost.question }</label>
					</div>
					
					<div>
						<div id="summernote"></div>
					</div>
					
					<div class="d-flex justify-content-end">
						<div>
							<a href="/commision/postObject/view?id=${commisionPost.id }&channelId=${commisionPost.channelId}" class="btn btn-dark mt-1 text-white">취소</a>
							<button id="commisionProposalBtn" class="btn btn-primary mt-1">제출하기</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	
		
	
	</div>
	
	<script>
	$(document).ready(function() {
		
		$("#commisionProposalBtn").on("click", function(e) {
			e.preventDefault();
			
			let commisionPostId = ${commisionPostId}
			let postUserId = ${commisionUserId}
			let content = $("#summernote").summernote("code");
			let processing = "신청내역 확인 전";
			
			let url = "/commision/postObject/view?id=" + ${commisionPost.id } + "&channelId=" + ${commisionPost.channelId};
			
			if(content == "" || content == ("<p><br></p>")){
				 alert("내용을 입력하세요");
				 return
			 }
			
	
			$.ajax({
				type:"post"
				, url:"/commision/proposal"
				, data:{"commisionPostId":commisionPostId, "postUserId":postUserId ,"content":content, "processing":processing}
				, success: function(data){
					if(data.result == "success"){
						alert("커미션 신청이 완료되었습니다.");
						location.href= url;
						return;
					} else {
						alert("커미션 신청 실패");
						return;
					}
				}
				, error: function(){
					alert("커미션 신청 에러");
					return;
				}
			});
		
			
		});
		
		
		$('#summernote').summernote({
			  height: 200,                 // 에디터 높이
			  minHeight: 150,             // 최소 높이
			  maxHeight: 300,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
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
		
		
		
	});
	
	</script>
	
</body>
</html>
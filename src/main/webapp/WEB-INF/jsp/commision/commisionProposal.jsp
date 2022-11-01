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
		
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div class="d-flex justify-content-center">
				<div style="width:750px">
					<div>
						<a href="#" style="text-decoration:none">누구님</a> 님의 
						<label style="">무슨무슨 커미션</label>
						<p>
							신청을 위해 아래 질문사항을 채워주세요!
						</p>
					</div>
					
					<div class="mt-5">
						<label>질문사항 ~~~</label>
					</div>
					
					<div>
						<div id="summernote"></div>
					</div>
					
					<div class="d-flex justify-content-end">
						<div>
							<button class="btn btn-dark mt-1">취소</button>
							<button id="commisionProposalBtn" class="btn btn-primary mt-1">제출하기</button>
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
		
		$("#commisionProposalBtn").on("click", function(e) {
			e.preventDefault();
			
			let commisionPostId = ${commisionPostId}
			let postUserId = ${commisionUserId}
			let content = $("#summernote").summernote("code");
			
			if(content == "" || content == ("<p><br></p>")){
				 alert("내용을 입력하세요");
				 return
			 }
			
			alert(content);
			return;
			
			$.ajax({
				type:"post"
				, url:"/commision/proposal"
				, data:{"commisionPostId":commisionPostId, "postUserId":postUserId ,"content":content}
				, success: function(data){
					if(data.result == "success"){
						alert("커미션 신청 성공");
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
			  lang: "ko-KR"					// 한글 설정

	          
		});
	});
	
	</script>
	
</body>
</html>
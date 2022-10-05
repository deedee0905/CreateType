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
<title>MY채널 </title>
</head>
<body>

	<div class="container">
		
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
		
		<div>
			<div class="d-flex justify-content-between">
				<div>
					<img class="rounded" width="90" height="90" alt="채널 프로필" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MTRfNzkg%2FMDAxNjU3Nzg1MjEzMjM3.OsAgeeDfoPEcCL1djLCfsq4092epr8fSjbuyTeKAtq4g.FDoVVVLVzZXvRqge0v7PujjrWh8TTuLKwTA7xZGHxqQg.PNG.kappamann%2Fimage.png&type=sc960_832">
					<div class="d-flex mt-2 mb-3">
						<h5 class="font-weight-bold">채널 제목</h5>
						<span class="ml-3 text-secondary">구독자 30명</span>
						<a class="btn btn-sm btn-primary ml-3 text-white">프로필 편집</a>
					</div>
					<div class="border border-secondary p-2 rounded">
						이상한 변호사 우영우<br>
						거꾸로해도 우영우<br>
						스위스 기러기 어쩌구
					</div>
				</div>
				
				<div>
					<div id="empty-box">
						<label></label>
					</div>
					<a class="btn btn-outline-secondary" href="#" style="position: relative">새 포스트</a>
					<a class="btn btn-outline-secondary ml-3" href="#">새 커미션</a>
				</div>
			</div>
			
			<hr>
			
			<%--창작 컨텐츠 box~ --%>
			<div class="mb-5">
				<div class="d-flex">
					<h4>최신 포스트(창작 컨텐츠)  </h4>
					<a href="#" style="text-decoration:none"><h4 class="ml-2"><i class="bi bi-plus-square text-dark"></i></h4></a>
				</div>
				
				<div>
					<div class="border border-outline-secondary p-2 mt-2">
						<span class="font-weight-bold" style="font-size:20px">컨텐츠 제목1</span> <br>
						<p>
							컨텐츠 내용 (ex.처음으로 나만의 집이 생긴다면? 자까 작가의 나혼자 사는 이야기)
						</p>
						<hr>
						<span><i class="bi bi-heart-fill text-danger"></i></span>
						<label>30</label>
						<label> / </label>
						<label>view 30</label>
					</div>
					
					<div class="border border-outline-secondary p-2 mt-2">
						<span class="font-weight-bold" style="font-size:20px">컨텐츠 제목2</span> <br>
						<p>
							컨텐츠 내용 (ex.'치즈인더트랩' 순끼 작가의 신작!)
						</p>
						<hr>
						<span><i class="bi bi-heart-fill text-danger"></i></span>
						<label>30</label>
						<label> / </label>
						<label>view 30</label>
					</div>
					
					<div class="border border-outline-secondary p-2 mt-3">
						<span class="font-weight-bold" style="font-size:20px">컨텐츠 제목3</span> <br>
						<p>
							컨텐츠 내용 (ex.연구에 꿈을 가지고 대학원을 선택한 병아리 요다. 예상과는 다르게 연구에 관심 없는 교수님과 똥군기의 연구실 분위기에 당황한다.)
						</p>
						<hr>
						<span><i class="bi bi-heart-fill text-danger"></i></span>
						<label>30</label>
						<label> / </label>
						<label>view 30</label>
					</div>
					
				</div>
			
			</div>
			<%--~창작 컨텐츠 box --%>
			
			<hr>
			
			<%--커미션 컨텐츠 box~ --%>
			<div class="mt-4">
				<div class="d-flex">
					<h4>최신 포스트(커미션)  </h4>
					<a href="#" style="text-decoration:none"><h4 class="ml-2"><i class="bi bi-plus-square text-dark"></i></h4></a>
				</div>
				
				<div class="mt-2">
					<div class="d-flex">
						<a href="#"><img class="rounded" width="180" height="200" alt="커미션1" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2Fbc%2Fbe%2F57%2Fbcbe577d8bab4eb850a83fd8bffb632a.jpg&type=sc960_832"></a>
						<div class="p-2">
							<a href="#" style="text-decoration:none"><span class="font-weight-bold text-dark" style="font-size:20px">표지 커미션</span> <br>
							<span class="text-dark">#카테고리(그림, 글 디자인 중 1개)</span> <br>
							<span class="text-dark">가격 20,000원 ~ 50,000원</span> <br>
							<span class="text-dark">NN 이내 전달</span></a>
						</div>
					</div>
				</div>
				
				<div class="mt-2">
					<div class="d-flex">
						<a href="#">
							<img class="rounded" width="180" height="200" alt="커미션2" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTAxMTNfODAg%2FMDAxNTQ3Mzc4NzMwNzA0.vaWjUp2r3vj1nahcK8HnDHoFg-vmj0wrSz3C5MN_TC8g.InfNmtA7KIbu80vpLPR3ltax21qiHlkT91AEzijglA0g.PNG.o_may_5%2F%25B7%25AF%25BA%25EA%25C6%25F7%25BC%25C7.png&type=sc960_832">
						</a>
						<div class="p-2">
							<a href="#" style="text-decoration:none"><span class="font-weight-bold text-dark" style="font-size:20px">표지 커미션2</span> <br>
							<span class="text-dark">#카테고리(그림, 글 디자인 중 1개)</span> <br>
							<span class="text-dark">가격 20,000원 ~ 50,000원</span> <br>
							<span class="text-dark">NN 이내 전달</span></a>
						</div>
					</div>
				</div>
				
				<div class="mt-2">
					<div class="d-flex">
						<a href="#" ><img class="rounded" width="180" height="200" alt="커미션3" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2F08%2F65%2F9f%2F08659f0f4fbdb0b23aef6cb9e5330093.jpg&type=sc960_832"></a>
						<div class="p-2">
							<a href="#" style="text-decoration:none"><span class="font-weight-bold text-dark" style="font-size:20px">표지 커미션3</span> <br>
							<span class="text-dark">#카테고리(그림, 글 디자인 중 1개)</span> <br>
							<span class="text-dark">가격 20,000원 ~ 50,000원</span> <br>
							<span class="text-dark">NN 이내 전달</span></a>
						</div>
					</div>
				</div>
				
			</div>
			<%--~커미션 컨텐츠 box --%>
		</div>
			
		</section>
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>

</body>
</html>
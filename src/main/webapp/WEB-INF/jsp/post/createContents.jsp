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
			
			<
				<div class="d-flex mt-3">
					<div>
						<img class="rounded" width="200" height="300" alt="웹툰1" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA4MTlfODQg%2FMDAxNjI5MzU4NTkxMzU4.3O0IpV-v8xO2DuUKFzqqAhiH_TVIXxkzkvaJkCUzp3Yg.OYVighh4OoGTwoQ-hJ0NQyVYVO-mpbYQzSAZmvV_jWog.PNG.skymoon2319%2Fimage.png&type=sc960_832">
					</div>
					
					<div class="ml-3">
						<h4>${postCategory }</h4>
						<h5>닉네임 / view 34 / 덧글 4 / ♡ 5</h5>
						<p>
						${postCategory }
						</p>
					</div>
				</div>
		
			
			<div>
				<div class="d-flex mt-3">
					<div>
						<img class="rounded" width="200" height="300" alt="웹툰1" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA4MTlfODQg%2FMDAxNjI5MzU4NTkxMzU4.3O0IpV-v8xO2DuUKFzqqAhiH_TVIXxkzkvaJkCUzp3Yg.OYVighh4OoGTwoQ-hJ0NQyVYVO-mpbYQzSAZmvV_jWog.PNG.skymoon2319%2Fimage.png&type=sc960_832">
					</div>
					
					<div class="ml-3">
						<h4>작품제목</h4>
						<h5>닉네임 / view 34 / 덧글 4 / ♡ 5</h5>
						<p>
						대 화산파 13대 제자.천하삼대검수 매화검존 청명.<br>
						천하를 혼란에 빠뜨린 고금제일마 천마의 목을 치고 십만대산의 정상에서 영면.<br>
						백 년의 시간을 뛰어넘어 아이의 몸으로 다시 살아나다.<br>
						......뭐? 화산이 망해? 이게 뭔 개소리야!?
						</p>
					</div>
				</div>
				
				<div class="d-flex mt-3">
					<div>
						<img class="rounded" width="200" height="300" alt="웹툰2" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5486%2F2020%2F12%2F25%2F0000157532_002_20201225144317547.jpg&type=sc960_832">
					</div>
					
					<div class="ml-3">
						<h4>작품제목</h4>
						<h5>닉네임 / view 34 / 덧글 4 / ♡ 5</h5>
						<p>
						어릴 때 알던 재수없던 놈이 더 재수없는 놈이 되어 돌아왔다!<br>
						중3 황미애의 옆 빌라에 어릴 때 잠깐 시골에서 봤던 김철이 이사 와 같은 학교 같은 반이 되고 '철이와 미애'라 놀림 받자 김철은 미애를 불쾌해하며 피한다. 너만 불쾌한 줄 알아? <br>
						나쁜 놈!<br>
						</p>
					</div>
				</div>
				
				<div class="d-flex mt-3">
					<div>
						<img class="rounded" width="200" height="300" alt="웹툰2" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjhfNTYg%2FMDAxNjU5MDAxMjYyMTgz.o2JI_WETBFSnERaqwskDQgIgrwkZ2bkkbVi6uETMO_Mg.BWprgR0GaHKsrTe9GVSTbBOmHNv63o_ZPT1bjUmTeckg.JPEG.buzar_777%2FScreenshot%25A3%25DF20220728%25A3%25AD183507%25A3%25DFNAVER.jpg&type=sc960_832">
					</div>
					
					<div class="ml-3">
						<h4>작품제목</h4>
						<h5>닉네임 / view 34 / 덧글 4 / ♡ 5</h5>
						<p>
						한국대 로스쿨 수석 졸업에, <br>
						변호사 시험 성적 1,500점 이상! <br>
						국내 업계 2위 법무법인 한바다의 인턴 변호사가 된 우영우.<br>
						<br>
						영우는 자신의 능력을 증명해내고 '진짜 변호사'가 될 수 있을까?<br>
						</p>
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
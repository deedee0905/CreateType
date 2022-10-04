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
<title>CreateType -Main page </title>

<style>
nav {
	width:150px;
	
}
</style>

</head>
<body>

	<div class="container">
	
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>	
		
		
		<section class="mb-5">
			
			<div class="mt-3">
				<h1>개인창작 포스트</h1>
			</div>
			
			<div class="d-flex mt-3">
				<img class="rounded" width="260" height="350" alt="웹툰" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MTRfMTI2%2FMDAxNjU3ODEwMjI0OTc3.aqtwOzb4lhfYXDcIpi2No7l_Tksai-DBAjBCl3nf0N4g.8wxPxuZD4ffNOO669IGH967hIk-0aBqMSrZcOd3JJMwg.JPEG.intel007%2FIMG_4578.JPG&type=sc960_832">
				<img class="rounded ml-3" width="260" height="350" alt="웹소설" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA4MDdfMTA2%2FMDAxNjI4Mjk4NDE5NDY5.Mp9NdPd4YvUopvofIKfUMSLpDb36qefueszAFA4slhsg.vhuQLKOjVQ6zeQOMN7wzIxtYzp__EAwg7XfW2jWrLAEg.PNG.psl3629%2F111.png&type=sc960_832">
				<img class="rounded ml-3" width="260" height="350" alt="디자인" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2F82%2F6a%2F10%2F826a109a121c9d9f7c1c0f138898542c.jpg&type=sc960_832">
				<img class="rounded ml-3" width="260" height="350" alt="레디메이드" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA2MDRfMjU2%2FMDAxNTkxMjc4NjczNDY1.YVVWUMaoW3EgCSt44zyOgBF9o3OW5-MN7QX2oi79Ekog.M70t7-CILFLXrRGuS1fMtmJ0ey3X5dl0D_Yy3rA_hVYg.JPEG.back9523%2F%25BE%25C7%25B8%25F9%25C0%25BB_%25C6%25C4%25B4%25C2_%25B0%25A1%25B0%25D42.jpg&type=sc960_832">
			</div>
			
			<div class="mt-3">
				<h1>커미션 포스트</h1>
			</div>
			
			<div class="d-flex mt-3">
				<img class="rounded" width="260" height="350" alt="커미션1" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODEyMjBfMzYg%2FMDAxNTQ1MjY4NzcwMTEz.YaqD_libThgsxrMxtdNHs3JF73-rExo_FPtLkoV-dq0g.Qge1q_4W8RE4FIhpqVF1mCzwJFjdGWxl8tL-NaBCxZQg.JPEG.hongik333%2F1-1.jpg&type=sc960_832">
				<img class="rounded ml-3" width="260" height="350" alt="커미션2" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20140808_203%2Fdreaming0309_1407495174304DGcpp_PNG%2F%25B4%25AB%25C0%25C7%25BF%25A9%25BF%25D5-%25B1%25D4%25C7%25CF.png&type=sc960_832">
				<img class="rounded ml-3" width="260" height="350" alt="커미션3" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxNzAyMTNfMTMy%2FMDAxNDg2OTE0NzUwODc3.suDL0ZNlL4vQHsbKjVwZmYgv76PkqG-sNKRSj2Wj0zwg.8uj_Fb8o_PTZSrDRPljWP9LJKFRaAcNJsgIHO7AYNb0g.JPEG.wjddmsdk0430%2FNaverBlog_20170213_005230_11.jpg&type=sc960_832">
				<img class="rounded ml-3" width="260" height="350" alt="커미션4" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODExMTNfMjAg%2FMDAxNTQyMTEwOTY2Njc3.wD_u5PzxH5OZ4ZGeaZ-TdZOFgbouSjTblbd-b_DGJAcg.wceXZ_f9bwdn6Ec7SJPzp1pl2DNyq_AzIboSv6GuvDMg.JPEG.bbangyaa_%2F17.jpg&type=sc960_832">
			</div>
			
		</section>
	
		<hr>
	
		<footer class="mt-5">
			<div class="text-center text-center text-secondary">
				서비스 소개 | 이용약관 | 개인정보처리방침 | 채용 | 도움 | 권리침해신고센터 | 크리에이트타입 회사 소개・문의 | © CreateType, INC.
			</div>
				
			<div class="mt-4 mb-4 text-center text-secondary">
				 사업자등록번호: 123-444-56789 통신판매업신고번호: 2022-경기도광주-1004 대표자명: 남상아 <br>
				 개인정보관리 책임자: 남상아 | 주소: 서울시 강남구 테헤란로111길, 7층 연락처: 02-1234-5678, 팩스: 02-1234-5678 <br>
				 크리에이트타입은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 크리에이트타입은 콘텐츠, 거래정보 및 거래에 대하여 책임을 지지 않습니다. <br>
			</div>
		
		</footer>
		
	</div>

</body>
</html>
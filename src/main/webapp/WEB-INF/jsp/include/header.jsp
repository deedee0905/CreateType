<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    



	<header>
				<div class="d-flex justify-content-between">
					<div class="d-flex">
						<a href="/post/main/view" style="text-decoration:none"><h1 class="mt-3 logo text-center ml-1">CreateType</h1></a>
						<div class="dropdown mt-4 ml-3">
						  <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" >
						    카테고리
						  </button>
						  <div class="dropdown-menu" >
						    <a class="dropdown-item down" href="/post/createList/view?category=1" data-category="1">웹툰</a>
						    <a class="dropdown-item down" href="/post/createList/view?category=2" data-category="2">웹소설</a>
						    <a class="dropdown-item down" href="/post/createList/view?category=3" data-category="3">디자인</a>
						    <a class="dropdown-item down" href="/post/createList/view?category=4" data-category="4">레디메이드</a>
						    <hr>
						    <a class="dropdown-item down" href="/commision/List/view?category=1" data-category="1">커미션-그림</a>
						    <a class="dropdown-item down" href="/commision/List/view?category=2" data-category="2">커미션-글</a>
						    <a class="dropdown-item down" href="/commision/List/view?category=3" data-category="3">커미션-디자인</a>
						  </div>
						</div>
					</div>
					
					
						<div class="d-flex searchLoginSignupBox mt-4">
							
							<form id="searchForm" method="get" action="/post/search/view?">
								<div class="input-group mt-1">
								  <input id="keywordInput" type="search" name="title" class="form-control rounded form-control-sm col-10" placeholder="포스트 제목 검색" />
								  <button type="submit" id="searchBtn" class="btn btn-secondary">검색</button>
								</div>
							</form>
							<c:choose>
								<%-- 로그인 했을때 --%>
								<c:when test="${not empty userId }">
									<a href="/user/signout" class="btn btn-outline-secondary ml-2"><label class="mt-1">로그아웃</label></a>
									<h4 class="mt-1 ml-2"><i class="bi bi-bell notice"></i></h4>
									<div class="dropdown ml-2">
										<button class="btn btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" >
											My Contents
										</button>
										<div class="dropdown-menu user-wrapper">
											<a class="dropdown-item text-center" href="/individual/profile/view?userId=${userId }&channelId=${channelId}">MY채널</a>
											<a class="dropdown-item text-center" href="/individual/subscription/view">구독채널</a>
											<a class="dropdown-item text-center" href="/individual/library/view">보관함</a>
											<a class="dropdown-item text-center" href="/commision/applied/view">커미션</a>
											<a class="dropdown-item text-center" href="/individual/message/view">메세지</a>
											<a class="dropdown-item text-center" href="/individual/point/view">마이포인트</a>
										</div>
									</div>
									
									
									
								</c:when> 
								
								<%-- 로그인 하지 않았을 때 --%>
								<c:otherwise>
									<a href="/user/signin/view" class="btn btn-outline-secondary ml-2 mt-1">로그인</a>
									<a href="/user/signup/view" class="btn btn-primary ml-2 mt-1">회원가입</a>
								</c:otherwise>
							</c:choose>
						</div>
					
				</div>
				<br>
				<hr>
			</header>
			
			<script>
				
				$(document).ready(function() {
					$("#searchForm").on("submit", function(e) {
						
						let keyword = $("#keywordInput").val();
						
						if(keyword == ""){
							alert("검색어를 입력하세요.");
							e.preventDefault();
						}
						
					});
					
				});
				
				
					
				
			</script>
	
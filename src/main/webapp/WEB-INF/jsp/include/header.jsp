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
						    <a class="dropdown-item" href="#">웹툰</a>
						    <a class="dropdown-item" href="#">웹소설</a>
						    <a class="dropdown-item" href="#">디자인</a>
						    <a class="dropdown-item" href="#">레디메이드</a>
						  </div>
						</div>
					</div>
					
					<form>
						<div class="d-flex searchLoginSignupBox mt-4">
							<div class="input-group">
								<span class="input-group-text"><i class="bi bi-search"></i></span>
								<input class="form-control form-control-sm col-10" type="search" placeholder="포스트, 채널 검색">							
							</div>
							<c:choose>
								<%-- 로그인 했을때 --%>
								<c:when test="${not empty userId }">
									<a href="/user/signout" class="btn btn-outline-secondary ml-2"><label class="mt-1">로그아웃</label></a>
									<h4 class="mt-1 ml-2"><i class="bi bi-bell notice"></i></h4>
									<div class="dropdown ml-2">
										<button class="btn btn-sm btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" >
											<img class="rounded ml-3" width="55" height="55" src="https://cdn.pixabay.com/photo/2017/09/25/13/12/cocker-spaniel-2785074_960_720.jpg">
										</button>
										<div class="dropdown-menu user-wrapper">
											<a class="dropdown-item text-center" href="/individual/profile/view">MY채널</a>
											<a class="dropdown-item text-center" href="#">구독채널</a>
											<a class="dropdown-item text-center" href="#">보관함</a>
											<a class="dropdown-item text-center" href="#">마이포인트</a>
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
					</form>
				</div>
				<br>
				<hr>
			</header>
			
	
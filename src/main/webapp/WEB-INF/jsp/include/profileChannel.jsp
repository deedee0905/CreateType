<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 				<div class="mb-5">
					<h4>채널</h4>
					<hr>
					<c:choose>
						<c:when test="${not empty userId}">
							<div class="d-flex">
								<a href="#"><img class="rounded" width="100" height="100" alt="채널 프로필 이미지" src="https://cdn.pixabay.com/photo/2017/06/24/16/57/peony-2438192_960_720.jpg"></a>
								<div class="mt-3 ml-2">
									<a href="#" style="text-decoration:none"><h5 class="font-weight-bold text-dark">채널제목(ex.Les baguettes)</h5>
									<span class="text-secondary">구독자 38명</span></a>
								</div>
							</div>
							<div class="mt-3 text-secondary">
								채널소개(ex. 생각나는 것들을 적어나가는 곳)
							</div>
						</c:when>
						
						<c:otherwise>
							<div>
								<span class="text-secondary">아직 채널이 없습니다.</span> <br>
								<a class="btn btn-outline-secondary mt-3" href="#">채널 만들기</a>
							</div>
						</c:otherwise>
					
					</c:choose>
				</div>
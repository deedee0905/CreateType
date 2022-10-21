<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 				<div class="mb-5">
					<h4>채널</h4>
					<hr>
					
						<c:choose>
							<c:when test="${channelId > 0}">
								<div class="d-flex">
									<a href="/individual/channel/view"><img class="rounded" width="100" height="100" alt="채널 프로필 이미지" src="${channel.channelImagePath }"></a>
									<div class="mt-3 ml-2">
										<a href="/individual/channel/view" style="text-decoration:none"><h5 class="font-weight-bold text-dark">${channel.channelName }</h5>
										<span class="text-secondary">구독자 ${subscriber }명</span></a>
									</div>
								</div>
								<div class="mt-3 text-secondary">
									${channel.channelInfo }
								</div>
							</c:when>
						
						
							<c:otherwise>
								<div>
									<span class="text-secondary">아직 채널이 없습니다.</span> <br>
									<a href="/individual/channel/create/view" class="btn btn-outline-secondary mt-3" href="#">채널 만들기</a>
								</div>
							</c:otherwise>
						</c:choose>
					
				</div>
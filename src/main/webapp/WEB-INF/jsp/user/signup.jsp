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
<title>CreateType Signup</title>
</head>
<body>

	<div class="container">

	    <div class="mt-5 d-flex justify-content-center">
	
	      <div class="box1 border border-primary rounded p-3">
	
	        <h1 class="text-center" style="color:deepskyblue">회원가입</h1>
			<div class="d-flex mt-4">
		        <input type="text" placeholder="login ID" class="form-control">
		        <button type="button" class="btn btn-secondary ml-2">중복확인</button>
			</div>
			
			<div class="mb-2">
				<label class="text-danger small d-none">중복된 ID입니다.</label>
			    <label class="text-primary small d-none">사용 가능한 ID입니다.</label>
			</div>
			
			
			<div class="d-flex mt-4">
		        <input type="text" class="form-control" placeholder="닉네임">
		        <button type="button" class="btn btn-secondary ml-2">중복확인</button>
			</div>
			
			<div class="mb-2">
				<label class="text-danger small d-none">중복된 닉네임입니다.</label>
			    <label class="text-primary small d-none">사용 가능한 닉네임입니다.</label>
			</div>
			
			<div class="d-flex mt-4">
		        <input type="text" class="form-control" placeholder="이메일">
		        <button type="button" class="btn btn-secondary ml-2">중복확인</button>
			</div>
			
			<div class="mb-2">
				<label class="text-danger small d-none">중복된 이메일입니다.</label>
			    <label class="text-primary small d-none">사용 가능한 이메일입니다.</label>
			</div>
			
	        <input type="password" placeholder="비밀번호" class=" form-control"> <br>
	
	        <input type="password" placeholder="비밀번호 확인" class="form-control"> <br>
	
	        <button type="button" style="background-color:deepskyblue" class="btn btn-block text-white">가입하기</button>
	
	      </div>
	
	    </div>
    </div>
    
    <div class="text-center mt-3">
    	<label><a href="http://localhost:8080/user/signin/view" style="color:deepskyblue">로그인 하기</a></label>
    </div>
    
    <div class="text-center">
    	<label><a href="http://localhost:8080/user/signin/view" style="color:deepskyblue">메인페이지로 돌아가기</a></label>
    </div>




</body>
</html>
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
<title>CreateType Signin</title>

<style>
    .box1 {
      width: 300px;
      height: 300px;
    }
    
    .logo{
    	color:deepskyblue
    }
    
   
    

</style>

</head>
<body>

	<div class="container">

 

	    <div class="mt-5 d-flex justify-content-center">
			
	      <div class="d-flex">
	
	        <div class="box1 border border-primary rounded p-2">
	          <h1 class="mt-3 logo text-center">CreateType</h1>
	          <form id="loginForm">
		          <input type="text" placeholder="login ID" class="mt-3 form-control" id="userIdInput"> <br>
		          <input type="password" class="mt-1 form-control" id="passwordInput">
		          <button type="submit" style="background-color:deepskyblue" class="mt-2 btn btn-block text-white" id="loginBtn">로그인</button>
	          </form>
	
	          <div class="mt-4 text-center">
	            <label>계정이 없으신가요? <a href="http://localhost:8080/user/signup/view" style="color:deepskyblue">회원가입</a></label>
	          </div>
	        </div>
	
	      </div>

    	</div>
    	
    		<div class="mt-3">
    			<a href="#" style="color:deepskyblue"><h5 class="text-center">메인 페이지로 돌아가기</h5></a>
    		</div>
  	</div>


</body>
</html>
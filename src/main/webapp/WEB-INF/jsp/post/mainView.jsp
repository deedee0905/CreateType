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


</head>
<body>

	<div class="container">
	
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>	
		
		
		<section class="mb-5">
			
			<div class="mt-3">
				<h1>#창작 포스트</h1>
			</div>
			
			<div class="d-flex mt-3">
				<a href="/post/createList/view?category=1">
					<img referrerpolicy="no-referrer" class="rounded" width="260" height="350" alt="웹툰" src="https://postfiles.pstatic.net/MjAyMjEwMThfMjE1/MDAxNjY2MDY4MzU4MDY0.2fXeFzTTcbkp3kjxGr6agGm0_FehdtKMj3HnR9RN140g.axCpH7nWV_-YfieI3xdMs7DT3gSxRy4PRwhvonUyhKkg.JPEG.deedee0905/%EC%9B%B9%ED%88%B0%EC%83%98%ED%94%8C%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg?type=w966">
				</a>
				
				<a href="/post/createList/view?category=2">
					<img referrerpolicy="no-referrer" class="rounded ml-3" width="260" height="350" alt="웹소설" src="https://postfiles.pstatic.net/MjAyMjEwMThfMTA5/MDAxNjY2MDY4MzU4MDY3.njvpJlAY6IiKFbNpN1GUJ_XgEoDch2bgzaqjr03Unu4g.WIu7giTRxsWyGs4IPcKMZvphi037p0XXsznGNswms9og.JPEG.deedee0905/%EC%86%8C%EC%84%A4%EC%83%98%ED%94%8C%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg?type=w966">
				</a>
				
				<a href="/post/createList/view?category=3">
				<img referrerpolicy="no-referrer" class="rounded ml-3" width="260" height="350" alt="디자인" src="https://postfiles.pstatic.net/MjAyMjEwMThfMzEg/MDAxNjY2MDY4MzU4MDU2.FlkypOrAnJiFXCsEZvO5EE7YG5_Jex1CSHprX7v0jFsg.i3Lqy1EsbI_tVXYvlYEXxhcWFTjX4dELsmKs7zdVswwg.JPEG.deedee0905/%EB%94%94%EC%9E%90%EC%9D%B8%EC%83%98%ED%94%8C%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg?type=w966">
				</a>
				
				<a href="/post/createList/view?category=4">
					<img referrerpolicy="no-referrer" class="rounded ml-3" width="260" height="350" alt="레디메이드" src="https://postfiles.pstatic.net/MjAyMjEwMThfNDkg/MDAxNjY2MDY4MzU4MDU4.VBYEA77W4WdoxLxR37E2IDedGQDXPmu6RHDZ7_YYntEg.awEgKGD57prE9MywcwvpsAH5_0foIebisAN9_nb9rUQg.JPEG.deedee0905/%EB%A0%88%EB%94%94%EB%A9%94%EC%9D%B4%EB%93%9C%EC%83%98%ED%94%8C%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg?type=w966">
				</a>
			</div>
			
			<div class="mt-5">
				<h1>#커미션 포스트</h1>
			</div>
			
			<div class="d-flex mt-3">
				<a href="/commision/List/view?category=1"><img referrerpolicy="no-referrer" class="rounded" width="260" height="350" alt="커미션1" src="https://postfiles.pstatic.net/MjAyMjExMDRfMTA0/MDAxNjY3NTU1NjE4Mzc0.Tk1aTPSuXS8xeo55gAOCCeEauogYhlNq2W4a5LafCUkg.H1yLtNlCtAVf5zZCJpdWxFAK4qeGxIalUSAqi4S0QlUg.JPEG.deedee0905/%EC%A0%9C%EB%AA%A9%EC%9D%84_%EC%9E%85%EB%A0%A5%ED%95%98%EC%84%B8%EC%9A%94.jpg?type=w966"></a>
				<a href="/commision/List/view?category=2"><img referrerpolicy="no-referrer" class="rounded ml-3" width="260" height="350" alt="커미션2" src="https://postfiles.pstatic.net/MjAyMjExMDRfMjg3/MDAxNjY3NTU1NjE4Mzc0.U1LjfXzrP1FSjwItPrONu9unxO_p8bXiFf2JrW6u7gYg.A9FoJPyCwXi_mccNKtdaNB9YOt_wql28ht6CB5IbnD0g.JPEG.deedee0905/%EC%A0%9C%EB%AA%A9%EC%9D%84_%EC%9E%85%EB%A0%A5%ED%95%98%EC%84%B8%EC%9A%94_(1).jpg?type=w966"></a>
				<a href="/commision/List/view?category=3"><img referrerpolicy="no-referrer" class="rounded ml-3" width="260" height="350" alt="커미션3" src="https://postfiles.pstatic.net/MjAyMjExMDRfMjk0/MDAxNjY3NTU1NjE4Mzcx.Qu_1PhgK41xuj0Xp167ps3B-TKlO6BjfOMChi2HveUIg.vWeN0dtQEHXaDyy5KkBrIihEISCZSiPzBMVxU4ieUFMg.JPEG.deedee0905/%EC%A0%9C%EB%AA%A9%EC%9D%84_%EC%9E%85%EB%A0%A5%ED%95%98%EC%84%B8%EC%9A%94_(2).jpg?type=w966"></a>
			</div>
			
		</section>
	
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
		
	</div>
	
	<script>
		$(document).ready(function() {
			
		
			
			
		});
	</script>

</body>
</html>
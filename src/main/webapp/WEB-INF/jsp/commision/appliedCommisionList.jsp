<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<script
	  src="https://code.jquery.com/jquery-3.6.0.min.js"
	  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	  crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
<title>신청한 커미션</title>
</head>
<body>

	<div class="container">
		<header>
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
		</header>
	
		<section>
			<div class="d-flex justify-content-between">
				<h3 class="mb-2">신청한 커미션 List</h3>
				
				<div>
					<a href="/commision/applied/view" class="btn btn-outline-primary">신청 내역 </a>
					<a href="/commision/appliedFor/view" class="btn btn-outline-primary ml-2">신청받은 내역</a>
				</div>
			</div>
			
			<hr>
			
			<c:forEach var="commisionProposal" items="${commisionProposalDetail }">
				<div class="d-flex justify-content-center">
					<div class="border border-outline-secondary p-2 mt-2 text-center " style="width:550px">
						<div>
							<a href="/commision/appliedTimeLine/view?id=${commisionProposal.commisionPost.id }&postUserId=${commisionProposal.commisionPost.userId }&commisionProposalId=${commisionProposal.commisionProposal.id}" style="text-decoration: none">
								<span class="font-weight-bold text-dark mb-2" style="font-size:20px;">${commisionProposal.commisionPost.title }</span>
							</a> <br>
				
							<a href="/commision/appliedTimeLine/view?id=${commisionProposal.commisionPost.id }&postUserId=${commisionProposal.commisionPost.userId }" style="text-decoration: none" class="text-dark" class="mt-2">
								${commisionProposal.user.nickname }
							</a>
							
						</div>			
					</div>
				</div>
			</c:forEach>
			
		</section>
	
		<footer>
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</footer>
	</div>

</body>
</html>
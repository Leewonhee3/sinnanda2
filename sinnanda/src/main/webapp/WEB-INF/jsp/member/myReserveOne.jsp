<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="../skydash/vendors/feather/feather.css">
	<link rel="stylesheet" href="../skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" href="../skydash/vendors/css/vendor.bundle.base.css">
	<!-- endinject -->
	<!-- Plugin css for this page -->
	<link rel="stylesheet" href="../skydash/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
	<link rel="stylesheet" href="../skydash/vendors/ti-icons/css/themify-icons.css">
	<link rel="stylesheet" type="text/css" href="../skydash/js/select.dataTables.min.css">
	<!-- End plugin css for this page -->
	<!-- inject:css -->
	<link rel="stylesheet" href="../skydash/css/vertical-layout-light/style.css">
	<!-- endinject -->
	<link rel="shortcut icon" href="../skydash/images/favicon.png" />
	
	<title>예약내역 상세보기 페이지</title>
</head>
<body>
	<div class="container-scroller">
	
		<!-- [이승준] 마이 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 마이 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 마이 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 마이 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/myPageSidebar.jsp" %>
			<!-- [이승준] 마이 페이지 좌측 사이드바 - END -->
			
			<!-- [이승준] 마이 페이지 본문 - END -->
		      <!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 내용1 -->
					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
								<span class="subheading">
									<a href="myPage?memberNo=${loginUser.member.memberNo}">메인(내정보)</a> >
									<a href="myReserveList">예약내역 목록</a> >
									상세보기
								</span>
								
								<h1 style="margin-top: 10px;"><strong>내가 작성한 리뷰 상세보기</strong></h1>
								
								<div class="container">
									<table class="table table-myPage">
										<tr>
											<th style="width: 12%;">예약번호</th>
											<td>${reserve.reserveNo}</td>
										</tr>
										<tr>
											<th>예약자</th>
											<td>${reserve.memberName}</td>
										</tr>
										<tr>
											<th>숙소명</th>
											<td>${reserve.accomName }</td>
										</tr>
										<tr>
											<th>객실이름</th>
											<td>${reserve.roomName }</td>
										</tr>
										<tr>
											<th>이용여부</th>
											<td>${reserve.reserveUse }</td>
										</tr>
										<tr>
											<th>가격</th>
											<td><fmt:formatNumber value="${reserve.paymentPrice }" pattern="#,###" />원</td>
										</tr>
										<tr>
											<th>결제방법</th>
											<td>${reserve.paymentMethod }</td>
										</tr>
										<tr>
											<th>예약한 날짜</th>
											<td>
												<fmt:parseDate value="${reserve.reserveDate}" var="reserveDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
												<fmt:formatDate value="${reserveDate}" pattern="yy / MM / dd HH:mm"/>
											</td>
										</tr>
										<tr>
											<th>체크인</th>
											<td>${reserve.reserveCheckIn }</td>
										</tr>
										<tr>
											<th>체크아웃</th>
											<td>${reserve.reserveCheckOut }</td>
										</tr>
										
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
	<!-- [이승준] 하단 Footer - END -->


  <!-- plugins:js -->
  <script src="../vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="../vendors/chart.js/Chart.min.js"></script>
  <script src="../vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="../vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="../js/dataTables.select.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="../js/off-canvas.js"></script>
  <script src="../js/hoverable-collapse.js"></script>
  <script src="../js/template.js"></script>
  <script src="../js/settings.js"></script>
  <script src="../js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="../js/dashboard.js"></script>
  <script src="../js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
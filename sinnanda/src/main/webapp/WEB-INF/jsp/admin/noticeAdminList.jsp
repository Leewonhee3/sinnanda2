<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- plugins:css -->	
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
	
	
	<title>공지사항 페이지</title>
</head>

<body>
	<div class="container-scroller">
	
		<!-- [이승준] 호스트 페이지 상단 내비바 - START -->
		<%@ include file="/WEB-INF/partials/myPageNavbar.jsp" %>
		<!-- [이승준] 호스트 페이지 상단 내비바 - END -->
	
	    <!-- [이승준] 호스트 페이지 본문 - START -->
		<div class="container-fluid page-body-wrapper">
		
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - START -->
			<%@ include file="/WEB-INF/partials/adminPageSidebar.jsp" %>
			<!-- [이승준] 호스트 페이지 좌측 사이드바 - END -->
			
			<div class="main-panel">
				<div class="content-wrapper">
					<!-- 내용1 -->
					<div class="row" style="height: 100%;">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card position-relative">
								<div class="card-body">
									<span class="subheading" style="margin-left: 10px;">공지사항 페이지</span>
									<h1 style="margin-top: 10px;"><strong>공지사항</strong></h1>
									
								    <div class="container">
										<div class="container2">
											<select id="hostQnaCategory" name="hostQnaCategory" class="form-control-sm" onchange="location.href=this.value" style="float: right; margin-bottom: 20px;">
												<option value="">선택</option>
												<option value="noticeAdminList?noticeCategory=전체">전체문의</option>
												<option value="noticeAdminList?noticeCategory=기타">기타</option>
												<option value="noticeAdminList?noticeCategory=정보">정보</option>
												<option value="noticeAdminList?noticeCategory=시스템">시스템</option>
												<option value="noticeAdminList?noticeCategory=이벤트">이벤트</option>
												<option value="noticeAdminList?noticeCategory=뉴스">뉴스</option>
											</select>
										</div>
										<table class="table table-myPage" style="width: 100%;">
											<tr style="text-align:center">
												<th width="5%">번호</th>
												<th width="45%">제목</th>
												<th width="15%">공지유형</th>
												<th width="15%">작성자</th>
												<th width="20%">작성일</th>
										</tr>
										<c:forEach items="${noticePinList}" var="p">
											<tr style="background-color:LightGray;">
												<td style="text-align:center">${p.noticeNo}</td>
												<td>
													<a href="noticeAdminOne?noticeNo=${p.noticeNo}">${p.noticeTitle}</a>
												</td>
												<td style="text-align:center">${p.noticeCategory}</td>
												<td style="text-align:center">${p.adminName}</td>
												<td style="text-align:center">
													<fmt:parseDate value="${p.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
												</td>
											</tr>
										</c:forEach>
										<c:forEach items="${noticeList}" var="n">
											<tr>
												<td style="text-align:center">${n.noticeNo}</td>
												<td>
													<a href="noticeAdminOne?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
												</td>
												<td style="text-align:center">${n.noticeCategory}</td>
												<td style="text-align:center">${n.adminName}</td>
												<td style="text-align:center">
													<fmt:parseDate value="${n.createDate}" var="createDate" pattern="yyyy-MM-dd HH:mm:ss.S" />
													<fmt:formatDate value="${createDate}" pattern="yy/MM/dd HH:mm"/>
												</td>
											</tr>
										</c:forEach>
									</table>
										<!-- 관리자인 경우 공지사항 작성 링크 -->
													<c:if test="${loginUser.userLevel == 3}">
														<div>
															<a class="btn btn-primary" href="addNotice" style="float: right; margin-top: auto;">공지사항 작성</a>
														</div>
													</c:if>
										<!-- Paging -->			
										<div class="row mt-5">
									    	<div class="col text-center">
									            <div class="block-27">
													<ul>
														<!-- '이전' 버튼 -->
													<c:if test="${beginRow >= ROW_PER_PAGE}">
														<li><a href="noticeAdminList?currentPage=${currentPage-1}&noticeCategory=${noticeCategory}">&lt;</a></li>
													</c:if>
													
													<!-- Page 번호 -->
													<c:set var="doneLoop" value="false"></c:set>
													<c:forEach var="i" begin="${pageNo}" end="${pageNo + 9}">
													
														<!-- Page 숫자 10개 출력 -->
														<c:if test="${not doneLoop}">
															<c:choose>
																<c:when test="${currentPage == i}">				
																	<li class="active"><span>${i}</span></li>
																</c:when>
											    				<c:otherwise>
																	<li><a href="noticeAdminList?currentPage=${i}&noticeCategory=${noticeCategory}">${i}</a></li>	
																</c:otherwise>		
															</c:choose>
															<!-- LastPage이면 다음 페이지 번호를 출력하지 않는다 -->
															<c:if test="${i == lastPage}">
																<c:set var="doneLoop" value="true"></c:set>
															</c:if>
														</c:if>
													</c:forEach>
													
													<!-- '다음' 버튼 -->
													<c:if test="${currentPage != lastPage}">
														<li><a href="noticeAdminList?currentPage=${currentPage+1}&noticeCategory=${noticeCategory}">&gt;</a></li>
													</c:if>
													</ul>
												</div>
											</div>
										</div>
										<!-- Paging -->
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
	<%@ include file="/WEB-INF/partials/myPageFooter.jsp" %>
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
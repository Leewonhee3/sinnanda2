<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- plugins:css -->
		<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/animate.css">
	
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
	
	<title>자주 방문한 지역 차트 페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.6.0/chart.min.js"></script>
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
										자주 방문한 지역
									</span>
									
									<h1 style="margin-top: 10px;"><strong>자주 방문한 지역</strong></h1>
																			
									<div class="container">
										<select id="yearNo" name="yearNo" class="form-control-sm" style="float: right; margin-bottom: 20px; height:35px;" >
											<option value="">년도 선택</option>
											<option value="2022">2022년</option>            
											<option value="2021">2021년</option>
											<option value="2020">2020년</option>
										</select>
										
										<canvas id="myChart" width="100" height="40"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	   let ctx = document.getElementById('myChart').getContext('2d');
	   let myChart = new Chart(ctx, {});
	   
	   $('#yearNo').change(function(){
	      
	      let year = $('#yearNo').val();
	      
	      myChart.destroy();
	      ctx = document.getElementById('myChart').getContext('2d');
	      
	      $.ajax({
	         type:'get',
	         url:'getMyAreaVisitRecord?year=' + year,
	         success:function(json){
	            console.log(json);
	            
	            let myData = [];
	            myData.push(json.강원);
	            myData.push(json.경기);
	            myData.push(json.경남);
	            myData.push(json.경북);
	            myData.push(json.광주);
	            myData.push(json.대구);
	            myData.push(json.대전);
	            myData.push(json.부산);
	            myData.push(json.서울);
	            myData.push(json.세종특별자치시);
	            myData.push(json.울산);
	            myData.push(json.인천);
	            myData.push(json.전남);
	            myData.push(json.전북);
	            myData.push(json.제주특별자치도);
	            myData.push(json.충남);
	            myData.push(json.충북);
	          
	            //총값 
				let result  = myData.reduce((accumulator,currentNumber)=> accumulator + currentNumber);
				
	            
	            // chart.js
	            myChart = new Chart(ctx, {
	                type: 'bar',
	                data: {
	                    labels: ['강원', '경기', '경남', '경북', '광주', '대구', '대전', '부산', '서울', '세종', '울산', '인천', '전남', '전북', '제주', '충남', '충북'],
	                    datasets: [{
	                        label: '방문횟수',
	                        data: myData,
	                        backgroundColor: [
	                        	 'rgba(54, 162, 235, 0.2)'
	                            
	                        ],
	                        borderColor: [
	                        	 'rgba(54, 162, 235, 1)'
	                          
	                        ],
	                        borderWidth: 1
	                    }]
	                },
	                options: {
	                	 plugins: {
	                         title: {
	                             display: true,
	                             text: '# 총 방문횟수 : '+result.toLocaleString() +' 회'
	                         }
	                     },
	                    scales: {
	                        y: {
	                            beginAtZero: true
	                        }
	                    },
	                    lengend:{
	                    	display:true,
	                    	fontColor: 'rgba(255, 99, 132, 0.2)',
	                    	position:'right'
	                    }
	                }
	            });
	            
	         }
	      });
	   });
	
	  </script>
	
	<!-- [이승준] 하단 Footer - SATRT -->
	<%@ include file="/WEB-INF/partials/footer.jsp" %>
	<!-- [이승준] 하단 Footer - END -->


	<script src="../js/hoverable-collapse.js"></script>
	<script src="../js/template.js"></script>
	<script src="../js/settings.js"></script>
	<script src="../js/todolist.js"></script>
	<script src="../js/dashboard.js"></script>
	<script src="../js/Chart.roundedBarCharts.js"></script>
	<script src="../vendors/js/vendor.bundle.base.js"></script>
</body>

</html>
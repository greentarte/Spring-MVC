<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Main</title>
<meta charset="EUC-KR">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>
<!-- Bootstrap core JavaScript-->
<script src="view/vendor/jquery/jquery.min.js"></script>
<script src="view/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="view/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="view/vendor/chart.js/Chart.min.js"></script>
<script src="view/vendor/datatables/jquery.dataTables.js"></script>
<script src="view/vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages-->
<script src="view/js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->
<script src="view/js/sb-admin-datatables.min.js"></script>
<script src="view/js/sb-admin-charts.min.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Main</title>
<!-- Bootstrap core CSS-->
<link href="view/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="view/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin CSS-->
<link href="view/vendor/datatables/dataTables.bootstrap4.css"
	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="view/css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<a class="navbar-brand" href="main.do">Main</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Dashboard"><a class="nav-link" href="chart1.do"> <!-- <a href="chart1.do">Chart1</a> -->
						<i class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Chart1</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Charts"><a class="nav-link" href="chart2.do"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Chart2</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Tables"><a class="nav-link" href="chart3.do"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Chart3</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Components"><a class="nav-link" href="chart4.do"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Chart4</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Components"><a class="nav-link" href="chart5.do"> <i
						class="fa fa-fw fa-area-chart"></i> <span class="nav-link-text">Chart5</span>
				</a></li>

			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="card mb-3">
				<div class="card-body">
					<section>
						<c:choose>
							<c:when test="${center == null }">
								<jsp:include page="center.jsp"></jsp:include>
							</c:when>
							<c:otherwise>
								<jsp:include page="${center }.jsp"></jsp:include>
							</c:otherwise>
						</c:choose>
					</section>
						<%-- <canvas id="myAreaChart" width="100%" height="30"></canvas> --%>
				</div>
			</div>
		</div>
	</div>
	
	<footer class="sticky-footer">
		<div class="container">
			<div class="text-center">
				<small>Copyright 백상우 이종훈 손성은 정선우 2018</small>
			</div>
		</div>
	</footer>
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fa fa-angle-up"></i>
	</a>
	<!-- Logout Modal-->

	<!-- Bootstrap core JavaScript-->
	<script src="view/vendor/jquery/jquery.min.js"></script>
	<script src="view/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script src="view/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Page level plugin JavaScript-->
	<script src="view/vendor/chart.js/Chart.min.js"></script>
	<script src="view/vendor/datatables/jquery.dataTables.js"></script>
	<script src="view/vendor/datatables/dataTables.bootstrap4.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="view/js/sb-admin.min.js"></script>
	<!-- Custom scripts for this page-->
	<script src="view/js/sb-admin-datatables.min.js"></script>
	<script src="view/js/sb-admin-charts.min.js"></script>
</body>

</html>
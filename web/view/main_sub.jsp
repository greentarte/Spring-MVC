<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- Page level plugin JavaScript-->
<script src="vendor/chart.js/Chart.min.js"></script>
<script src="vendor/datatables/jquery.dataTables.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.js"></script>
<!-- Custom scripts for all pages-->
<script src="js/sb-admin.min.js"></script>
<!-- Custom scripts for this page-->
<script src="js/sb-admin-datatables.min.js"></script>
<script src="js/sb-admin-charts.min.js"></script>

<style>
/* Global CSS */
* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

ul, ol {
	list-style: none;
}
/* Header CSS */
header {
	margin: 0 auto;
	width: 800px;
	height: 50px;
	background: /* linear-gradient(-90deg, #33ccff, #66ff99); */
		linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
}

header>ul>li {
	float: left;
}

header>ul>li>a {
	font-size: 1.5em;
	font-style: bold;
	padding: 5px 10px;
}

header>ul>li>a:hover {
	color: white;
	background: black;
}
/* Section CSS */
section {
	margin: 0 auto;
	width: 800px;
	min-height: 500px;
	background: white;
}
/* Footer CSS */
footer {
	margin: 0 auto;
	width: 800px;
	height: 80px;
	background: black;
}
</style>
<script></script>
</head>
<body>
	<header>
		<ul>
			<li><a href="chart1.do">Chart1</a></li>
			<li><a href="chart2.do">Chart2</a></li>
			<li><a href="chart3.do">Chart3</a></li>
			<li><a href="chart4.do">Chart4</a></li>
			<li><a href="main.do">main</a></li>
		</ul>
	</header>
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

</body>
</html>








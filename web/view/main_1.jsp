<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" 
uri="http://www.springframework.org/tags"%>

    
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>Main</title>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://code.highcharts.com/modules/variable-pie.js"></script>

<style>
/* Global CSS */
*{
	margin:0;
	padding:0;
}
a{
	text-decoration: none;
}
ul,ol{
	list-style: none;
}
/* Header CSS */
header{
	margin:0 auto;
	width:800px;
	height:150px;
	background: red;
}
header > ul > li {
	float:left;
}
header > ul > li > a{
	font-size:1.5em;
	font-style:bold;
	padding:5px 10px;
}
header > ul > li > a:hover{
	color:white;
	background:black;
}
/* Section CSS */
section{
	margin:0 auto;
	width:800px;
	min-height:500px;
	background: gray;
}
/* Footer CSS */
footer{
	margin:0 auto;
	width:800px;
	height:80px;
	background: black;
}
</style>
<script></script>
</head>
<body>
<header>
<h1>
<a href="main.do">
<spring:message code="welcome.txt"/>
</a>
</h1>

<ul>
	<li><a href="chart1.do">Chart1</a></li>
	<li><a href="chart2.do">Chart2</a></li>
	<li><a href="chart3.do">Chart3</a></li>
	<li><a href="chart4.do">Chart4</a></li>
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
<footer></footer>
</body>
</html>








<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>chart5</title>
</head>

<script>
function display(input){
	Highcharts.chart('container', {
		 credits: {
	            enabled: false
	        },
	    chart: {
	        type: 'variablepie'
	    },
	    title: {
	        text: 'airplane delay total hour >> month.'
	    },
	    tooltip: {
	        headerFormat: '',
	        pointFormat: '<span style="color:{point.color}">\u25CF</span> <b> {point.name}</b><br/>' +
	            'Total hour (square km): <b>{point.y}</b><br/>' +
	            'delay persent (people per square km): <b>{point.z}</b><br/>'
	    },
	    series: [{
	        minPointSize: 30,
	        innerSize: '60%',
	        zMin: 0,
	        name: 'countries',
	        data: input
	    }]
	});
}

$(document).ready(function(){
	// Server에 데이터를 요청한다.
	// AJAX로
	$.ajax({
		url:'chart5impl.do',
		success:function(data){
			  
			  display(data);
		},
		error:function(){
			alert('fail !!');
		}
	});	
});
</script>
<div id="main_center">
	<h1>Chart5</h1>
	<div id="container"
		style="min-width: 550px; height: 900px; margin: 0 auto">
		<div class="tt">
			<div class="box">
				<div class="hourglass"></div>
			</div>
		</div>
	</div>
</div>
</html>

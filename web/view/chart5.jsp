<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>chart5</title>
</head>


<script>
	function display(input, input1, input2, input3) {
		Highcharts.chart('container', {
			chart : {
				type : 'line'
			},
			title : {
				text : 'Monthly Average Temperature'
			},
			subtitle : {
				text : 'Source: WorldClimate.com'
			},
			xAxis : {
				categories : input
			},
			yAxis : {
				title : {
					text : 'Temperature (°C)'
				}
			},
			plotOptions : {
				line : {
					dataLabels : {
						enabled : true
					},
					enableMouseTracking : false
				}
			},
			series : [ {
				name : 'seoul',
				data : input1
			}, {
				name : 'kyunggi',
				data : input2
			}, {
				name : 'incheon',
				data : input3
			} ]
		});

		$(document).ready(function() {
			$.ajax({
				url:'chart5_1impl.do',
				success:function(input){
					$.ajax({
						url:'chart5_2impl.do',
						success:function(input1){
							$.ajax({
								url:'chart5_3impl.do',
								success:function(input2){
									$.ajax({
										url:'chart5_4impl.do',
										success:function(input3){
											display(input,input1,input2,input3);		
										}		
									})
											
								}		
							})
									
						}
						})
					
				},
				error:function(){
					alert('fail');
				}
				
			});
		});
		}
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

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
#main_center{
	margin:0 20px;
	width:760px;
	height:480px;
	background:white;
}
</style>    
<script>	
function display(input){
	Highcharts.chart('container', {
	    chart: {
	        type: 'column'	
	    },
	    title: {
	        text: 'AirLine Delay Count'
	    },
	    subtitle: {
	        text: 'Source: <a href="http://stat-computing.org/dataexpo/2009/">Statistical Computing</a>'
	    },
	    xAxis: {
	        type: 'category',
	        labels: {
	            rotation: -45,
	            style: {
	                fontSize: '13px',
	                fontFamily: 'Verdana, sans-serif'
	            }
	        }
	    },
	    yAxis: {
	        min: 0,
	        title: {
	            text: 'Population (millions)'
	        }
	    },
	    legend: {
	        enabled: false
	    },
	    tooltip: {
	        pointFormat: 'Population in 2008: <b>{point.y:.1f} millions</b>'
	    },
	    series: [{
	        name: 'Population',
	        data: input,
	        dataLabels: {
	            enabled: true,
	            rotation: -90,
	            color: '#FFFFFF',
	            align: 'right',
	            format: '{point.y:.1f}', // one decimal
	            y: 10, // 10 pixels down from the top
	            style: {
	                fontSize: '13px',
	                fontFamily: 'Verdana, sans-serif'
	            }
	        }
	    }]
	});
}

$(document).ready(function(){
	// Server에 데이터를 요청한다.
	// AJAX로
	$.ajax({
		url:'chart1impl.do',
		success:function(data){
			/* alert('ok:'+data); */
			display(data);
		},
		error:function(){
			alert('fail');
		}
	});
/* 	var datas = [
		['1월',22340],
		['2월',13121],
		['3월',12312],
		['4월',23121]
		
		]; */
		
	/* display(data); */
});
</script>
<div id="main_center">
<h1>Chart1</h1>
<div id="container" style="min-width: 300px; height: 400px; margin: 0 auto"></div>

</div>








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

	    title: {
	        text: 'Number of car accidents per year, 2012-2016'
	    },

	    subtitle: {
	        text: 'Source: www.data.go.kr'
	    },

	    yAxis: {
	        title: {
	            text: 'Number of car accidents'
	        }
	    },
	    legend: {
	        layout: 'vertical',
	        align: 'right',
	        verticalAlign: 'middle'
	    },

	    plotOptions: {
	        series: {
	            label: {
	                connectorAllowed: false
	            },
	            pointStart: 2012
	        }
	    },

	    series: [{
	        name: 'casualties',
	        data: input
	    }],

	    responsive: {
	        rules: [{
	            condition: {
	                maxWidth: 500
	            },
	            chartOptions: {
	                legend: {
	                    layout: 'horizontal',
	                    align: 'center',
	                    verticalAlign: 'bottom'
	                }
	            }
	        }]
	    }

	});
}

	$(document).ready(function(){
		// Server에 데이터를 요청한다.
		// AJAX로
		$.ajax({
			url:'chart3impl.do',
			success:function(data){
				
				display(data);
			},
			error:function(){
				alert('fail');
			}
			
		});
	});
</script>
<div id="main_center">
<h1>Chart3</h1>
<div id="container" style="min-width: 300px; height: 400px; margin: 0 auto"></div>

</div>








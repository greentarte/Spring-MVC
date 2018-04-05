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
function display(input, input2){
   
   Highcharts.chart('container', {
       chart: {
           type: 'scatter',
           zoomType: 'xy'
       },
       title: {
           text: '교통사고'
       },
       subtitle: {
           text: '2016'
       },
       xAxis: {
           title: {
               enabled: true,
               text: 'Latitude'
           },
           startOnTick: true,
           endOnTick: true,
           showLastLabel: true
       },
       yAxis: {
           title: {
               text: 'Longitude'
           }
       },
       legend: {
           layout: 'vertical',
           align: 'left',
           verticalAlign: 'top',
           x: 100,
           y: 70,
           floating: true,
           backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
           borderWidth: 1
       },
       plotOptions: {
           scatter: {
               marker: {
                   radius: 1.5,
                   states: {
                       hover: {
               	            enabled: true,
                           lineColor: 'rgb(100,100,100)'
                       }
                   }
               },
               states: {
                   hover: {
                       marker: {
                           enabled: false
                       }
                   }
               },
               tooltip: {
                   headerFormat: '<b>{series.name}</b><br>',
                   pointFormat: '{point.x} , {point.y} '
               }
           }
       },
       series: [{
           name: '교통사망사고',
           color: 'rgba(223, 83, 83, .5)',
           data: input2
           //data: [[161.2, 51.6], [167.5, 59.0]]
           /* data: [[161.2, 51.6], [167.5, 59.0], [159.5, 49.2], [157.0, 63.0], [155.8, 53.6],
               [170.0, 59.0], [159.1, 47.6], [166.0, 69.8], [176.2, 66.8], [160.2, 75.2],
               [172.5, 55.2], [170.9, 54.2], [172.9, 62.5]] */

       }, {
           name: '보행자노인사망사고',
           color:  'rgba(153, 234, 132, .7)',
           data: input
           //data: [[174.0, 65.6], [175.3, 71.8]]
           //data: [[174.0, 65.6], [175.3, 71.8], [193.5, 80.7], [186.5, 72.6], [187.2, 78.8], [181.5, 74.8], [184.0, 86.4], [184.5, 78.4]]
       }]
   });
}

$(document).ready(function(){
   $.ajax({
      url:'chart4_1impl.do',
      success:function(data){
         $.ajax({
            url:'chart4_2impl.do',
            success:function(data1){
               display(data, data1);
            }
         });
      },
      error:function(){
         alert('fail');
      }
   });
});
</script>
<div id="main_center">
<h1>Chart4</h1>
<div id="container" style="min-width: 300px; height: 1000px; margin: 0 auto"></div>

</div>







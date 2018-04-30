<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
@import url(https://fonts.googleapis.com/css?family=Lato:300);
#main_center{
   margin:0px -60px 0px 0px;
   width:810px;
   height:480px;
   background:white;
}


.tt{
    text-align: center;
    background-color: #ff9966;
    overflow: hidden;
}

.box:nth-child(2n-1){
    background-color: rgba(0,0,0,0.05);
}

.box{
    display: inline-block;
    height: 600px;
    width: 100%;
    float:left;
    position: relative;
    /*margin:0 -4px -5px -2px;*/
    transition: all .2s ease;
}
.box p{
    color: #777;
    font-family:  Lato,"Helvetica Neue" ;
    font-weight: 300;
    position: absolute;
    font-size: 20px;
    width: 100%;
    height: 25px;
    text-align: center;
    bottom: 0px;
    margin: 0;
    top:160px;
    background-color: #fff;
    opacity: 0;
    text-transform: uppercase;
    transition: all .2s ease;
}

.box:hover p{
    bottom:0px;
    top:175px;
    opacity: 1;
    transition: all .2s ease;
    z-index: 2;
}



/* MEDIA QUERIES */
@media (max-width: 700px){
    .box{
        width: 50%;
    }

    .box:nth-child(2n-1){
        background-color: inherit;
    }

    .box:nth-child(4n),.box:nth-child(4n-3) {
        background-color: rgba(0,0,0,0.05);
    }

}

@media (max-width: 480px){
    .box{
        width: 100%;
    }

    .box:nth-child(4n),.box:nth-child(4n-3){
        background-color: inherit;
    }

    .box:nth-child(2n-1){
        background-color:rgba(0,0,0,0.05);
    }

}


/* -------------- Clock -------------- */

.clock{
    border-radius: 160px;
    border: 3px solid #fff;
    height: 480px;
    width: 480px;
    position: relative;

    top: 28%;
    top: -webkit-calc(50% - 43px);
    top: calc(50% - 43px);
    left: 35%;
    left: -webkit-calc(50% - 43px);
    left: calc(50% - 43px);
}
.clock:after{
    content: "";
    position: absolute;
    background-color: #fff;
    top:2px;
    left: 48%;
    height: 38px;
    width: 4px;
    border-radius: 5px;
    -webkit-transform-origin: 50% 97%;
            transform-origin: 50% 97%;
    -webkit-animation: grdAiguille 2s linear infinite;
            animation: grdAiguille 2s linear infinite;
}

@-webkit-keyframes grdAiguille{
    0%{-webkit-transform:rotate(0deg);}
    100%{-webkit-transform:rotate(360deg);}
}

@keyframes grdAiguille{
    0%{transform:rotate(0deg);}
    100%{transform:rotate(360deg);}
}

.clock:before{
    content: "";
    position: absolute;
    background-color: #fff;
    top:6px;
    left: 48%;
    height: 35px;
    width: 4px;
    border-radius: 5px;
    -webkit-transform-origin: 50% 94%;
            transform-origin: 50% 94%;
    -webkit-animation: ptAiguille 12s linear infinite;
            animation: ptAiguille 12s linear infinite;
}

@-webkit-keyframes ptAiguille{
    0%{-webkit-transform:rotate(0deg);}
    100%{-webkit-transform:rotate(360deg);}
}

@keyframes ptAiguille{
    0%{transform:rotate(0deg);}
    100%{transform:rotate(360deg);}
}


/* -------------- Sablier -------------- */

.hourglass{
    position: relative;
    height: 80px;
    width: 80px;
    top: 28%;
    top: -webkit-calc(50% - 43px);
    top: calc(50% - 43px);
    left: 35%;
    left: -webkit-calc(50% - 43px);
    left: calc(50% - 43px);
    border: 3px solid #fff;
    border-radius: 80px;
    -webkit-transform-origin: 50% 50%;
            transform-origin: 50% 50%;
    -webkit-animation: hourglass 2s ease-in-out infinite;
            animation: hourglass 2s ease-in-out infinite;
}

.hourglass:before{
    content: "";
    position: absolute;
    top:8px;
    left: 18px;
    width: 0px;
    height: 0px;
    border-style: solid;
    border-width: 37px 22px 0 22px;
    border-color: #fff transparent transparent transparent;
}
.hourglass:after{
    content: "";
    position: absolute;
    top: 35px;
    left: 18px;
    width: 0px;
    height: 0px;
    border-style: solid;
    border-width: 0 22px 37px 22px;
    border-color: transparent transparent #fff transparent;
}

@-webkit-keyframes hourglass{
    0%{-webkit-transform:rotate(0deg);}
    100%{-webkit-transform:rotate(180deg);}
}

@keyframes hourglass{
    0%{transform:rotate(0deg);}
    100%{transform:rotate(180deg);}
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
	                   radius: 3,
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
	          

	       }, {
	           name: '보행어린이사고다발지',
	           color:  'rgba(153, 234, 132, .7)',
	           data: input

	       }]
	   });
	}

$(document).ready(function(){
   $.ajax({
      url:'chart5_1impl.do',
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
<h1>Chart5</h1>
<div id="container" style="min-width: 550px; height: 900px; margin: 0 auto">
<div class="tt">
	<div class="box">
            <div class="hourglass"></div>
        </div>
</div>
</div>

</div>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<style>
@import url(https://fonts.googleapis.com/css?family=Lato:300);
#main_center{
   margin:0 20px;
   width:760px;
   height:480px;
   background:white;
}


.tt{
    text-align: center;
    background-color: #e74c3c;
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
    color: #00ff00;
    font-family:  Lato,"Helvetica Neue" ;
    font-weight: 300;
    position: absolute;
    font-size: 40px;
    width: 100%;
    height: 55px;
    text-align: center;
    bottom: 0px;
    margin: 0;
    top:-100px;
    background-color: #ff9900;
    opacity: 0.1;
    text-transform: uppercase;
    transition: all .2s ease;
}

.box:hover p{
    bottom:0px;
    top:365px;
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
    border-radius: 460px;
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
    height: 105px;
    width: 12px;
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
/*    var datas = [
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

<div id="container" style="min-width: 300px; height: 600px; margin: 0 auto">
<div class="tt">
	<div class="box">
            <div class="hourglass"></div>
            <p>Data LOADING....</p>
        </div>
</div>
</div>


        
</div>
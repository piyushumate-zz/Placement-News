<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Comingsoon !</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="css/bootstrap-responsive.css" rel="stylesheet">
    <link href="css/docs.css" rel="stylesheet">
    <link href="js/google-code-prettify/prettify.css" rel="stylesheet"> 
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap-transition.js"></script>
    <script src="js/bootstrap-modal.js"></script>
    <script src="js/bootstrap-button.js"></script>
    <script src="js/bootstrap-collapse.js"></script>
    <script src="js/bootstrap-carousel.js"></script>
    


</head>	
<script>

</script>
<body>
<br><br><br><br>

<div class="container">
<%@include file="header.jsp"%>      	
 
 <div class="row-fluid">
	<div class="span7">
	
	<div id="myCarousel" class="carousel slide">
    <!-- Carousel items -->
    <div class="carousel-inner">
    <div class="active item"><img src="entry.JPG" style="width:100%"/>
	<div class="carousel-caption">
                </div>
	</div>
    <div class="item"><img src="canteen.JPG" style="width:100%"/>
	<div class="carousel-caption">
                </div>
	</div>
    <div class="item"><img src="flower.JPG" style="width:100%"/>
	<div class="carousel-caption">
                </div>
	</div>
    </div>
    <!-- Carousel nav -->
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div>
	
	
		
	</div>
	<div class="span5">
		<form class="well form-inline">
		<h3 style="font-family:Georgia"><center> About Placement News </center></h3><br/>
<p style="text-align:justify">
		    <div class="list-group">

        	<a href="#" class="list-group-item active">
            	         Features <span class="badge"></span>
        	</a>
        	
        	<a href="#" class="list-group-item">
            	<span class="glyphicon glyphicon-certificate"></span> Statistics <span class="badge"></span>
        	</a>
        	
           	<a href="#" class="list-group-item">
            	<span class="glyphicon glyphicon-certificate"></span> Advanced notifications <span class="badge"></span>
        	</a>
			
	    	<a href="#" class="list-group-item">
            	<span class="glyphicon glyphicon-certificate"></span> Company details <span class="badge"></span>
        	</a>
			        	
         	<a href="#" class="list-group-item">
            	<span class="glyphicon glyphicon-certificate"></span> Ease of access <span class="badge"></span>
        	</a>
        	
        	<a href="#" class="list-group-item">
            	<span class="glyphicon glyphicon-certificate"></span> Security <span class="badge"></span>
        	</a>
</p>

		<div class="control-group" >
            
            <div class="controls">
              <div class="input-append" >
                <input type="email" size="35" id="appendedInputButton" class="span9" /><button type="button" class="btn btn-inverse" style="padding-left:13px">Subscribe</button>
              </div>
            </div>
          </div>
		</form>	
	</div>
</div>


<script>
$(function() {
	$('#theme_switcher ul li a').bind('click',
		function(e) {
			$("#switch_style").attr("href", "css/"+$(this).attr('rel')+"/bootstrap.min.css");    		
			return false;
		}
	);
});
</script>
</body>
</html>
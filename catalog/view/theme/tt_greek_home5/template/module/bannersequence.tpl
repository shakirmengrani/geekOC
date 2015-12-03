<?php
$slides = $bannersequences;
$config = $slide_setting[0]; 

?>
<div id="sequence-theme">
	<div id="sequence">
	<?php if($config['nextback']) { ?> 
	    <ul class="controls">
		<li><a class="sequence-prev">Prev</a></li>
		<li><a class="sequence-next">Next</a></li>
	    </ul>
	<?php } ?>	
	  
	    <ul class="sequence-canvas">
		<?php foreach ($slides as $slide): ?>
			<?php if($slide['type'] == 1) { ?>
		     <li class="<?php echo $animate; ?> effect1">
				<div class="title1"><h2 class ="title"><?php if($slide['title']) echo $slide['title']; ?></h2></div>
				<div class="sub1"><h3 class ="subtitle1"><?php if($slide['sub_title']) echo $slide['sub_title']; ?></h3></div>
				<div class="intro1">
					<div class="intro subtitle">
						<?php $description = ""; ?>
						<?php if($slide['description']) $description =  $slide['description']; ?>
						<?php echo nl2br($description); ?>
					</div>
				</div>
					<?php if($slide['image']) { ?>							
					   <img class="slider-bg" src="<?php echo $slide['image']; ?>" alt="Image" />
					<?php } ?>
					<?php if($slide['image1']) { ?>
						<!-- <img class="model" src="<?php //echo $slide['image1']; ?>" alt="Image" /> -->
					<?php } ?>
				<div class="link1">
					<?php if ($slide['link']) { ?>
						<div class ="link subtitle">
						<a href ="<?php echo $slide['link']; ?>"><?php echo 'Shop now'; ?></a>
						</div>
					<?php } ?>
				</div>
			    </li>
			<?php } ?>
			<?php if($slide['type'] == 2) { ?>
						 <li class="<?php echo $animate; ?> effect2">
							<div class="title2">
								<h2 class ="title-slider2"><?php if($slide['title']) echo $slide['title']; ?></h2>
							</div>
							<div class="subtitle2">
								<h3 class ="subtitle1-slider2"><?php if($slide['sub_title']) echo $slide['sub_title']; ?></h3>
							</div>
							<div class="des2">
								<div class="intro-slider2 subtitle-slider2">
									<?php $description = ""; ?>
									<?php if($slide['description']) $description =  $slide['description']; ?>
									<?php echo nl2br($description); ?>
								</div>
							</div>
								<?php if($slide['image']) { ?>							
									<img class="slider-bg" src="<?php echo $slide['image']; ?>" alt="Image" />
								<?php } ?>
								<?php if($slide['image1']) { ?>
									<!-- <img class="model-slider2" src="<?php //echo $slide['image1']; ?>" alt="Image" /> -->
								<?php } ?>
							<?php if ($slide['link']) { ?>
							<div class="link2">
								<div class ="link-slider2 subtitle-slider2">
								<a href ="<?php echo $slide['link']; ?>"><?php echo 'Shop now'; ?></a>
								</div>
							</div>
							<?php } ?>
							</li>
						<?php } ?>
			<?php if($slide['type'] == 3) { ?>
						 <li class="<?php echo $animate; ?> effect3">
							<div class="title3">
								<h2 class ="title-slider3"><?php if($slide['title']) echo $slide['title']; ?></h2>
							</div>
							<div class="sub3">
								<h3 class ="subtitle-slider3"><?php if($slide['sub_title']) echo $slide['sub_title']; ?></h3>
							</div>
							<div class="intro3">
								<div class="intro-slider3 subtitle-slider3">
									<?php $description = ""; ?>
									<?php if($slide['description']) $description =  $slide['description']; ?>
									<?php echo nl2br($description); ?>
								</div>
							</div>
								<?php if($slide['image']) { ?>							
									<img class="slider-bg" src="<?php echo $slide['image']; ?>" alt="Image" />
								<?php } ?>
								<?php if($slide['image1']) { ?>
									<!-- <img class="model-slider3" src="<?php //echo $slide['image1']; ?>" alt="Image" /> -->
								<?php } ?>
							<div class="link3">
							<?php if ($slide['link']) { ?>
								<div class ="link-slider3 subtitle-slider3">
								<a href ="<?php echo $slide['link']; ?>"><?php echo 'Shop now'; ?></a>
								</div>
							<?php } ?>
							</div>
							</li>
						<?php } ?>			
    <?php endforeach; ?>
	    </ul>
	    <?php if($config['contrl']) { ?>
	      <ul class="sequence-pagination">
		<?php
		    $count=0;
		    foreach ($slides as $slide): 
			$count ++;
	       ?>
		  <li><a href="javascript:void(0)"><?php echo $count; ?> </a></li>
		<?php endforeach; ?>
	    </ul>
		<?php } ?>
	</div>
</div>
<script type ="text/javascript">

    //<![CDATA[
    $(document).ready(function(){
        //$jqstatus = $jq(".status");
         var options = {
				autoPlay: <?php if($config['auto'] ==1) { echo 'true';} else { echo 'false'; } ?>,
				autoPlayDelay: <?php if($config['delay'] >0) { echo $config['delay']; } else { echo 4000; } ?>,
				pauseOnHover: <?php if($config['hover'] ==1) {echo 'true';} else { echo 'false'; } ?>,
				hidePreloaderDelay: 500,
				nextButton: true,
				prevButton: true,
				pauseButton: true,
				preloader: true,
				pagination:true,
				hidePreloaderUsingCSS: false,                   
				animateStartingFrameIn: true,    
				navigationSkipThreshold: 750,
				preventDelayWhenReversingAnimations: true,
				customKeyEvents: {
					80: "pause"
				}
			};


        var sequence = $("#sequence").sequence(options).data("sequence");

           
    });
    //]]>

</script>
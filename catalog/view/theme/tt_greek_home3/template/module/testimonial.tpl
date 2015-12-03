<?php $i = 0; $row = 2; ?>
<div class="testimonial-container col-md-6 col-sm-12 col-xs-12">
		<div class="testimonial-title"><h3><?php echo $heading_title; ?></h3></div>
		<div class="row">
			<ul id="slides">
				<?php foreach ($testimonials as $testimonial) { ?>
					<?php if($i++ % $row == 0) {  echo  "<li class='row_item'><ul>"; } ?>
						<?php if ($testimonial['content']) { ?>
						<li class="item-testimonials">
							<div class="testimonial-images">
								<?php   if($testimonial['image'] != null) { ?>
								<img src="<?php echo $testimonial['image'];?>" alt="" />
								<?php } ?>
							</div>
							<div class="box-testimonial">
								<div class="testimonial-name"><h2><?php echo $testimonial['customer_name']; ?></h2></div>
								<div class="testimonial-std"><?php echo $testimonial['content']; ?></div>
								<div class="testimonial-link"><a href="<?php echo $more; ?>"><span>Read More...</span></a></div>
								<div class="testimonial-submit"><a href="<?php echo $submit_testimonial; ?>"><span>Submit Testimonial...</span></a></div>
							</div>
						</li>
					<?php } ?>
					<?php if($i % $row ==0){  echo  "</ul></li>"; } ?>
				<?php } ?>
			</ul>
		</div>
</div>
<script type="text/javascript">
    $("#slides").owlCarousel({
        autoPlay :false,
        items:1,
		navigation :true,
		pagination: false,
		paginationNumbers :false,
		items : 1, //10 items above 1000px browser width
		itemsDesktop : [1000,1], //5 items between 1000px and 901px
		itemsDesktopSmall : [900,1], // betweem 900px and 601px
		itemsTablet: [600,1], //2 items between 600 and 0
		itemsMobile : [480,1] // itemsMobile disabled - inherit from itemsTablet option
    });
</script>
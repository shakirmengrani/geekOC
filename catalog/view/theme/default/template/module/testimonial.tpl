<div class="testimonial-container">

	<div class="container">
		<div class="testimonial-title"><h2><?php echo $heading_title; ?></h2></div>
		<div class="row">
			<ul id="slides">
				<?php foreach ($testimonials as $testimonial) { ?>
				<?php if ($testimonial['content']) { ?>
				<li>
					<div class="testimonial-images">
						<?php   if($testimonial['image'] != null) { ?>
						<img src="<?php echo $testimonial['image'];?>">
						<?php } ?>
					</div>
					<div class="box-testimonial">
						<div class="testimonial-std"><span class="f"> </span><?php echo $testimonial['content']; ?><span class="l"> </span></div>
						<div class="testimonial-name"><h2><?php echo $testimonial['customer_name']; ?></h2></div>
						<div class="testimonial-link"><a href="<?php echo $more; ?>"><span>Read More...</span></a></div>
						<div class="testimonial-submit"><a href="<?php echo $submit_testimonial; ?>"><span>Submit Testimonial...</span></a></div>
					</div>
				</li>
				<?php } ?>
				<?php } ?>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
    $("#slides").owlCarousel({
        autoPlay :true,
        items:2,
		navigation :true,
		pagination: false,
		paginationNumbers :false,
		items : 2, //10 items above 1000px browser width
		itemsDesktop : [1000,2], //5 items between 1000px and 901px
		itemsDesktopSmall : [900,2], // betweem 900px and 601px
		itemsTablet: [600,1], //2 items between 600 and 0
		itemsMobile : [480,1] // itemsMobile disabled - inherit from itemsTablet option
    });
</script>
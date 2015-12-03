
<?php $tab_effect = 'wiggle'; ?>
<script type="text/javascript">

$(document).ready(function() {

	$(".tab_content").hide();
	$(".tab_content:first").show(); 

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		$(".tab_content").removeClass("animate1 <?php echo $tab_effect;?>");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 <?php echo $tab_effect;?>");
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
<div class="product-tabs-container-slider">
		<ul class="tabs"> 
		<?php $count=0; ?>
		<?php foreach($productTabslider as $productTab ){ ?>
			<li rel="tab_<?php echo $productTab['id']; ?>"  >
				<span class="tab_<?php echo $productTab['id']; ?>"><?php echo $productTab['name']; ?></span>
			</li>
				<?php $count= $count+1; ?>
		<?php } ?>	
		</ul>
		<div class="tab_container"> 
		<?php foreach($productTabslider as $productTab){ ?>
			<div id="tab_<?php echo $productTab['id']; ?>" class="tab_content">
				<div class="row">
				<div class="owl-demo-tabproduct">
				<?php $i=0; $row=1; $i1=0; ?>
				<?php foreach ($productTab['productInfo'] as $product){ ?>
							<div class="item col-md-3 col-sm-4 col-xs-4">
								<div class="item-inner">
									<?php if ($product['special']) { ?>
										<span class="sale"> Sale </span>
									<?php } ?>
								<div class="product-image">
									<?php if ($product['thumb']) { ?>
									<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /><img class="img2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
									<?php } ?>
								</div>	
									<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
									
									<?php if (isset($product['rating'])) { ?>
									<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="" /></div>
									<?php } ?>
									
									<?php if($config_slide['f_show_des']) { ?>
										<div class="des"><?php echo $product['description']; ?></div>
									<?php } ?>
									
									<?php if($config_slide['f_show_price']) { ?>
									<?php if ($product['price']) { ?>
									<div class="price">
									  <?php if (!$product['special']) { ?>
									  <?php echo $product['price']; ?>
									  <?php } else { ?>
									  <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
									  <?php } ?>
									</div>
									<?php } ?>
									<?php } ?>
									
									<div class="actions">
										<div class="button-group">
											<div class="cart">
												<?php if($config_slide['f_show_addtocart']) { ?>
												<button class="button btn-cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span><?php echo $button_cart; ?></span></button>
												<?php } ?>
											</div>
											<div class="add-to-links">
												<div class="wishlist"><button class="fa fa-heart" type="button" title="<?php echo $button_wishlist; ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></button></div>
												<div class="compare"><button class="fa fa-signal" type="button" title="<?php echo $button_compare; ?>" data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></button></div>
											</div>
										</div>
									</div>
								</div>
							</div>
				<?php } ?>
				</div>
				</div><!-- .row -->
			</div>

		<?php } ?>
	
	</div><!-- .tab_container -->
</div>
<script type="text/javascript">
$(document).ready(function() { 
 $(".product-tabs-container-slider .tabs li:first").addClass("active");
  });
</script>
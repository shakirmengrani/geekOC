<div class="featured-container">
<div class="featured-sldier-title"><h2><?php echo $heading_title; ?></h2></div>
<div class="row">
<div class="owl-demo-feature">
  <?php foreach ($products as $product) { ?>
  <div class="item_product">
    <div class="product-thumb transition item-inner">
		<?php if ($product['special']) { ?>
					<span class="sale"> Sale </span>
				<?php } ?>
				<?php if ($product['is_new']){?>
					<div class="new"> New </div>
				<?php } ?>
		<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
		</div>   
		<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		<?php if($config_slide['f_show_price']){ ?>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span><span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </div> <?php } ?>
        <?php } ?>
		<?php if (isset($product['rating'])) { ?>
		<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="" /></div>
		<?php } ?>
		<?php if($config_slide['f_show_des']){ ?>
        <p><?php echo $product['description']; ?></p>
		<?php } ?>
		<div class="actions">
					<div class="button-group">
							<div class="cart">
								<?php if($config_slide['f_show_addtocart']) { ?>
								<button class="button btn-cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i><span><?php echo $button_cart; ?></span></button>
								<?php } ?>
							</div>
						<div class="add-to-links">
							<div class="wishlist">
								<button class="link-wishlist" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i><span><?php echo $button_wishlist; ?></span></button>
							</div>
							<div class="compare">
								<button class="link-compare" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa fa-refresh"></i><span><?php echo $button_compare; ?></span></button>
							</div>
						</div>
					</div>
		</div>
    </div>
  </div>
  <?php } ?>
</div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() { 
  $(".owl-demo-feature").owlCarousel({
	  autoPlay: <?php if($config_slide['f_speed_slide']<1) { echo "false";} else { echo $config_slide['f_speed_slide'];} ?>, //Set AutoPlay to 3 seconds
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 4;} ?>,
	  slideSpeed : <?php if($config_slide['f_speed_slide']) { echo $config_slide['f_speed_slide'] ;} else { echo 1000;} ?>,
	  navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : true,
	  pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
	  itemsDesktop : [1199,3], 
		itemsDesktopSmall : [900,3], 
		itemsTablet: [680,2],
		itemsMobile : [480,1]
 
  });
 
});
</script>
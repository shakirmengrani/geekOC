<div class="most-products-container">

<div class="most-products-slider"><h2><?php echo $heading_title; ?></h2></div>
 <?php 
	$count = 0; 
	$row=1;
	$rows = $config_slide['f_rows']; 
	if(!$rows) {$rows=1;}
  ?>
	<div class="row">
		<div class="owl-demo-mostproduct">
		  <?php foreach ($products as $product) { ?>
			<?php if($count++ % $rows == 0 ) { echo '<div class="row_items">'; }  ?>
		  <div class="item_product">
            <div class="new-hover"></div>
			<div class="product-thumb transition item-inner">
				<?php if ($product['special']) { ?>
					<span class="sale"> Sale </span>
				<?php } ?>
				<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
				<?php if (isset($product['rating'])) { ?>
				<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="" /></div>
				<?php } ?>
				
				<?php if($config_slide['f_show_des']){ ?>
				<p class="description"><?php echo $product['description']; ?></p>
				<?php } ?>
				
                
                    <div class="cart2">
    				    <?php if($config_slide['f_show_addtocart']) { ?>
						<button type="button"  title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
						<?php } ?>
     			    </div>
                    
                    <div class="wishlist2">
					   <button type="button"  title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></button>
     			    </div>
                    <div class="compare2">
		   			<button type="button"  title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></button>
					</div>
                    <div class="product_detail">
                        <a href="<?php echo $product['href']; ?>">Detail</a>
                    </div>
                <div class="name-box">
                    <div class="new-icon"></div>
                    <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                    <?php if($config_slide['f_show_price']){ ?>
					<?php if ($product['price']) { ?>
						<div class="price">
						  <?php if (!$product['special']) { ?>
						  <?php echo $product['price']; ?>
						  <?php } else { ?>
						  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
						  <?php } ?>
						  <?php if ($product['tax']) { ?>
						  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
						  <?php } ?>
						</div>
					<?php } ?>
				<?php } ?>
    				<div class="actions">
    					<div class="button-group">
    						<div class="add-to-links">
    							<div class="cart">
    								<?php if($config_slide['f_show_addtocart']) { ?>
    								<button type="button"  onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>
    								<?php } ?>
    							</div>
    							<!-- <div class="wishlist">
    								<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></button>
    							</div>
    							<div class="compare">
    								<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></button>
    							</div> -->
    						</div>
    					</div>
    				</div>
                </div>
			</div>
		  </div>
			 <?php if($count % $rows == 0 ) { echo '</div>'; }  ?>
		  <?php } ?>
		</div>
	</div>
	</div>
<script type="text/javascript">
$(document).ready(function() { 
  $(".owl-demo-mostproduct").owlCarousel({
	  autoPlay: <?php if($config_slide['f_speed_slide']> 0 ) { echo  'true' ;} else { echo 'false';} ?>, //Set AutoPlay to 3 seconds
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	  slideSpeed : <?php if($config_slide['f_speed_slide']) { echo $config_slide['f_speed_slide'] ;} else { echo 200;} ?>,
	  navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : true,
	  pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
 
  });
 
});
</script>
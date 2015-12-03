
 <div id="specialproduct" class="col-xs-12 col-md-6 col-sm-12">  
 
		<div class="title-module">
            <h2>
                <?php $title = explode(' ',$heading_title,3); for($i=0;$i<count($title);$i++){ 
        	               $j=$i+1;
                            echo "<span class='word".$j."'> ".$title[$i]." </span>";
                        }
                ?>
            </h2>
        </div> <!-- title-module -->
    <div class="owl-demo-bestsellerproduct">
		<?php 
			$count = 0; 
			$countproduct = count($products);
			$row=1;
			$rows = $config_slide['f_rows']; 
			if(!$rows) {$rows=1;}
		?>
		<?php foreach ($products as $product) { ?>
			<?php if($count++ % $rows == 0 ) { echo '<div class="row_items">'; }  ?>
			  <div class="col-product"> <!-- remove class item_product-->
				<div class="product-thumb transition">
				  <div class="image box-image col-sm-6 col-xs-6">
					<a href="<?php echo $product['href']; ?>">
						<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
					</a>
				  </div>
				  <div class="box-content col-sm-6 col-xs-6">
					  <div class="caption">
						<h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
						<?php if($config_slide['f_show_des']){ ?>
								<p><?php echo $product['description']; ?></p>
						<?php } ?>
						<?php if (isset($product['rating'])) { ?>
					<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="" /></div>
						<?php } ?>
						<?php if($config_slide['f_show_price']){ ?>
							<?php if ($product['price']) { ?>
								<div class="price">
								  <?php if (!$product['special']) { ?>
									<?php echo $product['price']; ?>
								  <?php } else { ?> 
									<span class="price-old"><?php echo $product['price']; ?></span>
									<span class="price-new"><?php echo $product['special']; ?></span>
								  <?php } ?>
								  <?php if ($product['tax']) { ?>
									<span class="price-tax">
										<?php echo $text_tax; ?> <?php echo $product['tax']; ?>
									</span>
								  <?php } ?>
								</div> <!-- PRICE -->
								<?php } ?>
						<?php } ?>
					  </div> <!-- caption -->
				  <div class="button-group">
					<?php if($config_slide['f_show_addtocart']) { ?>
					<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="button-cart"><span><i class="fa fa-plus-square"></i><?php echo $button_cart; ?></span></button>
					<?php } ?>
					<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
					<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
				  </div> <!-- button-group-->
				  </div> <!-- box-content -->
				</div><!-- product-thumb transition-->
			  </div><!-- col-product -->
		  <?php if(($count % $rows == 0) || ($count == $countproduct)) { echo '</div><!-- row_items--> '; }  ?>
      <?php } ?>
    </div> <!-- owl-demo-bestsellerproduct -->
</div><!-- /#bestproductslider -->
 
<script type="text/javascript">
$(document).ready(function() { 
  $(".owl-demo-specialproduct").owlCarousel({
	  autoPlay: <?php if($config_slide['f_speed_slide']> 0 ) { echo  'true' ;} else { echo 'false';} ?>,
      items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
	  slideSpeed : <?php if($config_slide['f_speed_slide']) { echo $config_slide['f_speed_slide'] ;} else { echo 200;} ?>,
	  navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
	  paginationNumbers : true,
	  pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
	  stopOnHover : false,
      navigationText: ['<span class="owl-prev" >Prev</span>', '<span class="owl-next" >Next</span>'],
      itemsDesktop : [1199,2], 
		itemsDesktopSmall : [900,2], 
		itemsTablet: [680,2],
		itemsMobile : [480,1]
 
  });
 
});
</script>
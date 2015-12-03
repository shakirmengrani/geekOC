<div class="featured-product-container">
<div class="ma-featured-product-title"><h2><?php echo $heading_title; ?></h2></div>
<div class="row product-layout">
  <?php foreach ($products as $product) { ?>
  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-6 col-smb-12 col-mobile">
	<div class="product-thumb transition item-inner">
		<?php if ($product['special']) { ?>
			<span class="sale"> Sale </span>
		<?php } ?>
		<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <p class="description"><?php echo $product['description']; ?></p>
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
		<?php if ($product['rating']) { ?>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        <?php } ?>
		<div class="actions">
			<div class="button-group">
				<div class="add-to-links">
					<div class="cart"><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button></div>
					<div class="wishlist">
					<button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_wishlist; ?></span></button>
					</div>
					<div class="compare">
					<button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_compare; ?></span></button>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
  <?php } ?>
</div>
  </div>

<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>

<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"
type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/css/jquery-ui.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/tt_greek_home1/stylesheet/opentheme/oclayerednavigation/css/oclayerednavigation.css"
rel="stylesheet">
<script src="catalog/view/javascript/opentheme/oclayerednavigation/oclayerednavigation.js"
type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/owlcarousel/owl.carousel.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css' />
<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,600,500,700,800,900' rel='stylesheet' type='text/css' />
<link href="catalog/view/theme/tt_greek_home1/stylesheet/stylesheet.css" rel="stylesheet" type="text/css">
<link href="catalog/view/theme/tt_greek_home1/stylesheet/animate.css" rel="stylesheet" type="text/css">
<link href="catalog/view/theme/tt_greek_home1/stylesheet/opentheme/hozmegamenu/css/custommenu.css" rel="stylesheet">
<script src="catalog/view/javascript/opentheme/hozmegamenu/custommenu.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/hozmegamenu/mobile_menu.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/tt_greek_home1/stylesheet/opentheme/ocquickview/css/ocquickview.css">
<script src="catalog/view/javascript/opentheme/ocquickview/ocquickview.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_greek_home1/stylesheet/opentheme/css/owl.carousel.css" rel="stylesheet">
<script src="catalog/view/javascript/jquery/elevatezoom/jquery.elevatezoom.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/ocslideshow/jquery.nivo.slider.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/opcajaxlogin/opcajaxlogin.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_greek_home1/stylesheet/opentheme/opcajaxlogin/css/opcajaxlogin.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
<script type="text/javascript">
    $(document).ready(function() {
        $("*").find("a[href='"+window.location.href+"']").each(function(){
            $(this).addClass("current");
		}) ;
		
		
});
$(document).ready(function() {
	var current_page = window.location.href;
	if(current_page.match(/ocbestseller/)){
		$('a[href$="ocbestseller"]').addClass("current");
	};
	if(current_page.match(/ocnewproduct/)){
		$('a[href$="ocnewproduct"]').addClass("current");
	};
	if(current_page.match(/contact/)){
		$('a[href$="contact"]').addClass("current");
	};
});
</script>
</head>
<body class="<?php echo $class; ?>">
<div id="top">
  <div class="container">
    <div class="row">
		<div class="left-header col-md-5 col-sm-5 col-sms-12">
			<p class="welcome-msg">Default welcome msg! </p>
		</div>
		<div class="right-header col-md-7 col-sm-7 col-sms-12">
				<div id="top-links" class="nav pull-right">
					<ul class="list-inline links">
					  <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><span><?php echo $text_account; ?></span> <i class="fa fa-angle-down"></i></a>
						<ul class="dropdown-menu dropdown-menu-right ul-account">
						  <?php if ($logged) { ?>
						  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
						  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
						  <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
						  <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
						  <li><a id="a-logout-link" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
						  <?php } else { ?>
						  <li><a id="a-register-link" href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
						  <li><a id="a-login-link" href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
						  <?php } ?>
						</ul>
					  </li>
					  <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"> <span><?php echo $text_wishlist; ?></span></a></li>
					  <li><a class="shopping_cart" href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"> <span><?php echo $text_shopping_cart; ?></span></a></li>
					  <li><a class="checkout" href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><span><?php echo $text_checkout; ?></span></a></li>
					</ul>
				</div>
			<div class="row-header">
				<div class="currency-language">
					<?php echo $currency; ?>
					<?php echo $language; ?>
				</div>
				<div class="text-welcome"><p><?php echo $text_msg; ?></p></div>	
			</div>
		</div>
    </div>
  </div>
</div>
<header>
<div class="header">
  <div class="container">
	<div class="header-inner">
    <div class="row">
	<div class="header-search-parent col-md-4 col-sm-4 col-xs-12">
		<div class="header-search"><?php echo $search; ?></div>
		</div>
		  <div class="col-md-4 col-sm-4 col-xs-12">
			<div id="logo">
			<?php if ($logo) { ?>
			  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
			  <?php } else { ?>
			  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
			  <?php } ?>
			</div>
		</div>
      <div class="col-md-4 col-sm-4 col-xs-12">
			<div class="top-cart">
				<?php echo $cart; ?>
			</div>
		
    </div>
	</div>
	</div>
</div>
</div>
</header>
<?php echo $content_block; ?>
<?php if ($categories) { ?>
<?php } ?>
<script type="text/javascript">
	$(window).scroll(function () {
	if ($(this).scrollTop() > 145) {
	   $('.nav-container').addClass("fix-nav");
	} else {
	   $('.nav-container').removeClass("fix-nav");
	}
	 });
</script>
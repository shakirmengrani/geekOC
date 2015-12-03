<?php if($ocquickview_status == 1): ?>

<div id="quickview-content">
    <!-- Load quickview content into here -->
</div>

<div id="quickview-bg-block">
    <!-- Quick View deep background -->
</div>

<div class="quickview-load-img">
    <img src="<?php echo $ocquickview_loader_img; ?>" alt="" />
</div>

<div>
	<input type="hidden" id="qv-status" value="<?php echo $ocquickview_status; ?>" />
	<input type="hidden" id="qv-container" value="<?php echo $ocquickview_container ?>" />
</div>
<?php endif; ?>
//<![CDATA[


$(window).load(function() {
	ocquickview.initQuickViewContainer();
});

$(document).ajaxComplete(function() {
	var qvcontainer = $('#qv-container').val();
	var qvstatus = $('#qv-status').val();
	if(qvstatus == 1) {
		var containers = qvcontainer.split(';');
		containers.forEach(function(container) {
			ocquickview.initQuickViewButton(container);
		});
	}	
});
$(document).ready(function() { 
		$(".image-qv-additional").owlCarousel({
			navigation:true,
			pagination: false,
			slideSpeed : 500,
			goToFirstSpeed : 1500,
			autoHeight : true,
			items : 4, //10 items above 1000px browser width
			itemsDesktop : [1000,3], //5 items between 1000px and 901px
			itemsDesktopSmall : [900,3], // betweem 900px and 601px
			itemsTablet: [767,4], //2 items between 600 and 0
			itemsMobile : [480,2] // itemsMobile disabled - inherit from itemsTablet option
		  });
});
var ocquickview = {
	'initQuickViewButton' : function(divContain) {
		$(divContain + ' a').each(function() {
			var hasImg = $(this).has('img').length;
			if(hasImg == 1) {
				var url = $(this).attr('href');
				var isExist = $(this).data('exist');
				if(url.search('route=product/product') != -1) {
					if(isExist != 1) {
						var divContainer = $(this).closest('div');
						divContainer.prepend('<div class="qv-button-container"><button class="btn-quickview" type="button">Quick View</button></div>');
						url = url.replace('route=product/product', 'route=module/ocquickview');
						divContainer.children('div.qv-button-container').children('.btn-quickview').attr('onclick', "ocquickview.ajaxView('"+ url +"')");
						$(this).attr('data-exist', 1);
					}
				}
			} 
		});
	},

	'initQuickViewContainer' : function() {
		$('body').append('<div class="quickview-container"></div>');
		$('div.quickview-container').load('index.php?route=module/ocquickview/appendcontainer');
	},

	'appendCloseFrameLink' : function() {
		$('div.quickview-container').prepend("<a href='javascript:void(0);' class='a-qv-close' onclick='ocquickview.closeQVFrame()'>Close</a>");
	},

	'closeQVFrame' : function() {
		$('#quickview-bg-block').hide();
    	$('.quickview-load-img').hide();
		$('div.quickview-container a').hide(1);
    	$('div#quickview-content').hide(600);
    	$('div#quickview-content').html('');
	},

	'ajaxView'	: function(url) {
		$.ajax({
			url 		: url,
			type		: 'get',
			beforeSend	: function() {
				$('#quickview-bg-block').show();
				$('.quickview-load-img').show();
			},
			success		: function(json) {
				if(json['success'] == true) {
					$('.quickview-load-img').hide();
					$('#quickview-content').html(json['html']);
					ocquickview.appendCloseFrameLink();
					$('#quickview-content').show(600);
				}
			}
		});
	}

};
//]]>

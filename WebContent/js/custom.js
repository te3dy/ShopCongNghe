$(document).on('ready', function() {
	// initialization of header
	$.HSCore.components.HSHeader.init($('#js-header'));
	$.HSCore.helpers.HSHamburgers.init('.hamburger');

	// initialization of HSMegaMenu component
	$('.js-mega-menu').HSMegaMenu({
		event : 'hover',
		pageContainer : $('.container'),
		breakpoint : 991
	});

	// initialization of HSDropdown component
	$.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
		afterOpen : function() {
			$(this).find('input[type="search"]').focus();
		}
	});

	// initialization of carousel
	// $.HSCore.components.HSCarousel.init('[class*="js-carousel"]');
	// initialization of carousel
	$.HSCore.components.HSCarousel.init('.js-carousel');

	// initialization of header's height equal offset
	$.HSCore.helpers.HSHeightCalc.init();

	// initialization of video on background
	$.HSCore.helpers.HSBgVideo.init('.js-bg-video');

	// initialization of popups
	$.HSCore.components.HSPopup.init('.js-fancybox');

	// initialization of go to
	$.HSCore.components.HSGoTo.init('.js-go-to');

	// custom functions
	// $('#carousel7').on('click', '.js-thumb', function (e) {
	// e.stopPropagation();
	// //Variables
	// var i;

	// //Variables values
	// i = $(this).data('slick-index');

	// if ($('#carousel7').slick('slickCurrentSlide') !== i) {
	// $('#carousel7').slick('slickGoTo', i);
	// }
	// });
	$(document).ready(function() {
		// initialization of qty
		$.HSCore.components.HSCountQty.init('.js-quantity');
	});
});

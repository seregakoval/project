// var imgDir = theme_URL+"/images";

jQuery.fn.outerHTML = function(s) {
	    return s
	        ? this.before(s).remove()
	        : jQuery("<p>").append(this.eq(0).clone()).html();
};


jQuery('.button-b a.size.pasive').hover(function(){
	$(this).parents('#about-tab-wrap').removeClass('grayed');
},function(){
	$(this).parents('#about-tab-wrap').addClass('grayed');
});

jQuery('#submit-button-mh').on('click',function(){
	jQuery('#hide-submit').trigger('click');
});

var titleEl = jQuery('.head-personal.rl-head .right-text-img p');
var titlText = titleEl.html();
titleEl.html('&nbsp;');
var oneRowHeight = titleEl.height();
titleEl.html(titlText);
var titleHeight = titleEl.height();
titleEl.attr('data-num-rows', 1);
if (titleHeight > (oneRowHeight*1)) {
	titleEl.attr('data-num-rows', 2);
}
if (titleHeight > (oneRowHeight*2)) {
	titleEl.attr('data-num-rows', 3);
}


// jQuery('.social-block a img').hover(function(){
// 	var Src = jQuery(this).attr('src');
// 	var NewSrc = jQuery(this).attr('data-hover');
// 	jQuery(this).attr('src',NewSrc);
// 	jQuery(this).attr('data-unhover',Src);
// 	},function(){
// 	var Src = jQuery(this).attr('src');
// 	var NewSrc = jQuery(this).attr('data-unhover');	
// 	jQuery(this).attr('src',NewSrc);
// 	jQuery(this).attr('data-hover',Src);
// });

// jQuery('.box-social').hover(function(){
// 	imgToShow = jQuery(this).find('img.open');
// 	imgToHide = jQuery(this).find('img.closed');
// 	imgToHide.fadeOut(100,function(){imgToShow.fadeIn(100);})
// 	},function(){
// 	imgToShow = jQuery(this).find('img.closed');
// 	imgToHide = jQuery(this).find('img.open');
// 	imgToHide.fadeOut(100,function(){imgToShow.fadeIn(100);imgToShow.show(400);})
// });

jQuery(".box-wrap").hover(function(){
	jQuery(this).find('.box-social.slim').removeClass('active');
	jQuery(this).find('.box-social.expanded').addClass('active');
},
function(){
	jQuery(this).find('.box-social.expanded').removeClass('active');
	jQuery(this).find('.box-social.slim').addClass('active');	
});

jQuery(document).ready(function() {
	if (jQuery('body').hasClass('home')) {
		ScrollOffset = 132;
	} else {
		ScrollOffset = 328;
	}
		var sceneMenu = new ScrollMagic.Scene({
	    //triggerElement: "#menu"
	     offset: ScrollOffset
	    })
	   .setPin("#social-block")
	   .addTo(controller);
});
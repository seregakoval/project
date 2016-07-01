// var imgDir = theme_URL+"/images";

jQuery.fn.outerHTML = function(s) {
	    return s
	        ? this.before(s).remove()
	        : jQuery("<p>").append(this.eq(0).clone()).html();
};



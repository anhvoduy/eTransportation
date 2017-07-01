(function ($) {
	"use strict";
    jQuery(window).load(function(){
        // Preloader
        $("#preloader").fadeOut(500);
    });
}(jQuery));

// init wow
// new WOW().init();
// var wowInittialize = function(){
//     return new WOW().init();
// };

// transport app
(function ($) {
	"use strict";
    // load modules
    angular.module('transport', [
        'transport.common', 
        'transport.controllers', 
        'transport.directives', 
        'transport.services'
    ]);
    
    // boostrap
    angular.element(function() {
        angular.bootstrap(document, ['transport']);
    });
}());
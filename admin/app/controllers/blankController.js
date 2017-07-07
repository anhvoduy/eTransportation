(function () {
	'use strict';
	app.controller('blankController', blankController);
	blankController.$inject = ['$rootScope'];
	function blankController($rootScope) {
		// view-model
		var vm = this;
		
		// functions
		function activate() {
			console.log(' init blankController ..... ');
		}
		
		/* start */
		activate();
	}
})();
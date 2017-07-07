(function () {
	'use strict';
	app.controller('chartController', chartController);
	chartController.$inject = ['$rootScope'];
	function chartController($rootScope) {
		// view-model
		var vm = this;
		
		// functions
		function activate() {
			console.log(' init chartController ..... ');
		}
		
		/* start */
		activate();
	}
})();
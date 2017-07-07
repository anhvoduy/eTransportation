(function () {
	'use strict';
	app.controller('dashboardController', dashboardController);
	dashboardController.$inject = ['$rootScope'];
	function dashboardController($rootScope) {
		// view-model
		var vm = this;
		
		// functions
		function activate() {
			console.log(' init dashboardController ..... ');
		}
		
		/* start */
		activate();
	}
})();
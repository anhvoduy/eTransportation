(function () {
	'use strict';
	app.controller('tableController', tableController);
	tableController.$inject = ['$rootScope'];
	function tableController($rootScope) {
		// view-model
		var vm = this;
		
		// functions
		function activate() {
			console.log(' init tableController ..... ');
		}
		
		/* start */
		activate();
	}
})();
(function () {
	'use strict';
	app.controller('bootstrapGridController', bootstrapGridController);
	bootstrapGridController.$inject = ['$rootScope'];
	function bootstrapGridController($rootScope) {
		// view-model
		var vm = this;
		
		// functions
		function activate() {
			console.log(' init bootstrapGridController ..... ');
		}
		
		/* start */
		activate();
	}
})();
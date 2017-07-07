(function () {
	'use strict';
	app.controller('bootstrapElementController', bootstrapElementController);
	bootstrapElementController.$inject = ['$rootScope'];
	function bootstrapElementController($rootScope) {
		// view-model
		var vm = this;
		
		// functions
		function activate() {
			console.log(' init bootstrapElementController ..... ');
		}
		
		/* start */
		activate();
	}
})();
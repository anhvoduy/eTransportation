(function () {
	'use strict';
	app.controller('formController', formController);
	formController.$inject = ['$rootScope'];
	function formController($rootScope) {
		// view-model
		var vm = this;
		
		// functions
		function activate() {
			console.log(' init formController ..... ');
		}
		
		/* start */
		activate();
	}
})();
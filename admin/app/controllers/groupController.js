(function () {
	'use strict';
	app.controller('userController', userController);
	userController.$inject = ['$rootScope', '$scope', 'userService'];
	function userController($rootScope, $scope, userService) {
		
		// functions
		function activate() {			
			userService.getList().then(function(data){
				$scope.users = data;
			}, function(err){
				console.log(err);
			});
		}
		
		/* start */
		activate();
	}
})();
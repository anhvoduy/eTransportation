(function () {
	'use strict';
	app.controller('userPermissionController', userPermissionController);
	userPermissionController.$inject = ['$rootScope', '$scope', 'userService'];
	function userPermissionController($rootScope, $scope, userService) {
		
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
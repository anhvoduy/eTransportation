(function () {
	'use strict';
	app.controller('userGroupController', userGroupController);
	userGroupController.$inject = ['$rootScope', '$scope', 'userService'];
	function userGroupController($rootScope, $scope, userService) {
		
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
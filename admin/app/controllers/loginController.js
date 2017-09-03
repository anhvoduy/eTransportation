(function () {
	'use strict';
	app.controller('loginController', loginController);
	loginController.$inject = ['$rootScope', '$scope', '$location', 'authService'];
	function loginController($rootScope, $scope, $location, authService) {		
		function activate() {			
			authService.clearCredentials(); // reset login status
		}
		
		$scope.login = function () {
			if($scope.username && $scope.password){
				authService.login($scope.username, $scope.password).then(function(result){
					console.log(result);
					authService.setCredentials(result.user);
					$location.path('/');
				}, function(error){
					console.log(error);
				});
			}
		};
				
		/* start */
		activate();
	}
})();
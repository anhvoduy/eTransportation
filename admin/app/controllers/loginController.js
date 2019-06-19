(function () {
	'use strict';
	app.controller('loginController', loginController);
	loginController.$inject = ['$scope', '$location', 'authService'];
	function loginController($scope, $location, authService) {
		function activate() {
			authService.clearCredentials(); // reset login status
		}
		
		$scope.login = function () {
			if($scope.username && $scope.password){
				$scope.dataLoading = true;
				authService.login($scope.username, $scope.password).then(function(result){
					if(result.success && result.user){
						authService.setCredentials(result.user);
						$location.path('/');
					}
					else {
						$scope.error = result.message || 'Internal Server Error';
						$scope.dataLoading = false;
					}
				}, function(result){
					$scope.error = result.message;
					$scope.dataLoading = false;
				});
			}
		};

		$scope.loginAzure = function () {
			if($scope.username && $scope.password){
				$scope.dataLoading = true;
				authService.loginAzure($scope.username, $scope.password).then(function(result){
					if(result.success && result.user){
						authService.setCredentials(result.user);
						$location.path('/');
					}
					else {
						$scope.error = result.message || 'Internal Server Error';
						$scope.dataLoading = false;
					}
				}, function(result){
					$scope.error = result.message;
					$scope.dataLoading = false;
				});
			}
		};
		
		/* start */
		activate();
	}
})();
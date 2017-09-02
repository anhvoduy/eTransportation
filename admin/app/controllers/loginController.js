(function () {
	'use strict';
	app.controller('loginController', loginController);
	loginController.$inject = ['$rootScope', '$scope', '$location', 'authService'];
	function loginController($rootScope, $scope, $location, authService) {		
		function activate() {
			console.log(' init loginController ..... ');			
			authService.clearCredentials(); // reset login status
		}

		// var animateLogin = function(){
        //     $('formLogin').animate({height: "toggle", opacity: "toggle"}, "slow");
		// }
		
		// $scope.createAccount = function(){
        //     console.log('---createAccount---');
        //     animateLogin();
		// };

		// $scope.registerAccount = function(){
        //     console.log('---registerAccount---');
		// }
		
		// $scope.signIn = function(){
        //     console.log('---signIn---');
        //     animateLogin();
		// };
		
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
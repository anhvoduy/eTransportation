app.run(['$rootScope', '$location', '$cookieStore', '$http', 'authService',
    function ($rootScope, $location, $cookieStore, $http, authService) {
		// keep user logged in after page refresh
        $rootScope.globals = $cookieStore.get('globals') || {};
        $rootScope.settings = $cookieStore.get('settings') || {};
		if ($rootScope.globals.currentUser) {
			$http.defaults.headers.common['Authorization'] = $rootScope.globals.currentUser.authdata; // jshint ignore:line						
		}		
						
		$rootScope.$on('$locationChangeStart', function (event, next, current) {			
			// redirect to login page if not logged in
			console.log('locationChangeStart...');
			if ($location.path() !== '/login' && !$rootScope.globals.currentUser) {
				$location.path('/login');
			}
			else if($location.path() === '' || $location.path() === '/') {
				if(!$rootScope.globals.currentUser) $location.path('/login');
				else $location.path('/dashboard');
			}
			else {
				if ($rootScope.globals && $rootScope.globals.currentUser) {
					console.log('setupUI().....');
					//$rootScope.setupUI();
				}
			}
		});

		// set up UI
		$rootScope.setupUI = function () {
			// get navigation
			//userService.getMenu().then(function (result) {
			//	$rootScope.settings.navigation = result;				
			//}, function (error) {
			//	console.log(error);
			//});
			//
			//// get user profile
			//userService.getProfile().then(function (result) {
			//	$rootScope.settings.profile = result;				
			//}, function (error) {
			//	console.log(error);
			//});
		}
	}
]);
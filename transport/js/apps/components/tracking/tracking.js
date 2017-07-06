(function () {
    'use strict';    
    angular.module('transport.components.tracking', ['transport.common'])
    .directive('trackButton', trackButton)
    .directive('trackDialog', trackDialog)
    .controller('trackController', trackController);
    
    // directive    
    trackButton.$inject = [];
    function trackButton(appCommon){
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            controller: 'trackController',
            template: '<a href="" ng-click="showDialog()" class="track_button">Track Shipment</a>',
            link: function (scope, element, attrs, ngCtrl) {
                console.log('init trackButton.....');
            }
        };
    };

    trackDialog.$inject = [];
    function trackDialog(appCommon){
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            controller: 'trackController',
            templateUrl: function () {
                return String.format('{0}{1}',appCommon.baseUrl, "js/apps/components/tracking/tracking.tpl.html");
            },
            link: function (scope, element, attrs, ngCtrl) {
                console.log('init trackDialog.....');
            }
        };
    };

    // controller
    trackController.$inject = ['$scope', '$rootScope', '$location', '$window'];
    function trackController($scope, $rootScope, $location, $window) {
        $scope.showDialog = function(){
            console.log('---showDialog---');            
        }
	}
})();

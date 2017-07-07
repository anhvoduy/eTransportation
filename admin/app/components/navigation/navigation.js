(function () {
    'use strict';
    angular.module('cargo.components.navigation', ['cargo.common'])
    .directive('navigationMenu', ['appCommon', function(appCommon){
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            controller: 'navigationController',
            templateUrl: function () {
                return String.format('{0}{1}', appCommon.baseUrl, "admin/app/components/navigation/navigaton.tpl.html");                
            },
            link: function (scope, element, attrs, ngCtrl) {
                console.log('init navigation.....');
            }
        };
    }])
    .controller('navigationController', ['$scope', function($scope){
        $scope.activate = function(){

        }
    }]);    
})();
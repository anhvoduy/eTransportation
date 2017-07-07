(function () {
    angular.module('cargo.components.navigation', ['cargo.common'])
    .directive('navigationMenu',['appCommon', function (appCommon) {
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            controller: 'navigationController',
            templateUrl: function () {
                //return String.format('{0}{1}',appCommon.baseUrl, "app/components/navigation/navigation.tpl.html");
                return String.format("/admin/app/components/navigation/navigation.tpl.html");
            },
            link: function (scope, element, attrs, ngCtrl) {
                console.log('init navigation.....');
            }
        };
    }])
    .controller('navigationController', ['$scope', function($scope){        
        var activate = function(){
            
        };

        activate();
    }])
})();
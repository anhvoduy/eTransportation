(function () {
    'use strict';	
    angular.module('transport.common', [])
    .factory('appCommon', ['$q', function ($q) {
        var appCommon = function () {            
        };
        
        appCommon.prototype.baseUrl = function(){            
            // dev local mode
            return '/';
        };        

        return new appCommon();
    }]);
})();


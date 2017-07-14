(function () {
    'use strict';
    app.factory('truckService', truckService);
    truckService.$inject = ['$q', 'baseService'];
    function truckService($q, baseService) {
        // constructor
        var truckService = function () {            
        }
        truckService.prototype = new baseService('api/truck');
        truckService.prototype.constructor = truckService;
                
        // methods
        truckService.prototype.getItems = function () {
            var url = String.format('{0}{1}', this.api, '/items');
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        return new truckService;
    };
})();
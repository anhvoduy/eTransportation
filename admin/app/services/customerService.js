(function () {
    'use strict';
    app.factory('customerService', customerService);
    customerService.$inject = ['$q', 'baseService'];
    function customerService($q, baseService) {
        // constructor
        var customerService = function () {            
        }
        customerService.prototype = new baseService('api/customer');
        customerService.prototype.constructor = customerService;
                
        // methods
        customerService.prototype.getItems = function () {
            var url = String.format('{0}{1}', this.api, '/items');
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        return new customerService;
    };
})();
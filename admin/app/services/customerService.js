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
        customerService.prototype.getList = function (pageCurrent, pageSize) {
            var url = String.format('{0}{1}', this.api, '/list');
            var params = {
                PageCurrent: pageCurrent,
                PageSize: pageSize
            }
            
            var q = $q.defer();
            this.getData(url, params).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        customerService.prototype.getItem = function (customerKey) {
            var url = String.format('{0}{1}{2}{3}', this.api, '/item', '?CustomerKey=', customerKey);
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }
                
        customerService.prototype.update = function (customer) {
            var url = String.format('{0}{1}', this.api, '/update');
            
            var q = $q.defer();
            this.postData(url, customer).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        // export
        return new customerService;
    };
})();
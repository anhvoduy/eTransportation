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
        truckService.prototype.getList = function (pageCurrent, pageSize) {
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
            });
            return q.promise;
        }

        truckService.prototype.getItem = function (truckKey) {
            var url = String.format('{0}{1}{2}{3}', this.api, '/item', '?TruckKey=', truckKey);
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            });
            return q.promise;
        }

        truckService.prototype.update = function (truck) {
            var url = String.format('{0}{1}', this.api, '/update');
            
            var q = $q.defer();
            this.postData(url, truck).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            });
            return q.promise;
        }

        return new truckService;
    };
})();
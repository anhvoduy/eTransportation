(function () {
    'use strict';
    app.factory('groupService', groupService);
    groupService.$inject = ['$q', 'baseService'];
    function groupService($q, baseService) {
        // constructor
        var groupService = function () {            
        }
        groupService.prototype = new baseService('api/group');
        groupService.prototype.constructor = groupService;
                
        // methods
        groupService.prototype.getList = function () {
            var url = String.format('{0}{1}', this.api, '/list');
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        groupService.prototype.getItem = function (groupKey) {
            var url = String.format('{0}{1}{2}{3}', this.api, '/item', '?GroupKey=', groupKey);
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        groupService.prototype.getPermission = function (groupKey) {
            var url = String.format('{0}{1}{2}{3}', this.api, '/permission', '?GroupKey=', groupKey);
            
            var q = $q.defer();
            this.getData(url).then(function (result) {                
                angular.forEach(result, function(item){
                    item.IsCreate = item.IsCreate === 0 ? false : true;
                    item.IsUpdate = item.IsUpdate === 0 ? false : true;
                    item.IsDelete = item.IsDelete === 0 ? false : true;
                    item.IsDisplay = item.IsDisplay === 0 ? false : true;
                });
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        groupService.prototype.assignPermission = function (groupPermission) {
            var url = String.format('{0}{1}', this.api, '/assignPermission');
            
            var q = $q.defer();
            this.postData(url, groupPermission).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }
                
        groupService.prototype.update = function (customer) {
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
        return new groupService;
    };
})();
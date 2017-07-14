const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');
const data = require('../database/sampleData');

// Constructor
const Factory = function () { 
}

Factory.prototype.getTrucks = function(){
    let deferred  = Q.defer();
    let trucks;

    Q.when()
    .then(function(){
        return dbContext.openConnection();
    })
    .then(function(pool){
        let sql = `
            SELECT TOP (1000) [TruckId]
                ,[TruckName]
                ,[TruckNumber]
                ,[Description]
            FROM [ndemo].[dbo].[Truck]
            ORDER BY [TruckId]
        `;
        return dbContext.queryData(pool, sql)
		.then(function(data){
			trucks = data;
		});
    })
    .then(function(data){
        dbContext.closeConnection();
    })
    .then(function(){
        deferred.resolve(trucks);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
}

Factory.prototype.getTruckById = function(){
    return data.getUser();
}

Factory.prototype.createTruck = function(){
    return data.getUsers();
}

Factory.prototype.updateTruck = function(){
    return data.getUsers();
}

Factory.prototype.deleteTruck = function(){
    return data.getMenus();
}

// Export
module.exports = new Factory;

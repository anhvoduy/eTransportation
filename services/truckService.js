const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');

// Constructor
const Factory = function () { 
}

Factory.prototype.getList = function(){
    let deferred  = Q.defer();
    let trucks;

    Q.when()
    .then(function(){
        return dbContext.openConnection();
    })
    .then(function(){
        let sql = `
            SELECT TruckId, TruckKey, TruckName, TruckNumber, Description
            FROM Truck
            WHERE Deleted = 0
            ORDER BY TruckId DESC
        `;
        return dbContext.queryList(sql)
		.then(function(data){
			trucks = data;
        })
        .then(function(){
            dbContext.closeConnection();
        });
    })    
    .then(function(){
        deferred.resolve(trucks);
    })
    .catch(function(err){
        dbContext.closeConnection();
        deferred.reject(err);
    });

    return deferred.promise;
}

Factory.prototype.getItem = Q.async(function* (TruckKey){    
    try
    {        
        let sql = `
            SELECT TruckId, TruckKey, TruckName, TruckNumber, Description
            FROM Truck
            WHERE TruckKey = @TruckKey AND Deleted = 0
        `;
        yield dbContext.openConnection();
        let truck = yield dbContext.queryItem(sql, { TruckKey: TruckKey });
        yield dbContext.closeConnection();
        return truck;
    }catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
});

Factory.prototype.create = function(truck){
    return true;
}

Factory.prototype.update = Q.async(function* (truck){
    try
    {        
        let sql = `
            UPDATE Truck
            SET TruckName = @TruckName, 
                TruckNumber = @TruckNumber, 
                Description = @Description            
            WHERE TruckKey = @TruckKey
        `;
        yield dbContext.openConnection();
        let data = yield dbContext.queryExecute(sql, truck);
        yield dbContext.closeConnection();
        return data;
    }catch(err){
        yield dbContext.closeConnection();
        throw err;
    }
});

Factory.prototype.delete = function(TruckKey){
    return true;
}

// Export
module.exports = new Factory;

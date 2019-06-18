const Q = require('q');
const dbContext = require('../lib/dbContext');

// Constructor
const Factory = function () {
}

/*
SQL Server 2012 pagination:
https://social.technet.microsoft.com/wiki/contents/articles/23811.paging-a-query-with-sql-server.aspx
*/
Factory.prototype.getList = Q.async(function* (query){
    try
    {
        let TotalSize = 0;
        let PageTotal = 0;
        let PageCurrent = parseInt(query.PageCurrent) - 1;
        let PageSize = parseInt(query.PageSize);
        let PageOffset = PageCurrent * PageSize;
        
        // get hits total
        let sqlTotal = `
            SELECT COUNT(*) AS Total
            FROM Customer
            WHERE Deleted = 0
        `;
        let totalRows = (yield dbContext.queryItem(sqlTotal)).Total;

        // get data
        let sqlQuery = `
            SELECT CustomerId, CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address 
            FROM Customer
            WHERE Deleted = 0 
            ORDER BY CustomerId DESC
            OFFSET (@PageOffset) ROWS
            FETCH NEXT @PageSize ROWS ONLY
        `;
        let customers = yield dbContext.queryList(sqlQuery, {
            PageOffset: PageOffset,
            PageSize: PageSize
        });                

        let result = {
            HitsTotal: parseInt(totalRows),
            PageTotal: parseInt(Math.ceil(totalRows / PageSize)),
            PageSize: parseInt(PageSize),
            PageCurrent: parseInt(PageCurrent) + 1,
            PageData: customers
        }
        return result;
    }
    catch(err){
        throw err;
    }
})

Factory.prototype.getItem = Q.async(function* (CustomerKey){
    try
    {        
        let sql = `
            SELECT CustomerId, CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address 
            FROM Customer
            WHERE CustomerKey = @CustomerKey AND Deleted = 0
        `;        
        let customer = yield dbContext.queryItem(sql, { CustomerKey: CustomerKey });        
        return customer;
    }catch(err){        
        throw err;
    }
});

Factory.prototype.create = Q.async(function* (customer){
    try
    {        
        let sql = `
            INSERT INTO [dbo].[Customer] (CustomerKey, CustomerName, Description, 
                Email, Mobile, Tel, Fax, Title, Address, Author, Editor)
            VALUES (NEWID(), @CustomerName, @Description, 
                @Email, @Mobile, @Tel, @Fax, @Title, @Address, 'SYSTEM', 'SYSTEM')
        `;                
        let data = yield dbContext.queryExecute(sql, customer);        
        return data;
    }catch(err){        
        throw err;
    }
});

Factory.prototype.update = Q.async(function* (customer){    
    try
    {        
        let sql = `
            UPDATE Customer
            SET CustomerName = @CustomerName,
                Email = @Email,
                Mobile = @Mobile,
                Tel = @Tel,
                Fax = @Fax,
                Title = @Title,
                Address = @Address,
                Description = @Description
            WHERE CustomerKey = @CustomerKey
        `;                
        let data = yield dbContext.queryExecute(sql, customer);        
        return data;
    }catch(err){        
        throw err;
    }
});

Factory.prototype.delete = Q.async(function* (CustomerKey){
    console.log(customerKey);
    return true;
});

// Export
module.exports = new Factory;
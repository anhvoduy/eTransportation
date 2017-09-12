/*
200 OK Standard response for successful HTTP requests
201 Created Request has been fulfilled.New resource created
204 No Content Request processed.No content returned
301 Moved Permanently This and all future requests directed to the given URI
304 Not Modified Resource has not been modified since last requested
400 Bad Request Request cannot be fulfilled due to bad syntax
401 Unauthorized Authentication is possible, but has failed
403 Forbidden Server refuses to respond to request
404 Not Found Requested resource could not be found
500 Internal Server Error Generic error message when server fails
501 Not Implemented Server does not recognize method or lacks ability to fulfill
503 Service Unavailable Server is currently unavailable
*/

// Constructor
var CONSTANT = function () { 
}

CONSTANT.secretKey = 'ilovejavascript';

CONSTANT.TRANSACTIONTYPE = {
	CASHIN: 'CASHIN',
	CASHOUT: 'CASHOUT',
	STOCKIN: 'STOCKIN',
	STOCKOUT: 'STOCKOUT',
	JOURNAL: 'JOURNAL',
};

// Success Lists
CONSTANT.SUCCESS_AUTHENTICATION = { code: 'SUCCESS_Authentication', message: 'Authentication is success.' };
CONSTANT.SUCCESS_LOGIN = { code: 'SUCCESS_LOGIN', message: 'Login is success.' };
CONSTANT.SUCCESS_LOGOUT = { code: 'SUCCESS_LOGOUT', message: 'Logout is success.' };

CONSTANT.SUCCESS_CASH_CREATE = { code: 'SUCCESS_CASH_CREATE', message: 'Create Cash is success.' };
CONSTANT.SUCCESS_CASH_UPDATE = { code: 'SUCCESS_CASH_UPDATE', message: 'Update Cash is success.' };
CONSTANT.SUCCESS_CASH_DELETE = { code: 'SUCCESS_CASH_DELETE', message: 'Delete Cash is success.' };

CONSTANT.SUCCESS_STOCK_CREATE = { code: 'SUCCESS_STOCK_CREATE', message: 'Create Stock is success.' };
CONSTANT.SUCCESS_STOCK_UPDATE = { code: 'SUCCESS_STOCK_UPDATE', message: 'Update Stock is success.' };
CONSTANT.SUCCESS_STOCK_DELETE = { code: 'SUCCESS_STOCK_DELETE', message: 'Delete Stock is success.' };

CONSTANT.SUCCESS_BRAND_CREATE = { code: 'SUCCESS_BRAND_CREATE', message: 'Create Brand is success.' };
CONSTANT.SUCCESS_BRAND_UPDATE = { code: 'SUCCESS_BRAND_UPDATE', message: 'Update Brand is success.' };
CONSTANT.SUCCESS_BRAND_DELETE = { code: 'SUCCESS_BRAND_DELETE', message: 'Delete Brand is success.' };

CONSTANT.SUCCESS_PRODUCT_CREATE = { code: 'SUCCESS_PRODUCT_CREATE', message: 'Create Product is success.' };
CONSTANT.SUCCESS_PRODUCT_UPDATE = { code: 'SUCCESS_PRODUCT_UPDATE', message: 'Update Product is success.' };
CONSTANT.SUCCESS_PRODUCT_DELETE = { code: 'SUCCESS_PRODUCT_DELETE', message: 'Delete Product is success.' };

CONSTANT.SUCCESS_CUSTOMER_CREATE = { code: 'SUCCESS_CUSTOMER_CREATE', message: 'Create Customer is success.' };
CONSTANT.SUCCESS_CUSTOMER_UPDATE = { code: 'SUCCESS_CUSTOMER_UPDATE', message: 'Update Customer is success.' };
CONSTANT.SUCCESS_CUSTOMER_DELETE = { code: 'SUCCESS_CUSTOMER_DELETE', message: 'Delete Customer is success.' };

CONSTANT.SUCCESS_USER_CREATE = { code: 'SUCCESS_USER_CREATE', message: 'Create User is success.' };
CONSTANT.SUCCESS_USER_UPDATE = { code: 'SUCCESS_USER_UPDATE', message: 'Update User is success.' };
CONSTANT.SUCCESS_USER_DELETE = { code: 'SUCCESS_USER_DELETE', message: 'Delete User is success.' };

// modules
CONSTANT.MODULE = {
	CASH: { Id: 1, Name: 'CASH' },
	STOCK: { Id: 2, Name: 'STOCK' },
	PRODUCT: { Id: 3, Name: 'PRODUCT' },
	CUSTOMER: { Id: 4, Name: 'CUSTOMER' },
	TRANSPORT: { Id: 5, Name: 'TRANSPORT' }
};

// Export
module.exports = CONSTANT;
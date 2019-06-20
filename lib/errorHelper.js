// Constructor
const errorHelper = function () { 
}

errorHelper.errorHandler = function (error) {	
    const _error = {
        code: error.code,
        message: error.message,
    }
    console.log(_error);
	return _error;
}

// Error Lists
errorHelper.ERROR_UNAUTHORIZED = { code: 'ERROR_UNAUTHORIZED', message: 'User is not authorized.' };
errorHelper.ERROR_UNAUTHENTICATION = { code: 'ERROR_UNAUTHENTICATION', message: 'Username and Password is invalid.' };

errorHelper.ERROR_CONNECTION = { code: 'ERROR_CONNECTION', message: 'Current connection is closed or undefined.' };

// Customer
errorHelper.ERROR_INVALID_CUSTOMER = { code: 'ERROR_INVALID_CUSTOMER', message: "Customer is invalid" };
errorHelper.ERROR_INVALID_CUSTOMER_KEY = { code: 'ERROR_INVALID_CUSTOMER_KEY', message: "Customer Key is invalid" };

// Truck
errorHelper.ERROR_INVALID_TRUCK = { code: 'ERROR_INVALID_TRUCK', message: "Truck is invalid" };
errorHelper.ERROR_INVALID_TRUCK_KEY = { code: 'ERROR_INVALID_TRUCK_KEY', message: "Truck Key is invalid" };

// User
errorHelper.ERROR_INVALID_USER = { code: 'ERROR_INVALID_USER', message: "User is invalid" };
errorHelper.ERROR_INVALID_USER_KEY = { code: 'ERROR_INVALID_USER_KEY', message: "User Key is invalid" };

errorHelper.ERROR_NOT_EXIST_USER_KEY = { code: 'ERROR_NOT_EXIST_USER_KEY', message: 'User Key does not existed.' };
errorHelper.ERROR_NOT_EXIST_EMAIL = { code: 'ERROR_EMAIL', message: 'Email Account does not existed.' };

// Group
errorHelper.ERROR_INVALID_GROUP = { code: 'ERROR_INVALID_GROUP', message: "Group is invalid" };
errorHelper.ERROR_INVALID_GROUP_KEY = { code: 'ERROR_INVALID_GROUP_KEY', message: "Group Key is invalid" };


// Product
errorHelper.ERROR_INVALID_PRODUCT = { code: 'ERROR_INVALID_PRODUCT', message: "Product is invalid" };
errorHelper.ERROR_INVALID_PRODUCT_KEY = { code: 'ERROR_INVALID_PRODUCT_KEY', message: "Product Key is invalid" };

errorHelper.ERROR_NOT_EXIST_PRODUCT_KEY = { code: 'ERROR_NOT_EXIST_PRODUCT_KEY', message: 'Product Key does not existed.' };
errorHelper.ERROR_NOT_EXIST_PRODUCT_CODE = { code: 'ERROR_NOT_EXIST_PRODUCT_CODE', message: 'Product Code does not existed.' };


// Transaction
errorHelper.ERROR_INVALID_TRANSACTION_KEY = { code: 'ERROR_INVALID_TRANSACTION_KEY', message: 'Transaction Key is invalid.' };

errorHelper.ERROR_NOT_EXIST_TRANSACTION_KEY = { code: 'ERROR_NOT_EXIST_TRANSACTION_KEY', message: 'Transaction Key does not existed.' };

// Others
errorHelper.ERROR_INVALID_RATING = { code: 'ERROR_INVALID_RATING', message: "Rating is invalid" };
errorHelper.ERROR_INVALID_EMAIL = { code: 'ERROR_INVALID_EMAIL', message: "Email is invalid" };



// Export
module.exports = errorHelper;
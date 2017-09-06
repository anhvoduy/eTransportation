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

errorHelper.ERROR_INVALID_CUSTOMER = { code: 'ERROR_INVALID_CUSTOMER', message: "Customer is invalid" };
errorHelper.ERROR_INVALID_CUSTOMER_KEY = { code: 'ERROR_INVALID_CUSTOMER_KEY', message: "Customer Key is invalid" };

errorHelper.ERROR_INVALID_USER = { code: 'ERROR_INVALID_USER', message: "User is invalid" };
errorHelper.ERROR_INVALID_USER_KEY = { code: 'ERROR_INVALID_USER_KEY', message: "User Key is invalid" };

errorHelper.ERROR_INVALID_RATING = { code: 'ERROR_INVALID_RATING', message: "Rating is invalid" };
errorHelper.ERROR_INVALID_EMAIL = { code: 'ERROR_INVALID_EMAIL', message: "Email is invalid" };

errorHelper.ERROR_NOT_EXIST_BRAND_CODE = { code: 'ERROR_NOT_EXIST_BRAND_CODE', message: 'Brand Code does not existed.' };
errorHelper.ERROR_NOT_EXIST_PRODUCT_CODE = { code: 'ERROR_NOT_EXIST_PRODUCT_CODE', message: 'Product Code does not existed.' };
errorHelper.ERROR_NOT_EXIST_TRANSACTION_KEY = { code: 'ERROR_NOT_EXIST_TRANSACTION_KEY', message: 'Transaction Key does not existed.' };
errorHelper.ERROR_NOT_EXIST_USER_KEY = { code: 'ERROR_NOT_EXIST_USER_KEY', message: 'User Key does not existed.' };
errorHelper.ERROR_NOT_EXIST_EMAIL = { code: 'ERROR_EMAIL', message: 'Email Account does not existed.' };

// Export
module.exports = errorHelper;
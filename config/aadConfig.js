const tenantName    = 'my_tenant';
const clientID      = 'my_app_id';
const serverPort    = 3000;

module.exports.serverPort = serverPort;

module.exports.credentials = {
  identityMetadata: `https://login.microsoftonline.com/${tenantName}.onmicrosoft.com/.well-known/openid-configuration`, 
  clientID: clientID,
  responseType: 'code id_token',
};
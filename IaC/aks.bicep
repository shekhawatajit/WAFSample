@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('Prefix string to use with resources.')
param appNamePrefix string

@description('Tag for resources should be deployed.')
param appTags object

var acrName = '${appNamePrefix}-acr'
//var aksAdminName = '${appNamePrefix}-aksadmin'

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: acrName
  tags: appTags
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: true
  }
}

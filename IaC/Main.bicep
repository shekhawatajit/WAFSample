targetScope = 'subscription'
@description('Name of the resourceGroup to create.')
param resourceGroupName string
@description('The Azure region into which the resources should be deployed.')
param resourceGroupLocation string
@description('Prefix string to use with resources.')
param appNamePrefix string

var appTags = {
  Use: 'Learning'
  Description: 'Used for Learning purpose'
}
// resource group created in target subscription
resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  tags: appTags
}

module Network 'Network.bicep' = {
  name: 'Network'
  scope: resourceGroup
  params: {
    location: resourceGroupLocation
    appNamePrefix: appNamePrefix
    appTags: appTags
  }
}

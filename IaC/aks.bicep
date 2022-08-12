@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('Prefix string to use with resources.')
param appNamePrefix string

@description('Tag for resources should be deployed.')
param appTags object

var aksCusterName = '${appNamePrefix}-akscluster'
var aksAdminName = '${appNamePrefix}-aksadmin'

resource aksCluster 'Microsoft.ContainerService/managedClusters@2021-03-01' = {
  name: aksCusterName
  tags: appTags
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    kubernetesVersion: '1.19.7'
    dnsPrefix: appNamePrefix
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: 'agentpool'
        count: 3
        vmSize: 'Standard_DS2_v2'
        osType: 'Linux'
        mode: 'System'
      }
    ]
    linuxProfile: {
      adminUsername: 'adminUserName'
      ssh: {
        publicKeys: [
          {
            keyData: 'REQUIRED'
          }
        ]
      }
    }
  }
}

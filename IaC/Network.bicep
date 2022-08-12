@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('Prefix string to use with resources.')
param appNamePrefix string

@description('Tag for resources should be deployed.')
param appTags object

var VNetName = '${appNamePrefix}-vnet'
var ParnerWebSubNetName = '${appNamePrefix}-partnersubnet'
var InternalSubNetName = '${appNamePrefix}-internalsubnet'
var APISubNetName = '${appNamePrefix}-apisubnet'
var StorageSubNetName = '${appNamePrefix}-storagesubnet'
var SQLSubNetName = '${appNamePrefix}-sqlubnet'
var LogSubNetName = '${appNamePrefix}-logubnet'
var networkWatcherName = '${appNamePrefix}-networkwatcher'

resource networkWatcher 'Microsoft.Network/networkWatchers@2022-01-01' = {
  name: networkWatcherName
  location: location
  tags: appTags
}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: VNetName
  tags: appTags
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: ParnerWebSubNetName
        properties: {
          addressPrefix: '10.0.0.0/28'
        }
      }
      {
        name: InternalSubNetName
        properties: {
          addressPrefix: '10.0.1.0/28'
        }
      }
      {
        name: APISubNetName
        properties: {
          addressPrefix: '10.0.2.0/28'
        }
      }
      {
        name: StorageSubNetName
        properties: {
          addressPrefix: '10.0.3.0/28'
        }
      }
      {
        name: SQLSubNetName
        properties: {
          addressPrefix: '10.0.4.0/28'
        }
      }
      {
        name: LogSubNetName
        properties: {
          addressPrefix: '10.0.5.0/28'
        }
      }
    ]
  }
}

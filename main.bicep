param location string = resourceGroup().location
param storageAccountName string
param contName string = 'logs'

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-05-01' = {
  name: '${storage.name}/default/${contName}'
}

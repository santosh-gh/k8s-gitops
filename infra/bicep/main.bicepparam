using 'main.bicep'

param environment =  'dev'
param projectName =  'onlinestore'
param location = 'uksouth'
param resourceInstance = '001'

// Pipeline Agents
param virtualMachineName =  'REPLACE_ME'
param virtualMachineUser =  'REPLACE_ME'
param virtualMachinePassword =  'REPLACE_ME'

// Network
param vnetAddressPrefix = '10.0.0.0/16'
param subnets = [
  {
    name: 'privateEndpoints'
    addressPrefix: '10.0.0.0/24'
  }
  {
    name: 'snet-agents'
    addressPrefix: '10.0.1.0/24'
  }
]

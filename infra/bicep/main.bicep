// Parameters
targetScope = 'subscription'

@description('Project name')
param projectName string

@description('Environment name')
param environment string

@description('Primary location for the resources')
param location string = deployment().location //uksouth

@description('Primary Resource Instance')
param resourceInstance string

// Netework parameters
param vnetAddressPrefix string
param subnets array = []

// Virtual Machine parameters
param virtualMachineName string
param virtualMachineUser string
param virtualMachinePassword string

var resourceLocator = '${projectName}-${environment}-${location}-${resourceInstance}'


// Create a resource group
resource resGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${projectName}-${environment}-${resourceInstance}'
  location: location
}

// Deploy vnet with subnets
module network 'modules/network.bicep' = {
  name: 'NetworkDeploy'
  scope: resourceGroup(resGroup.name)
  params: {
    vnetName: 'vnet-${resourceLocator}'
    location: location
    vnetAddressPrefix: vnetAddressPrefix
    subnets: subnets
  }  
}

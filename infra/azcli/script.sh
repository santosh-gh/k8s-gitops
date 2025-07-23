# Create a resource group
az group create --name myapp-rg --location eastus

# Create a container registry
az acr create --resource-group myapp-rg --name mycontainerregistry --sku Basic

# Create a Kubernetes cluster
az aks create --resource-group myapp-rg --name myapp --node-count 1 --enable-addons monitoring --generate-ssh-keys
#!/bin/bash

date
# sign in
# If you're using a local install of the CLI, you need to sign in before performing any other steps.
# az login

# List groups
# az group list -o table

# Create resource group
# An Azure resource group is a logical container 
# into which Azure resources are deployed and managed. 
# A resource group must be created before a virtual machine.
az group create --name group0 --location northeurope -o table

# List resources in the group
# az resource list -g group0 -o table

# Show group
# az group show -n group0 -o table 

# Cleanup
# az group delete --name group0 --no-wait


# If you want to wait until the deletion is complete or watch it progress, use the group wait command.
# az group wait --name group0 --deleted

# az group delete --name group0 --yes --output table --verbose

date

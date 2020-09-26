#!/bin/bash

# sign in
# If you're using a local install of the CLI, you need to sign in before performing any other steps.
# az login

# Get a list of your subscriptions 
# az account list --output table 

# List locations for your subscription
# az account list-locations -o table 

# VM sizes
# az vm list-sizes

# Images
# az vm image list --output table
# az vm image list --offer ubuntu --output table

# Create resource group
# An Azure resource group is a logical container 
# into which Azure resources are deployed and managed. 
# A resource group must be created before a virtual machine.
az group create --name group0 --location northeurope

# Create virtual machine
az vm create \
    --verbose \
    --resource-group group0 \
    --name machine0 \
    --public-ip-address-dns-name textproc0 \
    --size Standard_DS1_v2 \
    --image Canonical:UbuntuServer:18.04-LTS:latest \
    --custom-data text-processor-init.yml \
    # --admin-username azureuser \
    # --ssh-key-values @id_rsa.pub
    # --ssh-key-values AAAAB3NzaC1yc2EAAAADAQABAAABAQDB3xdd3THzfCqN86GGgSoAvI5k6dtzUKhq0QzF1FR1QQ4bIRqyszJdmi0WQyL0QyRdI5ewvYY3q4lJBAI0D1ELqqQJ/2SRxlF6w85dP7fIdQ1DfrSW7EC+ZaFnafN8Mw4wDDksqPEEuc1yJ2slFQYL94Fxv0c9yQgBxnlrFmXkCY84UmIlTtZLricES+MWw0XD6niN9CycpizZqhXSqMjw6/BgtjJtlyI6ZPNIOmRSSe/SzRo2IBNlUj3GHrgaRV/B81muaOANDJPKoB0HZdToA7MFumGC+JjOvN/aKv0BJ/xW9YkT3A2Q/UstrpQXLigKU3mXiN4kT9KPop5XGzkD
    # --generate-ssh-keys

# Open port 80 for web traffic
# Because this VM is going to run the IIS web server, you need to open port 80 to internet traffic.
# az vm open-port --port 80 --resource-group group0 --name machine0


# Get Info
# az vm show --name TutorialVM1 --resource-group TutorialResources


#  Delete VM without confirmation
# az vm delete -g group0 -n machine0 --yes

# Cleanup
# az group delete --name group0 --no-wait


# If you want to wait until the deletion is complete or watch it progress, use the group wait command.
# az group wait --name group0 --deleted

# az group delete --name group0 --yes --output table --verbose
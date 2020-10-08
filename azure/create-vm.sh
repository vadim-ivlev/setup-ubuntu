#!/bin/bash
date

# sign in
# If you're using a local install of the CLI, you need to sign in before performing any other steps.
# az login

# Get a list of your subscriptions 
# az account list --output table 

# List locations for your subscription
# az account list-locations -o table 

# VM sizes
# az vm list-sizes --location northeurope -o table

# Images
# az vm image list --output table
# az vm image list --offer ubuntu --output table

# Create resource group first by launching create-resource-group.sh
# An Azure resource group is a logical container 
# into which Azure resources are deployed and managed. 
# A resource group must be created before a virtual machine.
#az group create --name group0 --location northeurope

# Create virtual machine
az vm create \
    --resource-group group0 \
    --name machine0 \
    --public-ip-address-dns-name textproc0 \
    --image Canonical:UbuntuServer:18.04-LTS:latest \
    --custom-data text-processor-init.txt \
    --admin-username vadimivlev \
    --size Standard_D4s_v3 \
    # --size Standard_F4s_v2 \
    # --size Standard_DS1_v2 \
    # --admin-password Qq!123456789 \
    # --os-disk-size-gb 10


    # --ssh-key-values @id_rsa.pub
    # --ssh-key-values AAAAB3NzaC1yc2EAAAADAQABAAABAQDB3xdd3THzfCqN86GGgSoAvI5k6dtzUKhq0QzF1FR1QQ4bIRqyszJdmi0WQyL0QyRdI5ewvYY3q4lJBAI0D1ELqqQJ/2SRxlF6w85dP7fIdQ1DfrSW7EC+ZaFnafN8Mw4wDDksqPEEuc1yJ2slFQYL94Fxv0c9yQgBxnlrFmXkCY84UmIlTtZLricES+MWw0XD6niN9CycpizZqhXSqMjw6/BgtjJtlyI6ZPNIOmRSSe/SzRo2IBNlUj3GHrgaRV/B81muaOANDJPKoB0HZdToA7MFumGC+JjOvN/aKv0BJ/xW9YkT3A2Q/UstrpQXLigKU3mXiN4kT9KPop5XGzkD
    # --generate-ssh-keys

#  Instead of adding --custom-data text-processor-init.yml
#  we can execute bash script in order to install and run docker
# ssh textproc0.northeurope.cloudapp.azure.com 'bash -s' < install-docker.sh  

# Open port 80 for web traffic
# Because this VM is going to run the IIS web server, you need to open port 80 to internet traffic.
# az vm open-port --port 80 --resource-group group0 --name machine0


# Get Info
# az vm show --name machine0 --resource-group group0


#  Delete VM without confirmation
# az vm delete -g group0 -n machine0 --yes

# Stoping.
# It will continue to be billed. To deallocate a VM, run: az vm deallocate.
# az vm stop -n machine0 -g group0

# Deallocate
# az vm start -n machine0 -g group0

# Starting
# az vm start -n machine0 -g group0

date
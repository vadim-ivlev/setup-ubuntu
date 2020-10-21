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
# az vm list-sizes

# Images
# az vm image list --output table
# az vm image list --offer ubuntu --output table

# Create resource group first by launching create-resource-group.sh
# An Azure resource group is a logical container 
# into which Azure resources are deployed and managed. 
# A resource group must be created before a virtual machine.
#az group create --name group0 --location northeurope

# Create virtual machine
az vmss create \
    --output table \
    --resource-group group0 \
    --name machineset \
    --public-ip-address-dns-name textproc \
    --vm-sku Standard_DS1_v2 \
    --image Canonical:UbuntuServer:18.04-LTS:latest \
    --instance-count 3 \
    --custom-data text-processor-init.txt \
    --admin-username vadimivlev \
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


# Stoping.
# It will continue to be billed. To deallocate a VM, run: az vm deallocate.
# az vm stop -n machine0 -g group0

# Deallocate
# az vm deallocate -n machine0 -g group0

# Starting
# az vm start -n machine0 -g group0


#  Delete VM without confirmation
# az vm delete -g group0 -n machine0 --yes

#  Obtain the public IP address of your load balancer 
# az network public-ip show \
#   --resource-group group0 \
#   --name machinesetLBPublicIP \
#   --query '[ipAddress]' \
#   --output tsv

# View the VM instances in a scale set
az vmss list-instances \
  --resource-group group0 \
  --name machineset \
  --output table

# The first column in the output shows an InstanceId. 
# To view additional information about a specific VM instance, 
# add the --instance-id parameter to az vmss get-instance-view. 
az vmss get-instance-view \
  --resource-group group0 \
  --name machineset \
  --instance-id 1

# List connection information
# A public IP address is assigned to the load balancer that routes traffic to the individual VM instances. 
# By default, Network Address Translation (NAT) rules are added to the Azure load balancer 
# that forwards remote connection traffic to each VM on a given port. 
# To list the address and ports to connect to VM instances in a scale set, use az vmss list-instance-connection-info:
az vmss list-instance-connection-info \
  --resource-group group0 \
  --name machineset



# Change the capacity of a scale set
# When you created a scale set at the start of the tutorial, two VM instances were deployed by default. 
# You can specify the --instance-count parameter with az vmss create to change the number of instances 
# created with a scale set. To increase or decrease the number of VM instances in your existing scale set, 
# you can manually change the capacity. The scale set creates or removes the required number of VM instances, 
# then configures the load balancer to distribute traffic.
# To manually increase or decrease the number of VM instances in the scale set, use az vmss scale. The following example sets the number of VM instances in your scale set to 3:

az vmss scale \
    --resource-group group0 \
    --name machineset \
    --new-capacity 4


# To see the number of instances you now have in the scale set, use az vmss show and query on sku.capacity:
az vmss show \
    --resource-group group0 \
    --name machineset \
    --query [sku.capacity] \
    --output table

date
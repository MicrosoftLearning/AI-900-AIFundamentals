# Save your resource group name to a variable by editing the line below 
export RESOURCE_GROUP_NAME="PASTE_RESOURCE_GROUP_NAME_HERE"

# Do not edit the script below 
# Create a storage account and container
export AZURE_STORAGE_ACCOUNT="videoblobstorage"$RANDOM
export CONTAINER="videocontainer"$RANDOM
az storage account create --name $AZURE_STORAGE_ACCOUNT -g $RESOURCE_GROUP_NAME --kind StorageV2 --sku Standard_LRS
export CREDENTIALS=$(az storage account show-connection-string --name $AZURE_STORAGE_ACCOUNT -o tsv)
az storage container create --connection-string $CREDENTIALS --name $CONTAINER

# Download the JSON array of your company's video catalog 
curl https://raw.githubusercontent.com/MicrosoftDocs/mslearn-introduction-to-azure-search/master/video-catalog.json -o video-catalog.json

# Upload the JSON array of your video catalog to the blob storage account.
az storage blob upload --connection-string $CREDENTIALS --container-name $CONTAINER --file video-catalog.json --name VideoCatalog
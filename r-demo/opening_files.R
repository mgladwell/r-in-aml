library(reticulate)

# install the azureml module in the new virtual environment
#system("pip install azureml")
#system("pip install -U azureml-fsspec mltable")
system("pip install azure-ml")

library(reticulate)

# import required modules
az_identity <- import("azure.identity")
azureml <- import("azureml")
ml_client <- import("azure.ai.ml", convert = FALSE)$MLClient
azure_ml_fs <- import("azureml.fsspec", convert = FALSE)$AzureMachineLearningFileSystem

# Import the necessary modules
az_core <- import("azure.core")
az_ml <- import("azure.ml")
az_ml_auth <- import("azureml.core.authentication")

# Load the workspace from the config file
workspace <- tryCatch(
  {
    # Try to load the workspace with the default authentication method
    az_ml$Workspace$from_config()
  },
  error = function(e) {
    # If default authentication fails, use interactive authentication
    az_ml$Workspace$from_config(auth=az_ml_auth$InteractiveLoginAuthentication())
  }
)

# create an instance of the AzureMachineLearningFileSystem
azure_ml_fs <- azureml$fsspec$AzureMachineLearningFileSystem("azureml://subscriptions/s/resourcegroups/rg/workspaces/ws/datastores/ds/paths/path/folder/folder")

# list files in the path
azure_ml_fs$ls()





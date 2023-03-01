# import packages

library(readr)
library(reticulate)
azureml.fsspec <- import("azureml.fsspec")

# Azure Machine Learning workspace details
subscription <- ''
resource_group <- ''
workspace <- ''
datastore_name <- 'blob_example'
path_on_datastore <- '/iris.csv'

fs$ls()

# create filesystem object
fs <- azureml.fsspec$AzureMachineLearningFileSystem(paste0("azureml://subscriptions/", subscription, "/resourcegroups/", resource_group, "/workspaces/", workspace, "/datastores/", datastore_name, "/paths/", path_on_datastore, sep = ""))

with(fs$open("blob_example/iris.csv", "r") %as% f, {
  b <- f$read()
  x <- as.character(b, encoding = "utf-8")
  df <- read.csv(text=x, header = TRUE, sep=",")
})

print(df)

# r-in-aml
Example of R within Azure Machine Learning.

Taken from Offical Examples, but changed to be used locally for RStudio.
To use, clone, open RStudio and then run lines from cli.txt with correct aml instance

First; need to
  - Install Azure ML CLI https://learn.microsoft.com/en-us/azure/machine-learning/how-to-configure-cli?tabs=public
  - Connect to Azure Subscription, setting default Subscription, and also keep note of RG and WS
  - run "pip install -U azureml-fsspec mltable" from within RStudio
  - CLI.txt is for End to End Machine Learning, Submitting a Job
  - Opening_files.R is to access and work with Data from Blob Storage within RStudio.

---
title: Azure Batch
weight: 1
layout: single
publishdate: 2021-02-22 04:00:00 +0000
authors:
  - "Abhinav Sharma"
  - "Seqera Labs"

headline: 'Azure Batch Compute Environment'
description: 'Step-by-step instructions to set up Azure Batch in Nextflow Tower.'
menu:
  docs:
    parent: Compute Environments
    weight: 2

---
## Overview
{{% tip "Disclaimer" %}}
<!-- If you already have Batch environment pre-configured, skip Forge and go to Launch -->
This guide assumes you have an existing [Azure Account](https://azure.microsoft.com/en-us). Sign up for a free Azure account [here](https://azure.microsoft.com/en-us/free/).
{{% /tip %}}

## Azure Resources

{{% warning %}}
Follow these instructions if you have not pre-configured an Azure Batch environment. Note that this will create resources in your Azure account that you may be charged for by Azure.
{{% /warning %}}

{{% warning %}}
The Tower support for Azure Batch is currently in beta. Any feedback and suggestions is welcome.    
{{% /warning %}}

### Resource group

To create the necessary Azure Batch and Azure Storage accounts, we must first create a **Resource Group** in the region of your choice.

When you open [this link](https://portal.azure.com/#create/Microsoft.ResourceGroup) you'll notice the "Create new resource group" dialog, as shown below.

{{% pretty_screenshot img="/uploads/2021/02/azure_new_resource_group.png" %}}

**1.** Add the name for the resource group (for e.g. `towerrg`). 
<br/>
**2.** Select the preferred region for this resource group. 
<br/>
**3.** Click **Review and Create** to proceed to the review screen.
<br/>
**4.** Click **Create** to create the resources.


### Storage account

The next step is to create the necessary Azure Storage. When you open [this link](https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.Storage%2FStorageAccounts) you'll notice the "Create a storage account" dialog, as shown below.

{{% pretty_screenshot img="/uploads/2021/02/azure_create_storage_account.png" %}}


**1.** Add the name for the storage account (for e.g. `towerrgstorage`).
<br/>
**2.** Select the preferred region for this resource group.
<br/>
**3.** Click **Review and Create** to proceed to the review screen.
<br/>
**4.** Click **Create** to create the Azure Storage account.
<br/>
**5.** Next, create a Blob container within this storage account by navigating to your new storage account and clicking on **Container** as shown below.
<br/>

{{% pretty_screenshot img="/uploads/2021/02/azure_new_container.png" %}}

**6.** Create a new Blob container by clicking on the **+ Container** option and a new container dialog with open, choose a suitable name (e.g. `towerrgstorage-container`) as shown below.


{{% pretty_screenshot img="/uploads/2021/02/azure_create_blob_container.png" %}}

<br/>

**7.** Once the new Blob container is created, navigate to the **Access Keys** section of the storage account (e.g. `towerrgstorage`).

**8.** Store the access keys for the newly created Azure Storage account as shown below.
<br/>


{{% pretty_screenshot img="/uploads/2021/02/azure_storage_keys.png" %}}

### Batch account

The next step is to create the necessary Azure Storage. When you open [this link](https://portal.azure.com/#blade/HubsExtension/BrowseResource/resourceType/Microsoft.Batch%2FbatchAccounts) you'll notice the "Create a batch account" dialog, as shown below.

{{% pretty_screenshot img="/uploads/2021/02/azure_new_batch_account.png" %}}

**1.** Add the name for the storage account (for e.g. `towerrgbatch`).
<br/>
**2.** Select the preferred region for this resource group.
<br/>
**3.** Click **Review and Create** to proceed to the review screen.
<br/>
**4.** Click **Create** to create the Azure Batch account.
<br/>
**5.** Navigate to the new created batch account and click on **+ Add** within the **Pool** section as shown below.

{{% pretty_screenshot img="/uploads/2021/02/azure_new_pool.png" %}}

**6.** In the pool creation dialog, you can specify the technical specifications as per your requirements in each section such as _Operating System_ , _Container Configuration_, _VM Size_, _Scale_ etc. Please refer the screenshots below for a modestly powerful head pool configuration.

{{% pretty_screenshot img="/uploads/2021/02/azure_head_pool_1.png" %}}

<br/>

{{% pretty_screenshot img="/uploads/2021/02/azure_head_pool_2.png" %}}

<br/>

{{% tip "Head Pool VM type" %}}
The VM type availability depends on your quota. However, the `STANDARD_D2_V3` is generally available with default Batch accounts and you can use this VM type for **Head Pool**.
{{% /tip %}}

{{% pretty_screenshot img="/uploads/2021/02/azure_head_pool_3.png" %}}


**7.** Click **OK** to create the head pool and navigate to the newly created head pool (e.g. `tower-head-pool`). Next, click on the **Storage Account** section to link the Azure Batch account to an Azure Storage account.

{{% pretty_screenshot img="/uploads/2021/02/azure_storage_batch_account_link.png" %}}


**8.** Finally store the access keys, from the **Keys** section, for the newly created Azure Batch account as shown below.


{{% pretty_screenshot img="/uploads/2021/02/azure_batch_keys.png" %}}



## Tower compute environment

{{% star "Congratulations!" %}}
You have completed the Azure environment setup for Tower.
{{% /star %}}


Now we can add a new **Azure Batch** environment in the Tower UI. To create a new compute environment, follow these steps:

**1.** In the navigation bar on the upper right, choose your account name then choose **Compute environments** and select **New Environment**.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_env.png" %}}

<br/>

**2.** Enter a descriptive name for this environment. For example, *Azure Batch (east-us)* and select **Azure Batch** as the target platform.

{{% pretty_screenshot img="/uploads/2021/02/azure_new_env_name.png" %}}

<br/>

**3.** Add new credentials by selecting the **+** button. Choose a name, e.g. *tower credentials* and add the Access key and Secret key. These are the keys we saved in the previous steps when creating the Azure resources.

{{% pretty_screenshot img="/uploads/2021/02/azure_keys.png" %}}

<br/>

{{% tip "Multiple credentials" %}}
You can create multiple credentials in your Tower environment.
{{% /tip %}}

<br/>

**4.** Select a **Region**. For example *eastus (East US)*, and in the **Pipeline work directory** enter the Azure blob container we created in the previous section e.g: `az://towerrgstorage-container/work`.


{{% pretty_screenshot img="/uploads/2021/02/azure_blob_container_region.png" %}}

{{% warning %}}
The blob container should be in the same **Region** as selected above.
{{% /warning %}}

**5.** If your Azure admin has provided you with the name of and existing head pool, please add that in the **Head Pool** section.

{{% pretty_screenshot img="/uploads/2021/02/azure_head_pool.png" %}}

**6.** If you wish to let Tower automatically create additional pools as per the workload, please enable the **Auto pool mode** option.


**Advanced options**

**6.** Optionally enable **Delete jobs on completion** to delete the jobs once the workflows execution is completed.

{{% pretty_screenshot img="/uploads/2021/02/azure_advanced_options.png" %}}


**7.** Optionally, enable **Delete pools on completion** to delete the pool once the workflows execution is completed.

**8.** Optionally, specify the duration of the SAS token generated by Nextflow.

**9.** Select **Create** to finalize the compute environment setup. It will take approximately 60 seconds for all the resources to be created and then you will be ready to launch pipelines.

{{% pretty_screenshot img="/uploads/2021/02/azure_newly_created_env.png" %}}

<br/>

{{% star "Amazing!" %}}
You now have everything you need to begin deploying massively scalable pipelines.
{{% /tip %}}

Jump to the documentation section for [Launching Pipelines](/docs/launch/overview/).


{{% tip "Child pool VM type" %}}
The VM type availability depends on your account quota. However you can use the following `azure.batch.pools.auto.vmType = 'STANDARD_D2_V3'` for child pools as well while launching pipelines with Azure Batch.
{{% /tip %}}

---
title: Compute Environments Overview
headline: 'Compute Environments'
description: 'Step-by-step instructions to set up compute environments in Nextflow Tower.'
---

## Introduction

Tower uses the concept of **Compute Environments** to define the execution platform where a pipeline will run. It supports launching of pipelines into a growing number of **cloud** and **on-premise** infrastructures.

![](_images/compute_env_platforms.png)

Each compute environment must be pre-configured to enable Tower to submit tasks. You can read more on how to set up each environment using the links below.

## Setup guides

The following sections describe how to set up each of the available compute environments.

* [AWS Batch](../aws-batch/)
* [Azure Batch](../azure-batch/)
* [Google Cloud](../google-cloud/)
* [IBM LSF](../lsf/)
* [Slurm](../slurm/)
* [Grid Engine](../grid-engine/)
* [Altair PBS Pro](../altair-pbs-pro/)
* [Amazon Kubernetes (EKS)](../eks/)
* [Google Kubernetes (GKE)](../gke/)
* [Hosted Kubernetes](../k8s/)

## Select a default compute environment

If you have more than one **Compute Environment**, you can select which one will be used by default when launching a pipeline.

**1.** Navigate to your [compute environments](https://tower.nf/compute-envs).

**2.** Choose your default environment by selecting the **Make primary** button.   

!!! tip "Congratulations!" 
    You are now ready to launch pipelines with your primary compute environment.

---
title: Overview
headline: 'Compute Environments'
description: 'Step-by-step instructions to set up compute environments in Nextflow Tower.'
---

## Introduction

Tower uses the concept of **Compute Environments** to define the execution platform where a pipeline will run. It supports launching of pipelines into a growing number of **cloud** and **on-premise** infrastructures.

![](_images/compute_env_platforms.png)

Each compute environment must be pre-configured to enable Tower to submit tasks. You can read more on how to set up each environment using the links below.

## Setup guides

The following sections describe how to set up each of the available compute environments.

* [AWS Batch](/compute-envs/aws-batch/)
* [Azure Batch](/compute-envs/azure-batch/)
* [Google Cloud](/compute-envs/google-cloud/)
* [IBM LSF](/compute-envs/lsf/)
* [Slurm](/compute-envs/slurm/)
* [Grid Engine](/compute-envs/grid-engine/)
* [Altair PBS Pro](/compute-envs/altair-pbs-pro/)
* [Amazon Kubernetes (EKS)](/compute-envs/eks/)
* [Google Kubernetes (GKE)](/compute-envs/gke/)
* [Hosted Kubernetes](/compute-envs/k8s/)

## Select a default compute environment

If you have more than one **Compute Environment**, you can select which one will be used by default when launching a pipeline.

![](_images/aws_new_env.png)

**1.** Navigate to your [compute environments page](https://tower.nf/compute-envs).

![](_images/compute_env_make_primary.png)

**2.** Choose your default environment by selecting the **Make primary** button.   

!!! tip "Congratulations!" 
    You are now ready to launch pipelines with your default compute environment.

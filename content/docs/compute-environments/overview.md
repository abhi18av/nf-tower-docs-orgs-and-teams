---
title: Overview
aliases:
- "/docs/compute-environments"
weight: 1
layout: single
publishdate: 2020-10-20 04:00:00 +0000
authors:
  - "Evan Floden"
  - "Alain Coletta"
  - "Seqera Labs"

headline: 'Compute Environments'
description: 'Step-by-step instructions to setup compute environments in Nextflow Tower.'
menu:
  docs:
    parent: Compute Environments
    weight: 1
---

## Introduction

Tower uses the concept of **Compute Environments** to define the execution platform where a pipeline will run.

Tower supports launching of pipelines into **AWS Batch**, **Google Cloud**, **IBM LSF**, and **Slurm** with many more in development.

{{% pretty_screenshot img="/uploads/2020/09/compute_env_platforms.png" %}}

Each compute environment must be configured to enable Tower to submit tasks. You can read more on how to set up each environment using the links below.

## Setup guides

The following sections describe how to set up each of the available compute environments.

* [AWS Batch](/docs/compute-environments/aws-batch/)
* [Google Cloud](/docs/compute-environments/google-cloud/)
* [IBM LSF](/docs/compute-environments/lsf/)
* [Slurm](/docs/compute-environments/slurm/)

## Select a default compute environment

If you have more than one **Compute Environment**, you can select which one will be used by default when launching a pipeline.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_env.png" %}}

**1.** Navigate to your [compute environments page](https://tower.nf/compute-envs).

{{% pretty_screenshot img="/uploads/2020/10/compute_env_make_primary.png" %}}

**2.** Choose your default environment by selecting the **Make primary** button.   

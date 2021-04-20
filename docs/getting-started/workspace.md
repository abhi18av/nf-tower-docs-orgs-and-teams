---
title: Workspaces
headline: 'Workspaces Overview'
description: 'Introduction to Workspaces.'

---

# Overview

Each user has a unique workspace where they can interact and manage all resources such as workflows, compute environments and credentials.

!!! tip
    It is also possible to create multiple workspaces within an organization context and associate each of these workspaces with dedicated teams of users, while providing a fine-grained access control model for each of the teams. Please refer the [Orgs and Teams](/orgs-and-teams/overview/) section.

The core components of a workspace are described below.

## Launchpad

The **Launchpad** offers a streamlined UI for launching and managing workflows along with their associated compute environments and credentials. Using Launchpad, it is possible to create a curated set of workflows (including variations of the same workflow) which are ready to be executed on the associated compute environments, while allowing the user the option to customize the workflow level parameters if that's needed.

## Runs

The **Runs** section is used for monitoring a launched workflow with real-time execution metrics such as number of pending or completed processes. For more information please refer [Launch](/launch/overview/) section.

## Actions

It is possible to trigger pipelines based on specific events such as version release on Github or general Tower webhook. For further information please refer the [Pipeline Actions](/pipeline-actions/pipeline-actions/) section.

## Compute Environments

Tower uses the concept of **Compute Environments** to define the execution platform where a pipeline will be executed. Tower supports launching of pipelines into a growing number of cloud (Azure, AWS and GCP) and on-premise infrastructures (Slurm, IBM LSF and Grid engine etc). For further information please refer the [Compute Environments](/compute-envs/overview/) section.

## Credentials

The **Credentials** section allows users to setup the access credentials for various platforms (Github, Gitlab and BitBucket) as well as various compute environments such as cloud, Slurm  or Kubernetes credentials etc. Please refer to the [Compute Environment](/compute-envs/overview/) and [Git Integration](git/overview/) sections for instructions regarding your infrastructure.

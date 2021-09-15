---
title: Usage
headline: 'Getting started with Tower'
description: 'Choose how you want to use Tower.'

---

# Usage

You can use Tower via either the **online GUI**, using the `-with-tower` option with the **Nextflow run command**, or through the **API**.


## Via online GUI

**1.** Create an account and login into Tower, available free of charge, at [tower.nf](https://tower.nf).

**2.** Create and configure a new [compute environment](../../compute-envs/overview/).

**3.** Start [launching pipelines](../../launch/launchpad/).

## Via Nextflow run command

Create an account and login into Tower.

**1. Create a new token**

  You can access your tokens from the *Settings* drop-down menu:

![](_images/usage_create_token.png)


**2. Name your token**

![](_images/usage_name_token.png)


**3. Save your token safely**

  Copy and keep your new token in a safe place.

![](_images/usage_token.png)


**4. Export your token**

Once your token has been created, open a terminal and type:

```bash
export TOWER_ACCESS_TOKEN=eyxxxxxxxxxxxxxxxQ1ZTE=
export NXF_VER=20.10.0

```

Where `eyxxxxxxxxxxxxxxxQ1ZTE=` is the token you have just created.

!!! note "check your Nextflow version"
    Bearer token requires Nextflow version 20.10.0 or later, set with the second command above.

To submit a pipeline to a [Workspace](../../getting-started/workspace) using the Nextflow command line tool, add the workspace ID to your environment. For example

```bash
export TOWER_WORKSPACE_ID=000000000000000
```

The workspace ID can be found on the organisation's Workspaces overview page.

**5. Run Nextflow with tower**

Run your Nextflow workflows as usual with the addition of the `-with-tower` command:

```bash
nextflow run hello.nf -with-tower

```

You will see and be able to monitor your **Nextflow jobs** in Tower.

To configure and execute Nextflow jobs in **Cloud environments**, visit the [Compute environments section](../../compute-envs/overview/).

## API

To learn more about using the Tower API, visit to the [API section](../../api/overview/) in this documentation.

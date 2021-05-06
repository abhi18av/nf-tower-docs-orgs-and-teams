---
title: Launchpad
headline: 'Launchpad'
description: 'Curate and launch workflows'
---
**Launchpad** makes it is easy for any workspace user to launch a pre-configured pipeline.


![](../_images/overview_image.png)


A pipeline is a repository containing a Nextflow workflow, a compute environment and pipeline parameters.

## Pipeline Parameters Form

Launchpad automatically detects the presence of a `nextflow_schema.json` in the root of the repository and dynamically creates a form where users can easily update the parameters. This makes it trivial for users without any expertise in Nextflow to enter their pipeline parameters and launch.

![](_images/launch_rnaseq_nextflow_schema.png)


## Adding a New Pipeline

Adding a pipeline to the workspace launchpad is similar to the [Launch](../launch) except instead of launching the pipeline it gets added to the list of pipelines with the pre-saved values of fields such as the pipeline parameters and the revision number.

!!! tip 
    To create your own customized Nextflow Schema for your pipleine, see the examples of from increasing number of `nf-core` workflows that have adopted this for example [eager](https://github.com/nf-core/eager/blob/2.3.3/nextflow_schema.json) and [rnaseq](https://github.com/nf-core/rnaseq/blob/3.0/nextflow_schema.json). 



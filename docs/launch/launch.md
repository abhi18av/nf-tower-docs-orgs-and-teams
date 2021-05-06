---
title: Launch Form
headline: 'Pipeline Execution'
description: 'Guide to launching pipelines using Nextflow Tower.'
---

The **Launch Form** can be used fo launching pipelines and for creating pipelines for the **Launchpad**.

Consider launching the *nf-core/rnaseq* workflow using a Google Cloud compute environment.

To launch a pipeline:

**1.** Select the **Launch** button in the navigation bar.

The **Launch Form** view will appear.

**2.** Select the drop down menu to choose a [**Compute Environment**](../../compute-envs/overview).  

!!! warning 
    See the [**Compute Environment**](../../compute-envs/overview/) documentation to learn how to create an environment for your preferred executor environment.

**3.** Enter the repository of the **Pipeline to launch**.  
*For example https://github.com/nf-core/rnaseq.git*.

**4.** A **Revision number** can be used select different versions of pipeline.  
*The Git default branch (main/master) or `manifest.defaultBranch` in the Nextflow configuration will be used by default.*

**5.** The **Work directory** specifies the location of the Nextflow work directory.  
*The location associated with the compute environment will be selected by default.*

**6.** Enter the name(s) of each of the Nextflow **Config profiles** followed by the `Enter` key.  
*See the Nextflow [Config profiles](https://www.nextflow.io/docs/latest/config.html#config-profiles) documentation for more details.*

**7.** Enter any **Pipeline parameters** in YAML or JSON format.
*YAML example:*

```yaml
    reads: 's3://nf-bucket/exome-data/ERR013140_{1,2}.fastq.bz2'  
    paired_end: true
```

**8.** Select *Launch* to begin the pipeline execution.

!!! tip 
    Nextflow pipelines are simply Git repositories and the location can be any public or private Git-hosting platform. See [**Git Integration**](../../git/overview/) in the Tower docs and [**Pipeline Sharing**](https://www.nextflow.io/docs/latest/sharing.html) in the Nextflow docs for more details.

!!! warning 
    The credentials associated with the compute environment must be able to access the work directory.

!!! tip 
    In the configuration, the full path to a bucket must be specified with single-quotes around strings no quotes around booleans or numbers.

---
title: Launch overview
headline: 'Pipeline Execution'
description: 'Guide to launching pipelines using Nextflow Tower.'
---

!!! warning 
    See the [**Compute Environment**](/compute-envs/overview/) documentation to learn how to create an environment for your preferred executor environment.


In the following example we will launch the nf-core RNASeq pipeline using a Google Cloud compute environment we have previously set up.

To launch a pipeline:

**1.** Select the **Launch** button in the navigation bar.

![](_images/launch_button.png)

The **Launch Pipeline** dialog will appear.

**2.** Select the drop down menu to choose a [**Compute Environment**](/compute-envs/overview).  

*The users primary compute environment is selected by default.*

![](_images/launch_RNASeq.png)


**3.** Enter the repository of the **Pipeline to launch**.  
*For example https://github.com/nf-core/rnaseq.git*.

**4.** A **Revision number** can be used select different versions of pipeline.  
*The Git default branch (main/master) or `manifest.defaultBranch` in the Nextflow configuration will be used by default.*

**5.** The **Work directory** specifies the location of the Nextflow work directory.  
*The location associated with the compute environment will be selected by default.*

**6.** Enter the name(s) of each of the Nextflow **Config profiles** followed by the `Enter` key.  
*See the Nextflow [Config profiles](https://www.nextflow.io/docs/latest/config.html?highlight=profiles#config-profiles) documentation for more details.*

**7.** Enter any **Pipeline parameters** in YAML or JSON format.
*YAML example:*

```yaml
    reads: 's3://nf-bucket/exome-data/ERR013140_{1,2}.fastq.bz2'  
    paired_end: true
```

**8.** Select *Launch* to begin the pipeline execution.

!!! tip 
    Nextflow pipelines are simply Git repositories and the location can be any public or private Git-hosting platform. See [**Git Integration**](/git/overview/) in the Tower docs and [**Pipeline Sharing**](https://www.nextflow.io/docs/latest/sharing.html) in the Nextflow docs for more details.

!!! warning 
    The credentials associated with the compute environment must be able to access the work directory.

!!! tip 
    In the configuration, the full path to a bucket must be specified with single-quotes around strings no quotes around booleans or numbers.

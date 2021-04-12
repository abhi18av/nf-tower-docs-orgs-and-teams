---
title: Dashboard overview
headline: 'Monitoring Pipelines'
description: 'Guide to monitoring Nextflow pipelines executed through Tower.'
---

## Navigation bar

Jobs that have been submitted with Tower can be monitored wherever you have an internet connection. 

The **navigation bar** contains all previous jobs executions. Each new or resumed job will be given a random name e.g: `grave_williams`.

![](/assets/images/2020/10/monitoring_overview.png)


In the left bar:

  - **Blue** are running.
  - **Green** are successfully executed.
  - **Yellow** are successfully executed where some tasks failed.
  - **Red** are jobs where at least one task fully failed.
  - **Grey** are jobs that where forced to stop during execution.

  Selecting a run on the left panel will display the job execution details.

## Search

The search box enables searching for runs and pipelines by name. 

Use asterisks `✽` before and after keyword to filter results.

![](/assets/images/2020/10/monitoring_search.png)


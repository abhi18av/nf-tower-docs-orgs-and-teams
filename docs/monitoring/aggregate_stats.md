---
title: Aggregate stats & load
headline: 'Aggregate stats and resources'
description: 'Statistics and resources usage of Nextflow pipelines executed through Tower.'
---

## Aggregate Stats

The **Aggregate stats** panel displays a real-time summary of the resources used by the workflow. These include total running time ('wall time'), aggregated CPU time (CPU hours), memory usage (GB hours), data i/o and cost.

![](_images/monitoring_aggregate_stats.png)

The cost is only based on estimated computation usage and does not currently take into account storage or associated network costs. Tower has a database of costs for all cloud instances of AWS and Google Cloud in all regions and zones.


## Load and Utilization

As processes are being submitted to the compute environment, the **Load** monitors how many cores and tasks are currently being used. 

**Utilization** is calculated for memory and CPUs. This is the average value across all tasks and is calculated by dividing the memory (or CPUs) usage by the memory (or CPUs) requested.

![](_images/monitoring_load.png)


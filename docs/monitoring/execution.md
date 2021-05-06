---
title: Execution details & logs
headline: 'Monitoring & Logs'
description: 'Monitoring a Nextflow pipeline executed through Tower.'
---

Selecting a pipeline on the navigation bar will display the workflow details in the main monitoring panel. The main window contains:

* [Execution section](#run-information) with command-line, parameters, configuration, and execution logs in real-time.
* [Summary](../summary/) and [status section](../summary/).
* List of pipeline [processes](../processes/).
* Aggregated [stats](../aggregate_stats/) and [load](../aggregate_stats/#load-and-utilization).
* Detailed list of [individual tasks](../tasks/#task-table) and [metrics](../tasks/#resource-metrics).

## Run information

This top section is composed of 4 tabs containing details about the Nextflow execution:

**1.** The Nextflow **Command line** to execute the job.

**2.** **Parameters** including all parameters given in the arguments and arguments taken from the configuration `profiles` in the `params` scope.

**3.** **Configuration** contains all the information included in the configuration file including parameters.

**4.** The **Execution log** tab is updated in real time with the logs from the main Nextflow process.

![](_images/monitoring_exec_log.png)


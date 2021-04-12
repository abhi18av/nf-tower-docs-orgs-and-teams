---
title: Sharing pipelines
headline: "Sharing and collaborators"
description: 'Sharing and collaborating on Nextflow pipelines with Nextflow Tower.'
---

To share a pipeline execution with a collaborator, select the **Sharing** icon from the main monitoring panel.

![](/assets/images/2020/10/monitoring_sharing1.png)


Select the **Add Collaborator** button, add your collaborator's email or Tower login and click **Confirm**.

![](/assets/images/2020/10/monitoring_sharing2.png)


An email with the pipeline URL will be sent to the collaborator.

![](/assets/images/2020/10/monitoring_sharing3.png)


!!! warning 
    Your collaborator's Tower account email must match the email where you sent the invite.

Once shared, the pipeline execution is visible in the user's navigation panel with the launchers name shown.

It is important to ensure your collaborators have permissions to your compute resources to make the most of this feature. For example, information in a cloud bucket such as task logs will only be visible if the collaborator also has access to that bucket.



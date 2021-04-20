---
title: Teams 
headline: 'Teams'
description: 'Create and manage teams for an organization.'
---

**Organization workspaces** builds upon the functionality of a **User Workspace** as discussed in the [Getting Started](/getting-started/workspace/) section, since they add the ability to fine-tune the access level for any particular member, collaborator or team with respect to the associate credential and compute environment resources.

In an **organization workspaces** a participant would be a member of the parent organization, a collaborator or an entire team.

## Participant permissions

Nextflow Tower further allows the organization owners to assign a distinct access level within an organization workspace to all the **Participants** of the workspace.

!!! tip
    It is possible to add the collaborator or member in groups via the addition of the team name.

There are five access levels available for every workspace participant.

1. **Owner**: The participant have full permissions on any resources within the organization associated with the workspace.

2. **Admin**: The participant have full permission on the resources associated with the workspace. Therefore they can create/modify/delete Pipelines, Compute environments, Actions, Credentials. They can add/remove users to the workspace, but cannot create a new workspace or modify another workspace.

3. **Maintain**: The participant can launch pipeline and modify pipeline executions (e.g. can change the pipeline launch compute env, parameters, pre/post-run scripts, nextflow config) and create new pipeline configuration in the Launchpad. The users cannot modify Compute env settings and Credentials.

4. **Launch**: The participant can launch pipeline executions and modify the pipeline input/output parameters. They cannot modify the launch configuration and other resources.

5. **View**: The participant can only access to the team resources in read-only mode.

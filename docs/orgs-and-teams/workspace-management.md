---
title: Workspace Management  
headline: 'Workspace Management'
description: 'Manage users and teams for an organization.'
---

**Organization workspaces** builds upon the functionality of a [User Workspace](/getting-started/workspace/) section, and adds the ability to fine-tune the access level for any particular member, collaborator or team with respect to the associated credentials and compute environment resources. This is achieved using the concept of **Participants** in the **organization workspaces**. 

!!! note
    A participant could be a **member** of the parent organization of that workspace or could be a **collaborator** only for that workspace within that organization.

### Create a new workspace

To create a new workspace within an organization, please follow these steps

1. Go to the **Workspaces** tab of the organization menu.
2. Click on **Create workspace**.
3. Enter the **Name** and **Full name** of the workspace.
4. Optionally, add the **Description** of the workspace.
5. Click on **Open** for the newly created workspace.

!!!tip
   It is possible to change the values of the optional fields either using the **Edit** option on the workspace listing for an organization or using the **Settings** tab within the workspace page, provided that you're the **Owner** of the workspace. 

Apart from the **Participants** tab, the **organization workspace** is similar to the **user workspace** therefore, the familiar concepts of [Runs](../../launch/overview/), [Pipeline Actions](../../pipeline-actions/pipeline-actions/), [Compute Environments](../../compute-envs/overview/) and [Credentials](../../getting-started/workspace#credentials) are applicable.

### Add a new Participant

To create a new team within an organization, please follow these steps

1. Go to the **Participants** tab of the organization menu.
2. Click on **Add participant**.
3. Enter the **Name** of new participant. 
4. Optionally, update the **role** associated with the participant of the organization members or collaborators. For more information on **roles**, please refer the [participant roles](#participant-roles) section.

!!! tip
    A new workspace participant could be either an existing organization member, collaborator, team or a new user.
    
### Participant roles

Nextflow Tower further allows the organization owners to assign a distinct access level within an organization workspace to all the **participants** of the workspace.

!!! hint
    It is also possible to group **members** and **collaborators** into **teams** and apply a role to that team.

There are five roles available for every workspace participant.

1. **Owner**: The participant have full permissions on any resources within the organization associated with the workspace.

2. **Admin**: The participant have full permission on the resources associated with the workspace. Therefore they can create/modify/delete Pipelines, Compute environments, Actions, Credentials. They can add/remove users to the workspace, but cannot create a new workspace or modify another workspace.

3. **Maintain**: The participant can launch pipeline and modify pipeline executions (e.g. can change the pipeline launch compute env, parameters, pre/post-run scripts, nextflow config) and create new pipeline configuration in the Launchpad. The users cannot modify Compute env settings and Credentials.

4. **Launch**: The participant can launch pipeline executions and modify the pipeline input/output parameters. They cannot modify the launch configuration and other resources.

5. **View**: The participant can only access to the team resources in read-only mode.


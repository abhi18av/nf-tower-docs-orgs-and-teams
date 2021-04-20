---
title: Orgs and Teams Overview
headline: 'Orgs and Teams'
description: 'Create and manage teams and resources for an organization.'
---

# Overview

!!! note 
    This feature is only available after version **21.04.0-TODO** of Nextflow Tower.

Nextflow Tower simplifies the development and execution of workflows by providing a centralized interface to manage people (users and teams) and resources (credentials, compute environments etc) while allowing the users to curate a list of ready to launch workflows at an organizational level. 

This is achieved through the context of workspaces, to learn more about workspaces, please refer the [Workspaces](/getting-started/workspaces/) section. Each user has their own private workspace, however each organization can create multiple workspaces and invite users as **collaborators** or **members**.

## Organizations

Tower allows creation of multiple organizations, each of which can contain multiple workspaces with shared teams and resources.
This allows any organization to essentially customize and organize the usage of resources while maintaining an access control layers for users associated with a workspace.

For further information, please refer the [Organization](/orgs-and-teams/organizations/) section.

## Users and Teams

Any user who has for a Tower instance (public or private) can be added or removed from a particular organization or a workspace and could be allocated a specific access role within that workspace. 

The Teams feature provides a way for the organizations to group various users and participants together into teams, for example `workflow_developers` or `workflow_users`, and apply access control to all the users within this team as a whole.

For further information, please refer the [Teams](/orgs-and-teams/teams/) section.

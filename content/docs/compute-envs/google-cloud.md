---
title: Google Cloud
weight: 1
layout: single
publishdate: 2020-10-20 04:00:00 +0000
authors:
  - "Evan Floden"
  - "Alain Coletta"
  - "Seqera Labs"

headline: 'Google Cloud Compute Environments'
description: 'Step-by-step instructions to setup Google Cloud for Nextflow Tower.'
menu:
  docs:
    parent: Compute Environments
    weight: 3

---
---
{{% tip "Requirements" %}}
This guide assumes you have an existing [Google Cloud Account](https://console.cloud.google.com). Sign-up for a free account [here](https://cloud.google.com/).
{{% /tip %}}

## Cloud Life Sciences

Tower provides integration to Google Cloud via the [Cloud Life Sciences API](https://cloud.google.com/life-sciences/docs/reference/rest).

The guide will begin with configuring your Google Cloud account and enabling the Google Life Sciences API. It will then guide you through creating a new Google Cloud compute environment in Tower.

## Project configuration

If you do not already have one, the first Step is to create a Google Cloud project.

**1.** Navigate to the [Google Project Selector page](https://console.cloud.google.com/projectselector2) and select **CREATE PROJECT**.

{{% pretty_screenshot img="/uploads/2020/09/google_create_project.png" %}}

<br>

**2.** Enter a name for your project e.g: "tower-nf", the organization and location will be set by default to your current account setup.

**3.** Before enabling the **Google Life Sciences** API, make sure that billing is enabled for the project. In the project page select the Navigation menu from the top left of the page and select **Billing**. You can follow the instructions [here](https://cloud.google.com/billing/docs/how-to/modify-project) to enable billing.

**4.** To enable the **Google Life Sciences API**, open this [link](https://console.cloud.google.com/flows/enableapi?apiid=lifesciences.googleapis.com%2Ccompute.googleapis.com%2Cstorage-api.googleapis.com), select the project and press **Continue**.

**5.** Create a Google Storage bucket in the project by opening the navigation menu and selecting **Storage** followed by **Create Bucket**.

{{% pretty_screenshot img="/uploads/2020/09/google_storage.png" %}}

<br>

**6.** Enter a name for your bucket.

{{% pretty_screenshot img="/uploads/2020/09/google_name_bucket.png" %}}

{{% warning "Bucket Naming - No underscores _ !"%}}
Avoid underscores in your bucket name and use hyphens instead.   
{{% /warning %}}

<br>

**6.** Select a **Location type** (Region) and the **Location** where you want to create the bucket.

{{% pretty_screenshot img="/uploads/2020/09/google_location.png" %}}

{{% tip %}}
The Google Cloud Life Sciences API is available in limited number of [locations](https://cloud.google.com/life-sciences/docs/concepts/locations), however, these locations are only used to store metadata about the pipeline operations. The location of the storage bucket and compute resources can be in any region.
{{% /tip %}}

## Service account

Next we need to create a service account.

**1.** In the Navigation bar, Click **IAM** and **Service Account**.

{{% pretty_screenshot img="/uploads/2020/09/google_select_service_accounts.png" %}}

<br>

**2.** Select **+ CREATE SERVICE ACCOUNT**. Choose a name and a description and click **CREATE**.

{{% pretty_screenshot img="/uploads/2020/09/google_service_account_name.png" %}}

<br>

**3.** In step 2: **Grant this service account access to project (optional)**  Set the role to _Editor_ and click **CONTINUE**, in step 3: **Grant users access to this service account (optional)** leave all options empty and select **CREATE**.

{{% pretty_screenshot img="/uploads/2020/09/google_service_account_role.png" %}}

<br>

**4.** Select the newly created **Service account**, click **⠇** in the **Actions** column, and **Create key**.

{{% pretty_screenshot img="/uploads/2020/09/google_create_key.png" %}}

<br>

**5.** Select the JSON format and click **CREATE**. This will download a JSON file with your credentials.

{{% pretty_screenshot img="/uploads/2020/09/google_key_json.png" %}}

<br>

{{% star "Sweet!" %}}
You have created a project, enabled Google Life Sciences API, created a bucket and a JSON file containing required credentials. We are now ready to set up a new compute environment in Tower.
{{% /star %}}

## Compute environment

To create a new compute environment for Google Cloud in Tower:

**1.** In the navigation bar on the upper right, choose your profile then choose **Compute environments**. Select **New Environment**.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_env.png" %}}

<br>

**2.** Enter a name for this environment. For example "Google Cloud Life Sciences (europe-west2)" and select **Google Life Sciences** as the target platform.

{{% pretty_screenshot img="/uploads/2020/09/google_new_env.png" %}}

<br>

**3.** Select the **+** sign to add new credentials. Name your credentials and copy-paste the contents from the JSON file above.

{{% pretty_screenshot img="/uploads/2020/09/google_tower_credentials.png" %}}

<br>

**4.** Select the **Region** (e.g. *europe-west2*) that should be in the same location as the bucket created above.

**5.** You can leave the **Location** empty and Google will run the Life Sciences API Service in the closest available location.

**6.** Enter the bucket location in the **Pipeline work directory** e.g. *gs://nf-tower-bucket*.

**7.** All other options can remain empty.

**8.** Select **Create** to finalize the creation of the compute environment.

{{% pretty_screenshot img="/uploads/2020/09/google_tower_location.png" %}}

<br>

{{% star "Ace!" %}}
Time to start launching pipelines in your cloud.
{{% /star %}}

Jump to the documentation section for [Launching Pipelines](/docs/launch/overview/).

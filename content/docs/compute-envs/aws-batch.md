---
title: AWS Batch
weight: 1
layout: single
publishdate: 2020-10-20 04:00:00 +0000
authors:
  - "Evan Floden"
  - "Alain Coletta"
  - "Seqera Labs"

headline: 'AWS Batch Compute Environments'
description: 'Step-by-step instructions to setup AWS Batch in Nextflow Tower.'
menu:
  docs:
    parent: Compute Environments
    weight: 2

---
## Overview
{{% tip "Disclaimer" %}}
<!-- If you already have Batch environment pre-configured skip Forge and go to Launch -->
This guide assumes you have an existing [AWS Account](https://aws.amazon.com/). Sign up for a free AWS account [here](https://portal.aws.amazon.com/billing/signup).
{{% /tip %}}

There are two ways of creating a **Compute Environment** for **AWS Batch** with Tower.

1. **Tower Forge** for AWS Batch automatically creates AWS Batch resources in your AWS account.

2. **Tower Launch** allows you to create a compute environment using existing AWS Batch resources.

If you don't yet have an AWS Batch environment fully set-up, the [Tower Forge](#forge) guide is suggested. If you have been provided with an AWS Batch queue from your account administrator, or if you have setup AWS Batch previously, follow the [Tower Launch](#manual) guide.

## Forge

<!-- Add explanation for what is Forge and disclaimer -->
{{% warning %}}
Follow these instructions if you have not pre-configured an AWS Batch environment. This will create resources in your AWS account that you may be charged for by Amazon.
{{% /warning %}}

Tower Forge automates the configuration of an [AWS Batch](https://aws.amazon.com/batch/) compute environment and queues required for the deployment of Nextflow pipelines.

## Forge AWS Resources

### IAM User Permissions

To use the Tower Forge feature, Tower requires an IAM user with the permissions listed in this [policy file](https://github.com/seqeralabs/nf-tower-aws/blob/master/forge/forge-policy.json). These permissions are more permissive that the ones required to only launch a pipeline as Tower needs to create AWS resources on your behalf.

The steps below will guide you through the creation a new IAM user for Tower and attach the required policy for the newly created user.

**1.** Open the [AWS IAM console](https://console.aws.amazon.com/iam), select **Users** on the left menu and click the **Add User** button on top.

{{% pretty_screenshot img="/uploads/2020/09/aws_aim_new_user.png" %}}

<br>

**2.** Enter a name for your user (e.g. `tower`) and choose the **Programmatic access** type. Then select the **Next: Permissions** button.

**3.** In the following steps, click on the **Next: Tags** button, **Next: Review** and **Create User**.

**4.** Save the **Access key ID** and **Secret access key** in a secure location. We will use these in the [next section](#forge-compute-environment). Press the **Close** button.

{{% pretty_screenshot img="/uploads/2020/09/aws_user_created.png" %}}

<br>

{{% tip %}}
Note the user has now been created but has not yet been granted any permissions.
{{% /tip %}}

</br>

**5.** Back in the users table, select the newly created user and click **+ Add inline policy**.

{{% pretty_screenshot img="/uploads/2020/09/aws_add_inline_policy.png" %}}

</br>

**6.** Choose JSON and copy the content of the [policy linked above](https://github.com/seqeralabs/nf-tower-aws/blob/master/forge/forge-policy.json).

{{% pretty_screenshot img="/uploads/2020/09/aws_review_policy.png" %}}

</br>

**7.** Select the **Review policy** button, name your policy (e.g. `tower-forge-policy`), and confirm the operation by clicking on the **Create policy** button.

{{% tip "What permissions are required?" %}}
This policy includes the minimal permissions required to allow the user to submit jobs to AWS Batch, gather the container execution metadata, read CloudWatch logs and access data from the S3 bucket in your AWS account in read-only mode.
{{% /tip %}}


### Creating an S3 Bucket for Storage

Next up we need to create an **S3 Bucket** to access files and store results for our pipelines. S3 stands for Simple Storage Service and is a type of **object storage**.

We must grant our new Tower IAM user access to this bucket.

**1.** Navigate to the [S3 service](https://console.aws.amazon.com/s3/home) and select **Create New Bucket**.

**2.** Enter a unique name for your Bucket and select a region.

{{% pretty_screenshot img="/uploads/2020/09/aws_create_bucket.png" %}}

{{% warning "Which AWS region should I use?" %}}
The region of the bucket should be in the same region as the compute environment which we will set in the next section. Typically users select a region closest to their physical location but Tower Forge supports creating resources in any of the available AWS regions.
{{% /warning %}}

<br>

**3.** Select the default options for **Configure options**.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_bucket_configure_options.png" %}}

<br>

**5.** Select the default options for **Set permissions**.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_bucket_set_permissions.png" %}}

<br>

**6.** Review the bucket and select **Create bucket**.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_bucket_review.png" %}}

<br>

{{% warning "S3 Storage Costs" %}}
S3 is used by Nextflow for the storage of intermediary files. For production
pipelines, this can amount to a large quantity of data. To reduce costs, when configuring a bucket, users should consider management options such as the ability to automatically delete these files after 30 days.
{{% /tip %}}

<br>


## Forge compute environment

{{% star "Congratulations!" %}}
You have completed the AWS environment setup for Tower.
{{% /star %}}


Now we can add a new **AWS Batch** environment in the Tower UI. To create a new compute environment, follow these steps:

**1.** In the navigation bar on the upper right, choose your account name then choose **Compute environments** and select **New Environment**.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_env.png" %}}

</br>

**2.** Enter a descriptive name for this environment, for example *AWS Batch Spot (eu-west-1)* and select **Amazon Batch** as the target platform.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_env_name.png" %}}

</br>

**3.** Add new credentials by selecting the the **+** button. Choose a name, e.g. *AWS Credentials* and add the Access key and Secret key. These are the keys we saved in the previous steps when creating the AWS IAM user.

{{% pretty_screenshot img="/uploads/2020/09/aws_keys.png" %}}

{{% tip "Multiple credentials" %}}
You can create multiple credentials in your Tower environment.
{{% /tip %}}

<br>

**4.** Select a **Region**, for example *eu-west-1 - Europe (Ireland)*, and in the **Pipeline work directory** enter the S3 bucket we created in the previous section e.g: `s3://unique-tower-bucket`.

**5.** Select **Batch Forge** as the **Config Mode**.

{{% pretty_screenshot img="/uploads/2020/09/aws_s3_bucket_region.png" %}}

{{% warning %}}
The bucket should be in the same **Region** as selected above.
{{% /warning %}}

<br>

**6.** Choose a **Provisioning model**. In most cases this will be *Spot*.

**7.** Enter the **Min CPUs**. When this is set to greater than `0`, EC2 instances will remain active and you will be billed regardless of if you are running workloads. The advantages of setting a minimum number of CPUs greater than `0` is that a pipeline execution will initialize faster.

**8.** Enter the **Max CPUs** e.g. `64`.

**9.** Choose **EBS Auto scale** to allow the EC2 virtual machines to expand the amount of available disk space during the task execution.

**10.** Choose **Enable GPUs** to allow the deployment of GPU enabled EC2 virtual machines.

**11.** Enter any additional **Allowed S3 buckets** that your workflows require to access input data or to write output files. The **Pipeline work directory** bucket above is added by default to the list of **Allowed S3 buckets**.

**12.** Optionally select **FSx** for Lustre. This attaches a file system to each EC2 instance. This eliminates the need to transfer data between S3 and the instance and can provide significant performance advantages.

If using **FSx** enter `/fsx` as the **FSx mount path** and then, the **Pipeline work directory** above should be set as `/fsx/work`

{{% pretty_screenshot img="/uploads/2020/11/aws_lustre_options.png" %}}

**13.** Choose the **Dispose resources** option.

{{% pretty_screenshot img="/uploads/2020/09/aws_cpus.png" %}}

{{% tip "Spot or On-demand?" %}}
You can choose to create a compute environment that will launch either **Spot** or **On-demand** instances. Spot instances can cost as little as 20% of on-demand instances and with Nextflow ability to automatically relaunch failed tasks, Spot is almost always the recommended provisioning model. It is important to note that when selecting Spot, Tower Forge will create two queues in your AWS environment. The first or **Head queue** will be on-demand and used for the Nextflow runtime job. The second or **Compute queue** will be used for pipeline tasks.
{{% /tip %}}

<br>

**14.** Select **Create** to finalize the compute environment setup. It will take approximately 60 seconds for all the resources to be created and after this you will be ready to launch pipelines.

{{% pretty_screenshot img="/uploads/2020/09/aws_60s_new_env.png" %}}

<br>

{{% star "Amazing!" %}}
You now have everything to begin deploying massively scalable pipelines.
{{% /tip %}}

Jump to the documentation section for [Launching Pipelines](/docs/launch/overview/).


## Manual

This section is for users with a pre-configured AWS environment. You will need a Batch queue, Batch compute environment, an IAM user and an S3 bucket already set up.

To enable Tower within your existing AWS configuration, you need to have an IAM user with the following IAM permissions:

- `AmazonS3ReadOnlyAccess`
- `AmazonEC2ContainerRegistryReadOnly`
- `CloudWatchLogsReadOnlyAccess`
- The following [custom policy](https://github.com/seqeralabs/nf-tower-aws/blob/master/launch/launch-policy.json) to grant the ability to submit and control Batch jobs.
- Write access to any S3 bucket used pipeline work directories with the following [policy template](https://github.com/seqeralabs/nf-tower-aws/blob/master/launch/s3-bucket-write.json). See [below for details](#access-to-s3-buckets)

With theses permissions, we can add a new **AWS Batch** environment in the [Tower UI](#launch-compute-environment)

## Manual compute environment
To create a new compute environment for AWS Batch (Manual):

**1.** In the navigation bar on the upper right, choose your account name then choose "Compute environments" and select on **New Environment**.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_env.png" %}}

<br>

**2.** Choose a descriptive name for this environment. For example "AWS Batch Launch (eu-west-1)" and Select **Amazon Batch** as the target platform

{{% pretty_screenshot img="/uploads/2020/09/aws_new_launch_env.png" %}}

<br>

**3.** Add new credentials by clicking the the "+" button. Choose a name, add the **Access key** and **Secret key** from your IAM user.

{{% pretty_screenshot img="/uploads/2020/09/aws_keys.png" %}}

{{% tip "Multiple credentials" %}}
You can create multiple credentials in your Tower environment. See the section **Credentials Management**.
{{% /tip %}}

<br>

**4.** Select a region, for example "eu-west-1 - Europe (Ireland)"

**5.** Enter an S3 bucket path, For example "s3://tower-bucket"

**6.** the **Manual** config mode.

**7.** Enter the **Head queue** which is the name of the AWS Batch queue that the Nextflow runtime application will run and a **Compute queue** which is the name of the AWS Batch queue that tasks will be submitted to.

**8.** Select **Create** to finalize the compute environment setup.

{{% pretty_screenshot img="/uploads/2020/09/aws_new_env_manual_config.png" %}}

<br>

{{% star "Awesome!" %}}
You now have created a compute environment.
{{% /tip %}}

### Access to S3 Buckets

Tower can use S3 to access data, create work directories and write outputs. The IAM user above needs permissions to use these S3 Buckets. We can set a policy for our IAM user that provides the permission to access specific buckets.

**1.** Access the IAM User table in the [IAM service](https://console.aws.amazon.com/iam/home)

**2.** Select the IAM user.

**3.** Select **+ add inline policy**.

{{% pretty_screenshot img="/uploads/2020/09/aws_user_s3_inline_policy.png" %}}

<br>

**4.** Select JSON and copy the contents of [this policy](https://github.com/seqeralabs/nf-tower-aws/blob/master/launch/s3-bucket-write.json). Replace lines 10 and 21 with your bucket name.

{{% pretty_screenshot img="/uploads/2020/09/aws_s3_policy.png" %}}

<br>

**5.** Name your policy and click **Create policy**.

{{% pretty_screenshot img="/uploads/2020/09/aws_name_policy.png" %}}

{{% star "Amazing!" %}}
You now have everything to begin deploying massively scalable pipelines.
{{% /tip %}}

Jump to the documentation section for [Launching Pipelines](/docs/launch/overview/).

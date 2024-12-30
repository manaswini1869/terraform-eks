# terraform-eks

# Example Screenshots

![terraform plan](/assets/Screenshot%20(23).png)


![terraform apply](/assets/Screenshot%20(24).png)


![eks cluster](/assets/Screenshot%20(25).png)

# Create EKS Cluster on AWS with Terraform

This repository contains the necessary configuration and steps to provision an Amazon EKS (Elastic Kubernetes Service) cluster using Terraform. The instructions below will guide you through the installation of the required tools and the process of creating an EKS cluster in your AWS account.

## Prerequisites

Before you begin, make sure you have the following installed:

1. **AWS CLI**
2. **Terraform**

### Step 1: Install AWS CLI

To interact with AWS services via the command line, you'll need to install the AWS CLI. This is an essential tool to configure your AWS credentials and enable Terraform to interact with AWS resources.

Follow the official AWS documentation to install the AWS CLI:

[Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### Step 2: Install Terraform

Terraform is the tool that will be used to manage infrastructure as code. To get started, you'll need to install Terraform on your local machine.

Follow the official guide to install Terraform:

[Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Step 3: Configure AWS CLI

Once AWS CLI is installed, configure it to connect with your AWS account. This step involves setting up your AWS credentials.

Run the following command:

```bash
aws configure
```

You will be prompted to enter your AWS Access Key, Secret Key, region, and output format.

### Step 4: Initialize Terraform

Clone the repository to your local machine and initialize the Terraform environment:

```bash
git clone <repository-url>
cd <repository-folder>
terraform init
```

This command will install the necessary providers and modules required to set up the infrastructure.

### Step 5: Review the Terraform Plan (Optional)

It’s a good idea to review what Terraform plans to do before applying the changes. To see the execution plan, run:

```bash
terraform plan
```

This will show you an overview of the resources that will be created, modified, or destroyed.

### Step 6: Deploy the EKS Cluster

Once you’re comfortable with the plan, apply the configuration to provision your EKS cluster and the associated VPC:

```bash
terraform apply
```

You will be prompted to confirm the action. Type `yes` to proceed.

### Step 7: Verify the EKS Cluster

After the Terraform process is complete, your EKS cluster should be up and running. You can verify the cluster by using the `aws eks` CLI command or by logging into the AWS Management Console.

To get the Kubernetes config to interact with your EKS cluster, you can run:

```bash
aws eks --region <your-region> update-kubeconfig --name <cluster-name>
```

You can now use `kubectl` to interact with your newly created EKS cluster.

---

## Clean Up

When you're done, you can destroy the resources created by Terraform to avoid incurring additional costs:

```bash
terraform destroy
```

You will be prompted to confirm. Type `yes` to delete all resources.

---

## Notes

- Ensure that your AWS credentials are properly configured before running the Terraform commands.
- The Terraform configuration includes a VPC, subnets, security groups, IAM roles, and the EKS cluster. You can customize these resources by modifying the Terraform files.
- The AWS region can be adjusted by modifying the `provider` block in the Terraform configuration.

---

With these steps, you should have a fully functioning EKS cluster running on AWS. Happy coding!

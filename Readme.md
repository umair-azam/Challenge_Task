# Galactic Mission Control Center - DevOps Squadron
*Author: [Muhammad Umair Azam](https://www.linkedin.com/in/umairdevops1/)*

Welcome!

The Galactic Mission Control Center of the DevOps Squadron! This repository contains the tools and logs for our mission to establish an outpost in the AWS 

Galaxy, deploy the Space Beacon microservice using Terraform and Helm, and ensure a successful mission outcome.

---

## Table of Contents

1. [Mission Breif](#mission-brief)
2. [Mission Logs](#mission-tools)
3. [Step 1: Terraform - Establishing the Outpost](#task-1)
4. [Step 2: Docker - Dockerizing the Space Beacon](#task-2)
5. [Step 3: Helm Chart for the Space Beacon](#task-3)
6. [Feedback](#feedback)

---

## Mission Brief

Greetings, Space Engineer! Your mission is to establish a Kubernetes outpost in your personal AWS  Galaxy using Terraform and deploy the 

crucial "Space Beacon" microservice using Helm.

## Mission Tools

To accomplish our mission, we will be utilizing the following tools:

1. Terraform: A tool for provisioning and managing infrastructure as code.
2. Docker: A platform for packaging applications into containers.
3. Helm: A package manager for Kubernetes, facilitating deployment and management of applications.

---

## Mission Logs

Please refer to the [Mission Log](#Mission Logs) for a detailed log of our journey, including the 

steps taken, decisions made, and any encountered cosmic anomalies.

---

## Instructions

To successfully accomplish our mission, follow the steps below:

## Prerequisites steps

1. Install terrafrom [Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. Setup an Account For AWS [AWS Console](https://aws.amazon.com/console/)
3. Install Docker [Guide](https://docs.docker.com/engine/install/)
4. Install Helm [Guide](https://helm.sh/docs/intro/install/)

Once you have installed all these things, then you have to create an admin account on AWS which is your personal account. 
```
Important Note: I have an Create a IAM User and gave all required permissiom to this user for performing an deployment. After that keys of that user account we use in terraform script for configuration.
IAM USER ID: "835258370354"
IAM USER PASSWORD: "Your Password"
IAM USER USERNAME: "umair.azam"
```
## Step 1: Establishing the Outpost

1. Clone this repository and navigate to the Terraform directory.
```
 git clone https://github.com/umair-azam/Challenge_Task.git
```
2. Review the [Terraform Script](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster/) guide for instructions onsetting up the outpost.
3. Configure your AWS credentials and ensure you have the necessary permissions.
4. Customize the Terraform script by updating variables and configurations as needed.
5. Run 'terraform init' to initialize the Terraform project.
6. Execute 'terraform apply' to create the VPC, EKS cluster, and other resources.
7. Retrieve the outpost coordinates (kubeconfig) from the Terraform output.


---


## Step 2: Dockerizing the Space Beacon

1. Review the [Dockerfile](#) guide.
2. Choose your desired programming language.
3. Create a Dockerfile with the necessary configurations for the Space Beacon microservice.
4. Build the Docker image by running docker build -t space-beacon:latest ..
5. Push the Docker image to a container registry of your choice (e.g., Docker Hub, AWS ECR).

--- 


## Step 3: Helm Chart for the Space Beacon

Review the Helm Chart guide.
Customize the Helm chart to fit your requirements.
Deploy the Space Beacon to the EKS cluster using the Helm chart by running helm install space-beacon ./space-beacon.

---
## Cosmic Anomalies
During our mission, we encountered and overcame certain cosmic anomalies. To learn about the errors or difficulties we faced and their resolutions, 
refer to the Cosmic Anomalies log.

---

## Future Galactic Missions
Based on our experiences, we have provided some thoughts and suggestions for future galactic missions in the Mission Insights section. 
Feel free to explore these recommendations to enhance future missions.

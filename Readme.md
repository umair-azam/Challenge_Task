# Galactic Mission Control Center - DevOps Squadron
*Author: [Muhammad Umair Azam](https://www.linkedin.com/in/umairdevops1/)*

Welcome!

The Galactic Mission Control Center of the DevOps Squadron! This repository contains the tools and logs for our mission to establish an outpost in the AWS 

Galaxy, deploy the Space Beacon microservice using Terraform and Helm, and ensure a successful mission outcome.

---

## Table of Contents

1. [Mission Breif](#mission-brief)
2. [Mission Tools](#mission-tools)
3. [Mission Logs](#mission-logs)
4. [Step-1: Establishing the Outpost](#Step-1)
5. [Step-2: Dockerizing the Space Beacon](#Step-2)
6. [Step-3: Helm Chart for the Space Beacon](#Step-3)
7. [Cosmic Anomalies]()
8. [Future Galactic Missions]()
9. [Feedback](#feedback)

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
Important Note: I have an Create a IAM User and gave all required permissiom to this user for performing an deployment.

After that keys of that user account we use in terraform script for configuration.
IAM USER ID: "835258370354"
IAM USER PASSWORD: "Your Password"
IAM USER USERNAME: "umair.azam"
```
## Step-1: 

Establishing the Outpost

### Description

1. Clone this repository and navigate to the Terraform directory.
```
 git clone https://github.com/umair-azam/Challenge_Task.git
```
2. Review the [Terraform Script](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster/) guide for instructions onsetting up the outpost.
3. Configure your AWS credentials and ensure you have the necessary permissions.
4. Assign the needed permissions to the IAM User "umair.azam". 

- Attach AWS-managed policies:
    - CloudWatchLogsFullAccess
    - IAMFullAccess
    - AWSKeyManagementServicePowerUser
    - AmazonVPCFullAccess
    - AmazonEKSClusterPolicy
5. Customize the Terraform script by updating variables and configurations as needed.
6. Run ```terraform init``` to initialize  the Terraform project.
7. Execute ```terraform apply``` to create the VPC, EKS cluster, and other resources.
8. Retrieve the outpost coordinates (kubeconfig) from the Terraform output.


---


## Step-2: 

Dockerizing the Space Beacon

### Description

I created a simple application using node language. Now after application creation we need to dockerize the app. These are steps to follow:

1. Review the [Dockerfile](https://github.com/umair-azam/Challenge_Task/blob/master/App/Dockerfile) guide.
2. Choose your desired programming language.
3. Create a Dockerfile with the necessary configurations for the Space Beacon microservice.
4. Build the Docker image by running
```
 docker build -t space_beacon:latest .

 docker tag space_beacon:latest 835258370354.dkr.ecr.eu-north-1.amazonaws.com/sb-repo:latest
```
5. Setup a AWS Container Registery and then apply configuration.
```
Important Note: I have created a mannually  ECR in AWS and then push to image on that repository.

For Configuration with aws:
aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 835258370354.dkr.ecr.eu-north-1.amazonaws.com
```
6. Push the Docker image to a container registry of your choice (e.g., Docker Hub, AWS ECR).
```
 docker push 835258370354.dkr.ecr.eu-north-1.amazonaws.com/sb-repo/:latest
```
--- 


## Step-3: 

Helm Chart for the Space Beacon

### Description


1. Setup Kubernetes Configuration
```
 1. kubconfig file of cluster move to ~/.kube/config

 2. aws eks update-kubeconfig --region eu-north-1  --name EKS-Cluster
```
2. Create the Helm Chart [guide](https://helm.sh/docs/helm/helm_create/).
```
 helm create "Chart Name" (eg, mission-sb)

 helm create namespace "Name of your namespace" (eg,vspacebeacon)
```
3. Customize the Helm chart to fit your requirements.
```
Note: Change repository (Put your uri of repository), Remaining upto your own requirements which you want to change.
image:
  repository: "URI of your Repository"  #the needed image repo
  pullPolicy: Always
  tag: "latest"
```
4. Deploy the Space Beacon to the EKS cluster using the Helm chart by running
```
helm upgrade space-beacon --install ./mission-sb -n spacebeacon
```

---
## Cosmic Anomalies
During our mission, we encountered and overcame certain cosmic anomalies. To learn about the errors or difficulties we faced and their resolutions, 
refer to the Cosmic Anomalies log.

---

## Future Galactic Missions
Based on our experiences, we have provided some thoughts and suggestions for future galactic missions in the Mission Insights section. 
Feel free to explore these recommendations to enhance future missions.

---
## Feeback
The DevOps Galactic Mission: Operation Terraform was a valuable experience for me, allowing me to enhance my skills in infrastructure provisioning and management using AWS and Terraform. I gained practical experience with essential tools like AWS, Terraform, Docker, and Helm, which are widely used in the industry. The mission's tasks, such as creating a VPC, setting up an EKS cluster, building a Docker image, and deploying a microservice using Helm, provided a comprehensive understanding of establishing a Kubernetes-based application and emphasized best practices for security, efficiency, and scalability. I enjoyed the engaging and educational nature of the mission, further solidifying my interest in DevOps and my commitment to continuous learning in this field.

I appreciate the opportunity provided by the mission and look forward to discussing my solution and experiences during the interview process. Thank you, and may the force of DevOps be with you!


## Journey Log


* Created a VPC in the AWS Galaxy with a single public subnet.

```
For creating a VPC with a single public subnet, a VPC module is used. [Guide](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html).

- Enable auto-assigning public IP addresses to EC2 instances.
map_public_ip_on_launch = true
```

* Utilized the official EKS Terraform module to set up an EKS cluster in the VPC.

```

For creating an EKS cluster within the VPC, the EKS module is used. [Guide](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html). [Module](https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest).
```
* Implemented security measures for the EKS cluster, including security groups and IAM roles.
```
Ensure that the IAM role or user has the following minimum permissions to interact with the EKS cluster:

1. AmazonEKSClusterPolicy: This policy grants permission to describe and list the EKS cluster.
2. AmazonEKSServicePolicy: This policy grants permission to allow the IAM role or user to manage and control Kubernetes resources using the AWS Management Console, AWS CLI, or AWS SDKs.
3. AmazonEKSVPCResourceController: This policy grants permission to manage AWS resources related to the EKS cluster's VPC.
```
* My choice of EC2 instance type is t2.micro, as it is part of a free tier. 

1. I used EKS managed node instead of self-managed, because it simplifies the management and scaling of worker nodes in an EKS cluster, reducing operational overhead and allowing you to focus more on your applications.
2. My desired size of the EKS managed node group is 2 because 1 node of a type t2.micro is insufficient for system and space-beacon application pods.

* Output the outpost coordinates (kubeconfig) to connect to the EKS cluster.  In order to output the EKS cluster kubeconfig, eks-kubeconfig module is used. [Eks-kubeconfig Module](https://registry.terraform.io/modules/hyperbadger/eks-kubeconfig/aws/latest) 

 
 1. Module eks-kubeconfig should run after the completion of the EKS module.

```
depends_on = [module.eks]
```

2. It is required to secure our kubeconfig output. Kubeconfig is not displayed in the console or stored in the Terraform state file. Either there will be an error.

```
sensitive = true
```
* Next, you need to construct our Space Beacon. Develop a Dockerfile for a simple application using the language of your choice. The application should listen on port 80 and respond to HTTP GET requests with "Greetings from the DevOps Squadron!".

* Once the Docker image is built, push it to a container registry of your choice (e.g., Docker Hub,
  AWS ECR, Google Container Registry).

* My Work:
  ```
  - I used a lightweight official docker image with Node alpine. Also, a tag is latest.
  - I set the application port to 80. 
  - However, in the next task my k8s service also exposes 80 port.   
  ```
  
* AWS ECR with a private repository is used as a main container registry. It is created Mannually. [Guide](https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-create.html)

* Install AWS CLI. [Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

* Create an access key for your account. It is not recommended to do it for the root user. Make sure your user has the needed permissions. [Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build).


* Configure your profile in AWS CLI. [Guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).

```
aws configure

AWS Access Key ID [None]: " Access Key"

AWS Secret Access Key [None]: "Secret key"

Default region name [None]: "Region"

Default output format [None]: json
```

* Remaining Steps also include in [Readme.md](Readme.md) which is dockerization and deploymemnt of our mission. I have given such important points which is not mentioned in Read me file.


## Deploy the Space Beacon using the Helm chart:

1. Ensure you have the following prerequisites:
```
   Access to the EKS cluster with the appropriate kubeconfig.
   Helm installed on your local machine.
```
2. Navigate to the directory containing the Helm chart.
3. Modify the values.yaml file to customize any configuration parameters.
4. Run the commands to deploy the Space Beacon.
5.Verify the deployment and access the Space Beacon microservice.


## Cosmic Anomalies

Error: VPC ZONES - Atleast two zones

## Solution:
```
When creating a cluster, you need to specify a VPC and at least two subnets in different Availability Zones. [Docs](https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html).
```

Error: IAM principal doesn't have access to Kubernetes objects

## Solution:

Identified the IAM role/user associated with the principal used to access the EKS cluster.
```
Attached the required IAM policies (AmazonEKSClusterPolicy, AmazonEKSServicePolicy, AmazonEKSVPCResourceController) to the IAM role/user.
Retried accessing the Kubernetes objects on the EKS cluster and successfully bypassed the error.
```



Error: Signature expired - Terraform AWS provider

## Solution:

Ensured that valid and active AWS access keys were used.
```
Verified and updated the access key and secret key in the Terraform AWS provider configuration.
Reran the Terraform script using the corrected credentials, resolving the signature expiration error.
```

Error: couldn't get current server API group

## Solution

```
Cluster Endpoints don't have acces in eks module.
cluster_endpoint_public_access  = true 
```

## Thoughts and Suggestions for Future Galactic Missions

1. Encourage extensive testing of the Terraform scripts and Helm charts to ensure seamless deployments and avoid potential issues.
2. Implement automated testing and validation pipelines to verify the correctness and compatibility of the infrastructure code and application deployments.
3. Explore the use of infrastructure-as-code frameworks like AWS CDK or Pulumi for more flexible and programmatic infrastructure management.
4. Continuously monitor and update security measures to address evolving threats and vulnerabilities.
5. Foster collaboration and knowledge sharing among space engineers to improve mission outcomes and foster innovation.
 
 Note: Feel free to customize and expand upon this template based on your specific mission details and experiences.

*If you have any further questions or need assistance, feel free to ask!*

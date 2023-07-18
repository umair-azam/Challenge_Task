
##Journey Log

Task 1: Terraform - Establishing the Outpost

Created a VPC in the AWS Galaxy with a single public subnet.
Utilized the official EKS Terraform module to set up an EKS cluster in the VPC.
Implemented security measures for the EKS cluster, including security groups and IAM roles.
Output the outpost coordinates (kubeconfig) to connect to the EKS cluster.
Task 2: Dockerizing the Space Beacon

Developed a Dockerfile for a simple application that listens on port 80 and responds to HTTP GET requests with "Greetings from the DevOps Squadron!"
Built a Docker image of the Space Beacon application.
Pushed the Docker image to a container registry (Docker Hub).
Task 3: Helm Chart for the Space Beacon

Created a Helm chart for the Space Beacon application.
Included a deployment configuration, service definition, and additional elements for a production-grade deployment.
Task 4: Deployment - Launching the Space Beacon & Documentation

Deployed the Helm chart to the EKS cluster using the provided kubeconfig.
Documented the mission in a markdown file.
Guide for Future Space Engineers
Using the Terraform Script
To establish the outpost using the Terraform script:

Set up AWS credentials with appropriate permissions.
Install Terraform on your local machine.
Clone the mission control center repository.
Navigate to the directory containing the Terraform script.
Update the desired region, VPC settings, and other variables in the script.
Run terraform init to initialize the Terraform project.
Run terraform apply to create the VPC, EKS cluster, and other resources.
Once the deployment is successful, the outpost coordinates (kubeconfig) will be provided in the Terraform output.
Using the Helm Chart
To deploy the Space Beacon using the Helm chart:

Ensure you have the following prerequisites:
Access to the EKS cluster with the appropriate kubeconfig.
Helm installed on your local machine.
Clone the mission control center repository if not done already.
Navigate to the directory containing the Helm chart.
Modify the values.yaml file to customize any configuration parameters.
Run the following command to deploy the Space Beacon:
shell
Copy code
helm install space-beacon ./space-beacon
Verify the deployment and access the Space Beacon microservice.


Cosmic Anomalies
Error: IAM principal doesn't have access to Kubernetes objects
Resolution:

Identified the IAM role/user associated with the principal used to access the EKS cluster.
Attached the required IAM policies (AmazonEKSClusterPolicy, AmazonEKSServicePolicy, AmazonEKSVPCResourceController) to the IAM role/user.
Retried accessing the Kubernetes objects on the EKS cluster and successfully bypassed the error.
Error: Signature expired - Terraform AWS provider
Resolution:

Ensured that valid and active AWS access keys were used.
Verified and updated the access key and secret key in the Terraform AWS provider configuration.
Reran the Terraform script using the corrected credentials, resolving the signature expiration error.
Thoughts and Suggestions for Future Galactic Missions
Encourage extensive testing of the Terraform scripts and Helm charts to ensure seamless deployments and avoid potential issues.
Implement automated testing and validation pipelines to verify the correctness and compatibility of the infrastructure code and application deployments.
Explore the use of infrastructure-as-code frameworks like AWS CDK or Pulumi for more flexible and programmatic infrastructure management.
Continuously monitor and update security measures to address evolving threats and vulnerabilities.
Foster collaboration and knowledge sharing among space engineers to improve mission outcomes and foster innovation.
Feel free to customize and expand upon this template based on your specific mission details and experiences.

If you have any further questions or need assistance, feel free to ask!

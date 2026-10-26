```markdown
# Scalable Modular AWS Two-Tier Infrastructure with Terraform

An advanced Infrastructure as Code (IaC) repository implementing a highly decoupled, modularized two-tier web application architecture on AWS. By separating networking and compute into dedicated reusable modules.

## Modular Design Breakdown
The project is strictly broken down into reusable building blocks:
├── main.tf                 # Root configuration invoking modules
├── variables.tf            # Global input parameters
├── outputs.tf              # Exposes final output variables (e.g., Web Public IP)
├── terraform.tfvars        # Environment-specific configuration values
└── modules/
├── vpc/                # Dedicated Networking Module (VPC, Subnets, SG)
│   ├── main.tf
│   ├── variables.tf
│   └── output.tf
└── compute/            # Dedicated Compute Module (EC2 Instances, Web/DB logic)
├── main.tf
├── variables.tf
└── output.tf
## Enhanced Features
* **Zoned Architecture:** Decoupled modules allow independent updates to networking or compute without affecting the entire state lifecycle.
* **Cascading State Dependencies:** Utilizes Terraform module outputs to dynamically inject infrastructure attributes (like Subnet IDs and Security Group IDs) from the Network module directly into the Compute module.
* **Dynamic Sizing:** Fully parameterized `instance_type` and `AMI` configuration supporting modern Free-Tier instances (`t3.micro`).
* **Implicit Resource Interdependence:** Implements strict synchronization blocks (`depends_on`) ensuring network fabrics are fully established before provisioning servers.

## Usage & Execution
1. Clone and navigate to the directory.
2. Populating variables: Create your `terraform.tfvars` file in the root directory:
   ```hcl
#my default key name is "AmirKey" you can change it in the files with your key name also it could be modular as well
   key_name       = "AmirKey"
   my_ip          = "YOUR_IP/32"
   aws_access_key = "YOUR_AWS_ACCESS_KEY"
   aws_secret_key = "YOUR_AWS_SECRET_KEY"

Run Initialization & Apply:

Bash
terraform init
terraform plan
terraform apply -auto-approve

!!Outputs
Upon a successful apply, the root module dynamically catches the internal compute outputs and prints the live public URL:

final_web_public_ip: Public IP of the Nginx host.

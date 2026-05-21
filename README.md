# Terraform AWS Infrastructure

AWS infrastructure project using Terraform with modular architecture and CI/CD automation through GitHub Actions.

## 🚀 Technologies Used

- Terraform
- AWS
- GitHub Actions
- Auto Scaling Group
- Application Load Balancer (ALB)
- VPC
- EC2

## 📁 Project Structure

```bash
.
├── modules/
│   ├── alb/
│   ├── network/
│   ├── ec2/
│
├── .github/
│   └── workflows/
│       └── terraform-plan.yml
│
├── main.tf
├── ami.tf
├── providers.tf
├── versions.tf
├── backend.tf
└── README.md
```

## ☁️ Architecture

This infrastructure provisions:

- Custom VPC
- Public and private subnets
- Security Groups
- Application Load Balancer
- Auto Scaling Group
- EC2 Instances
- High availability across multiple Availability Zones

## ⚙️ CI/CD Pipeline

The GitHub Actions pipeline automatically runs:

- Terraform fmt
- Terraform validate
- Terraform init
- Terraform plan

On every push to the `main` branch.

## 🔧 How to Run Locally

### 1. Clone the repository

```bash
git clone https://github.com/clopes-cloud/aws-scalable-infra-terraform.git
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Validate the infrastructure

```bash
terraform validate
```

### 4. Generate execution plan

```bash
terraform plan
```

### 5. Apply the infrastructure

```bash
terraform apply
```

## 🔐 Prerequisites

- AWS Account
- AWS CLI configured
- Terraform installed
- Git installed

## 📌 Features

- Infrastructure as Code (IaC)
- Modular architecture
- Auto scaling
- Load balancing
- Automated CI/CD
- Environment separation

## 👨‍💻 Author

Caio Lopes

- Cloud & DevOps Enthusiast
- AWS SAA Certified

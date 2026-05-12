# OpsLedger Infrastructure

Terraform infrastructure for the OpsLedger EKS environment.

## What It Builds

- AWS VPC across three availability zones.
- Public and private subnets for Kubernetes workloads.
- NAT gateway and DNS support.
- Amazon EKS cluster named `opsledger-eks`.
- Two managed node groups for application workloads.
- Amazon ECR repository named `opsledger-web`.

## Prerequisites

- Terraform 1.6.3 or newer.
- AWS CLI configured with access to the target account.
- An S3 backend bucket named `opsledger-terraform-state`.
- GitHub repository secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

## Usage

```bash
cd terraform
terraform init
terraform fmt -check
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
```

## GitHub Actions Workflow

The Terraform workflow runs only when files under `terraform/**` change.

- Pushes to `stage` run Terraform init, format check, validate, and plan.
- Pull requests targeting `main` run Terraform init, format check, validate, and plan.
- Pushes to `main`, including merges from `stage`, run Terraform init, format check, validate, plan, and apply.
- After a successful apply on `main`, the workflow updates the kubeconfig for `opsledger-eks` and installs the AWS NGINX ingress controller manifest.


## Teardown

```bash
cd terraform
terraform destroy
```

Review the destroy plan before approving it. EKS, NAT gateways, and load balancers can create ongoing AWS cost.

## Repository Layout

```text
terraform/              Terraform modules, EKS, VPC, and ECR resources
.github/workflows/      GitHub Actions workflow for validation, planning, and apply
docs/                   Architecture notes and screenshots
```

## Notes

The Terraform backend uses an S3 bucket name that must exist before `terraform init`. If your AWS account already uses a different backend bucket, update `terraform/terraform.tf` before running the workflow.

If the `opsledger-web` ECR repository already exists outside Terraform, import it before the first apply:

```bash
cd terraform
terraform import aws_ecr_repository.opsledger_web opsledger-web
```

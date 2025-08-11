# aws-Secrets-Manager

# AWS-session-manager

# Terraform CI/CD: AWS Secrets Manager with Cost Estimation & Manual Approval

This project automates the creation of:

- AWS Secrets Manager secrets
- Secure secret values management
- Terraform + GitHub Actions with cost visibility and manual approval

---

## What It Deploys

### AWS Secrets Manager
- Secure secrets storage
- Random suffix for uniqueness
- Environment-based tagging
- Version control for secrets

### S3 Bucket
- Stores Terraform remote state
- Auto-created if not existing

---

## How It Works

GitHub Actions workflow triggers on push to `main`:
- Runs `terraform init`, `terraform plan`
- Displays cost summary via Infracost
- Waits for manual approval via GitHub Environments
- On approval, runs `terraform apply`

---

## Steps to Use This Project

### 1. Clone the Repo

```bash
git clone https://github.com/<your-username>/AWS-session-manager.git
cd AWS-session-manager
```

### 2. Set Up GitHub Secrets

Go to `Settings → Secrets → Actions`, add:

| Name                   | Value                          |
|------------------------|--------------------------------|
| `AWS_ACCESS_KEY_ID`    | Your AWS access key            |
| `AWS_SECRET_ACCESS_KEY`| Your AWS secret key            |
| `INFRACOST_API_KEY`    | Your Infracost API key         |

These credentials must allow access to manage Secrets Manager and S3.

---

### 3. Add Collaborators

Go to `Settings → Collaborators → Invite collaborator`, enter GitHub usernames and set permissions (Write/Admin).

---

### 4. Add GitHub Environment for Manual Approval

Go to `Settings → Environments`, create `dev-approval`, and add yourself or team members under **Required reviewers**.

---

### 5. Push Code

```bash
git add .
git commit -m "initial commit"
git push origin main
```

---

## Infracost Setup Guide

### 1. Get Infracost API Key
1. Go to [https://dashboard.infracost.io](https://dashboard.infracost.io)
2. Sign up using your GitHub account or email
3. After signing in, go to "Settings" → "API Keys"
4. Click "Create API key"
5. Give your key a name (e.g., "GitHub Actions")
6. Copy the generated API key

### 2. Add API Key to GitHub Secrets
1. Go to your GitHub repository
2. Navigate to "Settings" → "Secrets and variables" → "Actions"
3. Click "New repository secret"
4. Name: `INFRACOST_API_KEY`
5. Value: Paste your copied API key
6. Click "Add secret"

### 3. Verify Infracost Integration
After pushing code to your repository:
1. Go to "Actions" tab
2. Check the latest workflow run
3. You should see a cost estimation summary in the workflow steps
4. Cost breakdown will be available in PR comments

### Sample Cost Output

---

## Project Structure

```
.
├── main.tf               # Secrets Manager resources
├── provider.tf           # AWS provider config
├── variables.tf          # Inputs: secret names, values, etc.
├── outputs.tf           # Secret ARNs and other outputs
├── backend.tf           # S3 backend
├── environments/
│   ├── dev.tfvars
│   ├── uat.tfvars
│   └── prod.tfvars
└── .github/workflows/
    └── terraform.yml    # CI/CD pipeline
```




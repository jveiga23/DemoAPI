# Demo API

A minimal ASP.NET Core API deployed to Azure App Service using Terraform and GitHub Actions.

Built as a learning project to practice Infrastructure as Code and CI/CD concepts.

## What it does

- **Infrastructure as Code** — Azure resources (App Service, App Service Plan, Resource Group) 
  provisioned and managed with Terraform, with remote state in Azure Blob Storage
- **Containerisation** — multi-stage Docker build producing a minimal runtime image
- **CI/CD pipeline** — GitHub Actions workflow that builds, tests, pushes the container image, 
  and deploys to Azure on every push to main
- **Cloud deployment** — running on Azure App Service (Linux, container)

## Deployment flow

GitHub push → GitHub Actions (test → build image → push to ghcr.io → deploy to Azure)
Terraform manages: Resource Group, App Service Plan, App Service

## Endpoints

| Endpoint | Description |
|---|---|
| GET /health | Health check |
| GET /weatherforecast | Sample data endpoint |

## Running locally

Prerequisites: .NET 8 SDK, Docker

\`\`\`bash
# Without Docker
dotnet run --project DemoApi.Api

# With Docker
docker build -t demo-api .
docker run -p 8080:8080 demo-api
\`\`\`

## Infrastructure

Managed with Terraform. See `infra/` for configuration.

\`\`\`bash
cd infra
terraform init
terraform plan
terraform apply
\`\`\`

## CI/CD

See `.github/workflows/deploy.yml`. Pipeline runs on push to main:
1. Build and run tests
2. Build and push Docker image to GitHub Container Registry
3. Deploy to Azure App Service
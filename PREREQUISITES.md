# Workshop prerequisites

Complete this **before** the workshop. Day 1 starts with Terraform and AI prompts. There is no time to install tools during the session.

This workshop is for experienced DevOps engineers. We do not teach basic Azure, Terraform, Git, or JavaScript.

## What you will build

A self-service portal:

```
React (localhost:3000) → Node API (localhost:3001) → Terraform (main/) → Azure
```

It creates a resource group, VNet, Windows VM, and DNS record.

## Accounts (must have access)

| Account | Why |
|---|---|
| GitHub (or the repo host the instructor names) | Clone this repository |
| Microsoft Azure subscription | `terraform plan` / `apply` |
| Cursor | AI-assisted coding during the labs |
| Azure CLI login that can create RG, VNet, VM, DNS in the workshop subscription | Local Terraform on Day 1 |

The instructor will give you:

- Git repo URL and branch
- Azure subscription ID
- Whether you use the shared AKS namespace `terraflow-dev` on Day 2, or local Terraform only
- Storage account / file share names if you run the portal against shared state

Do **not** commit `.env` files or `k8s/k8s-secrets.yaml`. Copy the example files only.

## Software to install

Use **Windows 10/11**, macOS, or Linux. 16 GB RAM recommended.

| Tool | Version | Check |
|---|---|---|
| Git | latest | `git --version` |
| Node.js | **20 or newer** | `node -v` |
| npm | **10 or newer** | `npm -v` |
| Terraform | **1.6.x or newer** (minimum 1.3.0) | `terraform -version` |
| Azure CLI | latest | `az version` |
| kubectl | latest | `kubectl version --client` |
| Cursor | latest | Open Cursor and sign in |

Optional but useful: Windows Terminal, VS Code.

### Windows (winget)

```powershell
winget install Git.Git
winget install OpenJS.NodeJS.LTS
winget install Hashicorp.Terraform
winget install Microsoft.AzureCLI
winget install Kubernetes.kubectl
```

Install [Cursor](https://cursor.com) from the website. Restart the terminal after installs.

### macOS (Homebrew)

```bash
brew install git node terraform azure-cli kubernetes-cli
```

Then install Cursor from the website.

## Clone and install the repo

```bash
git clone <REPO_URL>
cd terraflow

cd terraflow-backend
npm install
cd ../terraflow-frontend
npm install
```

`npm install` must finish with **no errors**. If it fails at home, fix it before the workshop (VPN, Node version, permissions).

## Environment files (no secrets in Git)

### Backend

```bash
cd terraflow-backend
cp example.env .env
```

Edit `.env`. For laptop-only Day 1 you still need Azure login; storage keys are only required when the API talks to Azure Files / Table Storage.

Minimum for local API later:

- `PORT=3001`
- `CORS_ORIGIN=http://localhost:3000`
- `K8S_NAMESPACE=terraflow-dev` (Day 2 jobs)
- `AZURE_*` values the instructor provides

### Frontend

```bash
cd terraflow-frontend
cp example.env .env.development
```

Keep:

```env
VITE_API_BASE_URL=http://localhost:3001
VITE_DISABLE_AUTH=true
```

Leave OIDC fields as placeholders unless the instructor enables login.

### Kubernetes secrets (Day 2)

```bash
cd terraflow-backend/k8s
cp secret-example.yaml k8s-secrets.yaml
```

Fill placeholders **only if** you will create Jobs in the cluster. Do not commit `k8s-secrets.yaml`.

## Azure login (Day 1)

```bash
az login
az account show
az account set --subscription "<WORKSHOP_SUBSCRIPTION_ID>"
```

Confirm you can list resource groups:

```bash
az group list -o table
```

## Terraform smoke test (Day 1)

From `main/`:

```bash
cd main
terraform version   # >= 1.3.0
terraform init
terraform fmt -check
terraform validate
```

`init` must download the `azurerm` and `random` providers. Do not `apply` until the instructor says so.

If `terraform.tfvars` still has `YOUR_SUBSCRIPTION_ID`, replace it with your workshop subscription ID **locally**. That file may stay untracked; do not put real secrets in Git.

## Kubernetes (Day 2 only)

You need a kubeconfig that can reach the workshop AKS and namespace **`terraflow-dev`**.

```bash
kubectl config current-context
kubectl get ns terraflow-dev
kubectl get sa terraform-runner -n terraflow-dev
```

If those fail, you can still do Day 1 (local Terraform). The instructor will issue kubeconfig or `az aks get-credentials` steps on the day.

## Start the portal (verify before the workshop)

Two terminals:

```bash
# Terminal 1
cd terraflow-backend
npm run dev
```

http://localhost:3001/api/health should return `{ "status": "ok", ... }`  
Swagger: http://localhost:3001/docs

```bash
# Terminal 2
cd terraflow-frontend
npm run dev
```

http://localhost:3000 should open the dashboard. With `VITE_DISABLE_AUTH=true` you should not be forced through login.

You do **not** need to deploy the frontend/backend to Kubernetes to do the labs. Local UI + API is enough. Terraform Jobs in AKS are a Day 2 option when the cluster and secrets are ready.

## Ports that must be free

| Port | App |
|---|---|
| 3000 | React |
| 3001 | Node API |

## Pre-workshop checklist

Print this or tick it in a note:

- [ ] Git installed
- [ ] Node 20+ and npm 10+
- [ ] Terraform 1.6+ (`terraform -version`)
- [ ] Azure CLI installed and `az login` works
- [ ] kubectl installed
- [ ] Cursor installed and signed in
- [ ] Repo cloned
- [ ] `npm install` succeeded in `terraflow-backend` and `terraflow-frontend`
- [ ] `example.env` copied to `.env` / `.env.development` (not committed)
- [ ] `terraform init` and `terraform validate` succeed in `main/`
- [ ] Backend `npm run dev` serves `/api/health`
- [ ] Frontend `npm run dev` opens on port 3000
- [ ] Laptop charger, and you can reach public npm and HashiCorp registry (or your corporate proxy is already configured)

## What we will not install for you on the day

- Node, Terraform, Azure CLI, Git, Cursor
- npm packages (run `npm install` at home)
- Azure login / MFA device

If any check above fails, fix it before the workshop or message the instructor with the **exact command and error**.

# Workshop prerequisites

Complete this **before** the workshop. Day 1 starts immediately. There is no time to install tools during the session.

This workshop is for experienced DevOps engineers. We do not teach basic Azure, Terraform, Git, or JavaScript.

You will **not** receive this application’s source code in advance. Bring a laptop with the tools below installed and working. You will generate Terraform, React, and Node.js during the labs using AI prompts.

## Accounts

| Account | Why |
|---|---|
| Microsoft Azure subscription | Create resource groups, VNets, VMs, and DNS |
| Azure login (MFA device if required) | `az login` must work on your laptop |
| An AI assistant you already use | Labs are prompt-driven |

Cursor is **not** required. Use GitHub Copilot, Claude, Gemini, ChatGPT, Cursor, or another LLM you can access on the day.

The instructor will tell you which Azure subscription (or sandbox) to use.

## Software to install

Windows 10/11, macOS, or Linux. 16 GB RAM recommended.

| Tool | Version | Check |
|---|---|---|
| Git | latest | `git --version` |
| Node.js | **20 or newer** | `node -v` |
| npm | **10 or newer** | `npm -v` |
| Terraform | **1.6.x or newer** (minimum 1.3.0) | `terraform -version` |
| Azure CLI | latest | `az version` |
| kubectl | latest | `kubectl version --client` |
| A code editor | any | VS Code, Cursor, JetBrains, Neovim, etc. |

**AI assistant:** have **one** of Copilot, Claude, Gemini, ChatGPT, Cursor, or similar signed in and working.

Optional: Windows Terminal.

### Windows (winget)

```powershell
winget install Git.Git
winget install OpenJS.NodeJS.LTS
winget install Hashicorp.Terraform
winget install Microsoft.AzureCLI
winget install Kubernetes.kubectl
```

Restart the terminal after installs.

### macOS (Homebrew)

```bash
brew install git node terraform azure-cli kubernetes-cli
```

Restart the terminal after installs.

## Azure login

```bash
az login
az account show
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
az group list -o table
```

You must be able to create resources in that subscription (resource group, VNet, VM, public IP, NSG, DNS zone). If you cannot, fix access before the workshop.

## Terraform smoke test

In an empty folder:

```bash
terraform version
```

Must report **1.3.0 or newer** (1.6.x preferred). You do not need a project cloned. Provider download happens in the lab with `terraform init`.

## Node smoke test

```bash
node -v    # v20 or higher
npm -v     # 10 or higher
```

Create a throwaway folder and confirm npm works:

```bash
mkdir ws-npm-check
cd ws-npm-check
npm init -y
```

Delete that folder afterward. Corporate proxy/VPN must allow **registry.npmjs.org** and **registry.terraform.io**.

## kubectl

```bash
kubectl version --client
```

Cluster credentials are **not** required before the workshop. Install the CLI only.

## Ports that should be free on the day

| Port | Used for |
|---|---|
| 3000 | React app you will generate |
| 3001 | Node API you will generate |

## Pre-workshop checklist

- [ ] Git installed
- [ ] Node 20+ and npm 10+
- [ ] Terraform 1.6+ (`terraform -version`)
- [ ] Azure CLI installed
- [ ] `az login` works and you can list resource groups
- [ ] kubectl client installed
- [ ] A code editor
- [ ] **One** working AI assistant (Copilot, Claude, Gemini, ChatGPT, Cursor, etc.)
- [ ] Laptop charger
- [ ] Network can reach npm and the Terraform registry (or your proxy is already set)

## What we will not do for you on the day

- Install Node, Terraform, Azure CLI, Git, or kubectl
- Complete Azure login / MFA
- Set up your AI assistant account

Do **not** expect a copy of the instructor portal codebase. You will build your own Terraform modules and portal during the two days.

If a check fails, fix it before the workshop or send the instructor the **exact command and error**.

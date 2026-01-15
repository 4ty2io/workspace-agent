Language: [English](README.md) | [한국어](README.ko.md)

![License](https://img.shields.io/badge/License-MIT-green)
![Gemini](https://img.shields.io/badge/AI-Gemini_3.0_Pro-blue)
![Architecture](https://img.shields.io/badge/Architecture-Event_Driven-purple)
![Memory](https://img.shields.io/badge/Context-Infinite-orange)

# Workspace Agent

A template and toolkit for bootstrapping Google Antigravity workspaces with a standard agent configuration.

## Usage

This project is designed to be added as a submodule to your main workspace.

### 1. Initialize a new Workspace
Create a folder for your new project (e.g., `my-new-project`) and `cd` into it.

### 2. Quick Install
Run this one-liner in your project root to hydrate your workspace:
```bash
git clone --depth 1 https://github.com/4ty2io/workspace-agent.git .temp-agent && ./.temp-agent/install.sh && rm -rf .temp-agent
```

### 3. Verify
You should now see `.agent/` and `.context/` in your project root.
```bash
ls -la .agent .context
```

**What this does:**
- **COPIES** `.agent/` and `.context/` from `workspace-agent/` to your root.
- **COPIES** template files (initially) to your root.
- Configures `.gitignore`.

> [!IMPORTANT]
> You now "own" the configuration files in your workspace root.

### 5. Customization
Since `.agent` and `.context` are real files in your workspace, you can modify them freely!
- Want to change the `code-review` skill? Edit `.agent/skills/code-review/SKILL.md`.
- Want to add a custom workflow? Add it to `.agent/workflows/`.

### 6. Updating
To update the agent to the latest version, simply repeat the "Fetch and Install" process.

1.  Clone the latest version to a temp dir.
### 6. Updating
To update the agent to the latest version, simply repeat the "Fetch and Install" process.

1.  Clone the latest version to a temp dir.
2.  Run `install.sh`.
    - It will **SKIP** any files you have modified or that already exist.
    - If you want to **OVERWRITE** your local changes with the latest version, run:
      ```bash
      ./install.sh --force
      ```
    - ⚠️ **WARNING**: `--force` will delete your `.agent` and `.context` directories and replace them with fresh copies.

### 5. Start Coding
You are now ready to work with your agentic workspace!

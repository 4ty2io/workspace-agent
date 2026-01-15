# Workspace Agent

A template and toolkit for bootstrapping Google Antigravity workspaces with a standard agent configuration.

## Usage

This project is designed to be added as a submodule to your main workspace.

### 1. Initialize a new Workspace
Create a folder for your new project (e.g., `my-new-project`) and `cd` into it.

### 2. Add as Submodule
```bash
git init
git submodule add https://github.com/your-org/workspace-agent.git workspace-agent
```

### 3. Sync and Update
```bash
git submodule update --init --recursive
```

### 4. Install
Run the installation script to set up the necessary symlinks and template files.

```bash
./workspace-agent/install.sh
```

This will:
- Symlink `.agent` from `workspace-agent/.agent` to your root.
- Symlink `.context` from `workspace-agent/.context` to your root.
- Copy `workspace-agent/template/mission.md` to your root (if it doesn't exist).

### 5. Start Coding
You are now ready to work with your agentic workspace!

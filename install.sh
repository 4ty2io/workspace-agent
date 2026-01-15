#!/bin/bash
set -e

# Get the absolute path of the workspace-agent directory
# Assuming this script is located inside workspace-agent/
AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(dirname "$AGENT_DIR")"

echo "Installing workspace-agent..."
echo "  Agent Directory: $AGENT_DIR"
echo "  Workspace Root:  $WORKSPACE_ROOT"

# Helper function to copy files/directories
install_or_update() {
  local source="$1"
  local target="$2"
  local name="$3"
  
  if [ -e "$target" ]; then
      echo "  [SKIP] $name already exists at $target."
      echo "         To update, manually delete it or copy specific files."
  else
      echo "  [COPY] Installing $name..."
      cp -r "$source" "$target"
      echo "         -> Installed to $target"
  fi
}

# 1. Install .agent (Copy)
install_or_update "$AGENT_DIR/.agent" "$WORKSPACE_ROOT/.agent" ".agent directory"

# 2. Install .context (Copy)
install_or_update "$AGENT_DIR/.context" "$WORKSPACE_ROOT/.context" ".context directory"

# 3. Create standard directories if missing
echo "Ensuring standard directories exist..."
mkdir -p "$WORKSPACE_ROOT/src"
mkdir -p "$WORKSPACE_ROOT/artifacts/logs"
echo "  [OK] Standard directories checked/created."

# 4. Copy all files from template/ to workspace root
TEMPLATE_DIR="$AGENT_DIR/template"

if [ -d "$TEMPLATE_DIR" ]; then
    echo "Copying template files from $TEMPLATE_DIR to $WORKSPACE_ROOT..."
    # cp -r -n does not overwrite existing files
    cp -r -n "$TEMPLATE_DIR/"* "$WORKSPACE_ROOT/" || true
    echo "  [OK] Template files copied."
else
    echo "  [WARN] Template directory not found at $TEMPLATE_DIR"
fi

# 5. Handle .gitignore
GITIGNORE_SRC="$AGENT_DIR/template/.gitignore"
GITIGNORE_DEST="$WORKSPACE_ROOT/.gitignore"

if [ -f "$GITIGNORE_SRC" ]; then
    if [ ! -f "$GITIGNORE_DEST" ]; then
        echo "Creating .gitignore from agent template..."
        cp "$GITIGNORE_SRC" "$GITIGNORE_DEST"
        echo "  [OK] Created .gitignore"
    else
        echo "Updating .gitignore with agent defaults..."
        if ! grep -q "Workspace Agent Symlinks" "$GITIGNORE_DEST"; then
            echo "" >> "$GITIGNORE_DEST"
            cat "$GITIGNORE_SRC" >> "$GITIGNORE_DEST"
            echo "  [OK] Appended agent ignores to .gitignore"
        else
            echo "  [SKIP] Agent ignores already present in .gitignore"
        fi
    fi
else
     echo "  [WARN] Agent .gitignore not found at $GITIGNORE_SRC"
fi

echo "Installation complete!"
echo "NOTE: You now own the copied .agent/ and .context/ directories."
echo "      Future updates to workspace-agent will NOT automatically apply."

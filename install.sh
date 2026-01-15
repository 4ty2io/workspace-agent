#!/bin/bash
set -e

# Get the absolute path of the workspace-agent directory
# Assuming this script is located inside workspace-agent/
AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(dirname "$AGENT_DIR")"

echo "Installing workspace-agent..."
echo "  Agent Directory: $AGENT_DIR"
echo "  Workspace Root:  $WORKSPACE_ROOT"

# Helper function to create symlinks
create_symlink() {
  local target="$1"
  local link_name="$2"
  
  if [ -L "$link_name" ]; then
      echo "  [SKIP] Link $link_name already exists."
  elif [ -e "$link_name" ]; then
      echo "  [WARN] Path $link_name exists but is not a symlink. Skipping to avoid data loss."
  else
      ln -s "$target" "$link_name"
      echo "  [OK] Created symlink $link_name -> $target"
  fi
}

# 1. Link .agent
create_symlink "workspace-agent/.agent" "$WORKSPACE_ROOT/.agent"

# 2. Link .context
create_symlink "workspace-agent/.context" "$WORKSPACE_ROOT/.context"

# 3. Create standard directories if missing
echo "Ensuring standard directories exist..."
mkdir -p "$WORKSPACE_ROOT/src"
mkdir -p "$WORKSPACE_ROOT/artifacts/logs"
echo "  [OK] Standard directories checked/created."

# 4. Copy all files from template/ to workspace root
TEMPLATE_DIR="$AGENT_DIR/template"

if [ -d "$TEMPLATE_DIR" ]; then
    echo "Copying template files from $TEMPLATE_DIR to $WORKSPACE_ROOT..."
    # Copy all files recursively from template/ to workspace root, preserving directory structure
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
        # Append content if not already present (simplified: just append with header)
        # To avoid duplicate blocks if ran multiple times, we could check for a marker, 
        # but for now we'll just append and assume the user manages their gitignore.
        # Actually, let's check for a marker unique to our block.
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

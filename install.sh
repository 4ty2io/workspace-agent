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
    # Iterate over all files in template directory
    # Use find to locate files relative to TEMPLATE_DIR to handle recursive structures if needed in future
    # But for now, simple cp -n (no clobber) for immediate children is safer and effectively implemented by a loop
    
    # Using find to recursively copy, but only if destination doesn't exist
    cd "$TEMPLATE_DIR" && find . -type f | while read -r item; do
        # Strip leading ./
        rel_path="${item#./}"
        dest_path="$WORKSPACE_ROOT/$rel_path"
        dest_dir="$(dirname "$dest_path")"
        
        # Ensure destination directory exists
        mkdir -p "$dest_dir"
        
        if [ -f "$dest_path" ]; then
             echo "  [SKIP] $rel_path already exists."
        else
             cp "$item" "$dest_path"
             echo "  [OK] Copied $rel_path"
        fi
    done
else
    echo "  [WARN] Template directory not found at $TEMPLATE_DIR"
fi

echo "Installation complete!"

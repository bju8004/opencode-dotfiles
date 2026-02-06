#!/bin/bash
# OpenCode Ultimate Framework Installer
# Integrates: Oh My OpenCode + SuperClaude + Superpowers

set -e

echo "🚀 OpenCode Ultimate Framework Installer"
echo "=========================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    OS="windows"
else
    OS="unknown"
fi

echo -e "${YELLOW}Detected OS: $OS${NC}"
echo ""

# Step 1: Create directories
echo -e "${GREEN}[1/4] Creating directories...${NC}"
mkdir -p ~/.claude/skills/test-driven-development
mkdir -p ~/.claude/skills/systematic-debugging
mkdir -p ~/.claude/skills/using-git-worktrees
mkdir -p ~/.claude/skills/verification-before-completion
mkdir -p ~/.config/opencode/command

# Step 2: Copy Claude files
echo -e "${GREEN}[2/4] Installing Claude configuration...${NC}"
cp "$SCRIPT_DIR/claude/CLAUDE.md" ~/.claude/
cp "$SCRIPT_DIR/claude/settings.json" ~/.claude/
cp "$SCRIPT_DIR/claude/mcp.json" ~/.claude/.mcp.json

# Step 3: Copy Skills
echo -e "${GREEN}[3/4] Installing skills (Superpowers)...${NC}"
cp "$SCRIPT_DIR/claude/skills/test-driven-development/SKILL.md" ~/.claude/skills/test-driven-development/
cp "$SCRIPT_DIR/claude/skills/systematic-debugging/SKILL.md" ~/.claude/skills/systematic-debugging/
cp "$SCRIPT_DIR/claude/skills/using-git-worktrees/SKILL.md" ~/.claude/skills/using-git-worktrees/
cp "$SCRIPT_DIR/claude/skills/verification-before-completion/SKILL.md" ~/.claude/skills/verification-before-completion/

# Step 4: Copy OpenCode files
echo -e "${GREEN}[4/4] Installing OpenCode configuration (SuperClaude commands)...${NC}"
cp "$SCRIPT_DIR/opencode/command/"*.md ~/.config/opencode/command/
cp "$SCRIPT_DIR/opencode/oh-my-opencode.json" ~/.config/opencode/

echo ""
echo "=========================================="
echo -e "${GREEN}✅ Installation Complete!${NC}"
echo ""
echo "Installed components:"
echo "  📁 ~/.claude/CLAUDE.md (Master guide)"
echo "  📁 ~/.claude/skills/ (4 Superpowers skills)"
echo "  📁 ~/.config/opencode/command/ (5 SuperClaude commands)"
echo "  📁 ~/.config/opencode/oh-my-opencode.json (Agent config)"
echo ""
echo -e "${YELLOW}⚠️  Restart OpenCode to apply changes${NC}"
echo ""
echo "Features enabled:"
echo "  ✓ TDD enforcement (test-driven-development)"
echo "  ✓ Systematic debugging (4-phase process)"
echo "  ✓ Git Worktrees isolation"
echo "  ✓ Verification before completion"
echo "  ✓ /research, /brainstorm, /design, /pm, /test commands"
echo ""
echo "GitHub Stars: 94.8k (Oh My OpenCode + SuperClaude + Superpowers)"
echo "=========================================="

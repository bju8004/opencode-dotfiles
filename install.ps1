# OpenCode Ultimate Framework Installer (Windows PowerShell)
# Integrates: Oh My OpenCode + SuperClaude + Superpowers

$ErrorActionPreference = "Stop"

Write-Host "🚀 OpenCode Ultimate Framework Installer" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Step 1: Create directories
Write-Host "[1/4] Creating directories..." -ForegroundColor Green
$directories = @(
    "$env:USERPROFILE\.claude\skills\test-driven-development",
    "$env:USERPROFILE\.claude\skills\systematic-debugging",
    "$env:USERPROFILE\.claude\skills\using-git-worktrees",
    "$env:USERPROFILE\.claude\skills\verification-before-completion",
    "$env:USERPROFILE\.config\opencode\command"
)

foreach ($dir in $directories) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
}

# Step 2: Copy Claude files
Write-Host "[2/4] Installing Claude configuration..." -ForegroundColor Green
Copy-Item "$ScriptDir\claude\CLAUDE.md" "$env:USERPROFILE\.claude\" -Force
Copy-Item "$ScriptDir\claude\settings.json" "$env:USERPROFILE\.claude\" -Force
Copy-Item "$ScriptDir\claude\mcp.json" "$env:USERPROFILE\.claude\.mcp.json" -Force

# Step 3: Copy Skills
Write-Host "[3/4] Installing skills (Superpowers)..." -ForegroundColor Green
Copy-Item "$ScriptDir\claude\skills\test-driven-development\SKILL.md" "$env:USERPROFILE\.claude\skills\test-driven-development\" -Force
Copy-Item "$ScriptDir\claude\skills\systematic-debugging\SKILL.md" "$env:USERPROFILE\.claude\skills\systematic-debugging\" -Force
Copy-Item "$ScriptDir\claude\skills\using-git-worktrees\SKILL.md" "$env:USERPROFILE\.claude\skills\using-git-worktrees\" -Force
Copy-Item "$ScriptDir\claude\skills\verification-before-completion\SKILL.md" "$env:USERPROFILE\.claude\skills\verification-before-completion\" -Force

# Step 4: Copy OpenCode files
Write-Host "[4/4] Installing OpenCode configuration (SuperClaude commands)..." -ForegroundColor Green
Copy-Item "$ScriptDir\opencode\command\*.md" "$env:USERPROFILE\.config\opencode\command\" -Force
Copy-Item "$ScriptDir\opencode\oh-my-opencode.json" "$env:USERPROFILE\.config\opencode\" -Force

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "✅ Installation Complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Installed components:"
Write-Host "  📁 ~/.claude/CLAUDE.md (Master guide)"
Write-Host "  📁 ~/.claude/skills/ (4 Superpowers skills)"
Write-Host "  📁 ~/.config/opencode/command/ (5 SuperClaude commands)"
Write-Host "  📁 ~/.config/opencode/oh-my-opencode.json (Agent config)"
Write-Host ""
Write-Host "⚠️  Restart OpenCode to apply changes" -ForegroundColor Yellow
Write-Host ""
Write-Host "Features enabled:"
Write-Host "  ✓ TDD enforcement (test-driven-development)"
Write-Host "  ✓ Systematic debugging (4-phase process)"
Write-Host "  ✓ Git Worktrees isolation"
Write-Host "  ✓ Verification before completion"
Write-Host "  ✓ /research, /brainstorm, /design, /pm, /test commands"
Write-Host ""
Write-Host "GitHub Stars: 94.8k (Oh My OpenCode + SuperClaude + Superpowers)"
Write-Host "==========================================" -ForegroundColor Cyan

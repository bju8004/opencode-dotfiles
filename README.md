# OpenCode Ultimate Framework

**3개 프레임워크의 베스트 프랙티스를 통합한 AI 코딩 환경**

[![Oh My OpenCode](https://img.shields.io/badge/Oh%20My%20OpenCode-28.6k%20stars-blue)](https://github.com/code-yeongyu/oh-my-opencode)
[![SuperClaude](https://img.shields.io/badge/SuperClaude-20.7k%20stars-green)](https://github.com/SuperClaude-Org/SuperClaude_Framework)
[![Superpowers](https://img.shields.io/badge/Superpowers-45.5k%20stars-orange)](https://github.com/obra/superpowers)

**Total: 94.8k GitHub Stars**

---

## 🚀 Quick Install

### Windows (PowerShell)
```powershell
git clone https://github.com/YOUR_USERNAME/opencode-dotfiles.git
cd opencode-dotfiles
.\install.ps1
```

### Linux / macOS
```bash
git clone https://github.com/YOUR_USERNAME/opencode-dotfiles.git
cd opencode-dotfiles
chmod +x install.sh
./install.sh
```

### One-liner (Linux/macOS)
```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/opencode-dotfiles/main/install.sh | bash
```

---

## 📦 What's Included

### From Oh My OpenCode (28.6k ⭐)
- 멀티모델 오케스트레이션 (GPT/Gemini/Claude)
- 백그라운드 병렬 에이전트
- LSP/AST-Grep 도구
- Todo Continuation Enforcer

### From SuperClaude (20.7k ⭐)
| 커맨드 | 용도 |
|--------|------|
| `/research` | 딥 웹 리서치 (멀티홉 검색) |
| `/brainstorm` | 구조화된 아이디어 도출 |
| `/design` | 시스템 설계 워크플로우 |
| `/pm` | 프로젝트 관리 |
| `/test` | 테스트 생성/실행 |

### From Superpowers (45.5k ⭐)
| 스킬 | 용도 |
|------|------|
| `test-driven-development` | TDD 강제 (RED-GREEN-REFACTOR) |
| `systematic-debugging` | 4단계 근본 원인 분석 |
| `using-git-worktrees` | 격리된 Git 작업 환경 |
| `verification-before-completion` | 완료 전 검증 강제 |

---

## 🎯 Auto-Activation Rules

| 상황 | 자동 활성화 |
|------|-------------|
| 코드 작성 | TDD + Verification |
| 버그 수정 | Systematic Debugging |
| 새 기능 개발 | Brainstorm → Design → Git Worktree → TDD |
| 리서치 | /research + 병렬 에이전트 |
| 프론트엔드 | frontend-ui-ux + playwright |

---

## 📁 Directory Structure

```
opencode-dotfiles/
├── README.md
├── install.sh          # Linux/macOS installer
├── install.ps1         # Windows installer
├── claude/
│   ├── CLAUDE.md       # Master guide (auto-activation rules)
│   ├── settings.json   # Claude Code settings
│   ├── mcp.json        # MCP server config
│   └── skills/
│       ├── test-driven-development/SKILL.md
│       ├── systematic-debugging/SKILL.md
│       ├── using-git-worktrees/SKILL.md
│       └── verification-before-completion/SKILL.md
└── opencode/
    ├── oh-my-opencode.json    # Agent & category config
    └── command/
        ├── research.md
        ├── brainstorm.md
        ├── design.md
        ├── pm.md
        └── test.md
```

---

## ⚙️ Installed Locations

| File | Location |
|------|----------|
| Master guide | `~/.claude/CLAUDE.md` |
| Skills | `~/.claude/skills/*/SKILL.md` |
| MCP config | `~/.claude/.mcp.json` |
| Commands | `~/.config/opencode/command/*.md` |
| Oh My OpenCode | `~/.config/opencode/oh-my-opencode.json` |

---

## 🔥 Iron Laws

### 1. TDD는 필수
```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

### 2. 근본 원인 먼저
```
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION
```

### 3. 증거 기반 완료
```
NO COMPLETION CLAIMS WITHOUT VERIFICATION EVIDENCE
```

### 4. 위임 우선
```
DELEGATE WHEN SPECIALIST AVAILABLE
```

---

## 🪄 Magic Keywords

| 키워드 | 효과 |
|--------|------|
| `ultrawork` / `ulw` | 모든 기능 최대 활성화 |
| `ultrathink` | Extended thinking (32k tokens) |

---

## 📋 Prerequisites

- [OpenCode](https://github.com/opencode-ai/opencode) 설치됨
- [Oh My OpenCode](https://github.com/code-yeongyu/oh-my-opencode) 플러그인 설치됨

---

## 🔄 Update

```bash
cd opencode-dotfiles
git pull
./install.sh  # or .\install.ps1 on Windows
```

---

## 📜 License

MIT License

---

## 🙏 Credits

- [Oh My OpenCode](https://github.com/code-yeongyu/oh-my-opencode) by code-yeongyu
- [SuperClaude](https://github.com/SuperClaude-Org/SuperClaude_Framework) by SuperClaude-Org
- [Superpowers](https://github.com/obra/superpowers) by obra

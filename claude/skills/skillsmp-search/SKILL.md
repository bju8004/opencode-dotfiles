---
name: skillsmp-search
description: Search, discover, and install AI skills from the SkillsMP marketplace. Use keyword search or AI-powered semantic search to find skills, then install them directly via the Vercel skills CLI. Use this skill when users want to find specific skills, explore available capabilities, search for solutions, or install skills to extend agent capabilities.
---

# SkillsMP Search & Install

## Overview

Provide programmatic access to the SkillsMP skills marketplace through REST API integration. This skill enables keyword-based search, AI semantic search, and automated skill installation. Search to discover community-built AI skills, then install them directly to your AI agent (Claude Code, OpenCode, Cursor, Codex, etc.) using the Vercel `skills` CLI.

## Setup

### Prerequisites

- **Python 3.8+** with `requests` library
- **Node.js 18+** with `npx` (required for skill installation)
- **SkillsMP API Key** (required for search features)

### API Key Configuration

Set the SkillsMP API key as an environment variable:

**Linux/Mac:**
```bash
export SKILLSMP_API_KEY='your_api_key_here'
```

**Windows (Command Prompt):**
```cmd
set SKILLSMP_API_KEY=your_api_key_here
```

**Windows (PowerShell):**
```powershell
$env:SKILLSMP_API_KEY='your_api_key_here'
```

To obtain an API key, visit https://skillsmp.com/docs/api and click "Generate API Key".

### Installation Dependencies

```bash
pip install -r requirements.txt
```

## When to Use This Skill

Invoke this skill when users:
- Ask to search for specific skills or capabilities (e.g., "Find a web scraping skill")
- Want to discover skills related to a topic (e.g., "What skills are available for automation?")
- Need to explore the SkillsMP marketplace programmatically
- Request natural language skill discovery (e.g., "How can I build a chatbot?")
- Want to find popular or recent skills in a specific domain
- **Want to install a skill** (e.g., "Install the frontend-design skill")
- **Need a capability they don't have** — search for it, then offer to install

## Core Capabilities

### 1. Keyword Search

Execute precise keyword-based searches with pagination and sorting options.

**Use Cases:**
- Finding skills by exact name or keyword
- Filtering results by popularity (stars) or recency
- Browsing paginated results for comprehensive discovery

**Example Invocation:**
```bash
python scripts/skillsmp_search.py keyword "web scraper" 1 20 stars
```

**Parameters:**
- Query: Search term (required)
- Page: Page number (default: 1)
- Limit: Results per page (default: 20, max: 100)
- Sort: 'stars' for popularity or 'recent' for newest

### 2. AI Semantic Search

Execute natural language queries using Cloudflare AI-powered semantic search.

**Use Cases:**
- Natural language skill discovery
- Finding skills by use case or problem description
- Semantic matching beyond exact keywords

**Example Invocation:**
```bash
python scripts/skillsmp_search.py ai "How to create a web scraper for e-commerce sites"
```

**Parameters:**
- Query: Natural language question or description (required)

### 3. Skill Installation

Install skills directly from GitHub repositories using the Vercel `skills` CLI (`npx skills add`).

**Use Cases:**
- Installing a specific skill by repository
- Installing a skill found through search
- Adding skills to a specific AI agent

**Example Invocations:**
```bash
# Install all skills from a repo
python scripts/skillsmp_search.py install vercel-labs/agent-skills

# Install a specific skill to a specific agent
python scripts/skillsmp_search.py install vercel-labs/agent-skills --skill frontend-design --agent claude-code

# Install globally
python scripts/skillsmp_search.py install owner/repo --skill my-skill --global
```

**Parameters:**
- Repository: GitHub owner/repo (required)
- `--skill`: Specific skill name within the repo (optional)
- `--agent`: Target agent (e.g., claude-code, opencode, cursor) (optional)
- `--global`: Install to user directory instead of project (optional)

### 4. Search & Install (Combined Flow)

Search for skills and install the best match in one command.

**Example Invocations:**
```bash
# AI search → install the top result
python scripts/skillsmp_search.py search-install "web scraping automation"

# Keyword search → install the 3rd result
python scripts/skillsmp_search.py search-install "SEO" --type keyword --index 2

# Search and install to specific agent
python scripts/skillsmp_search.py search-install "testing" --agent claude-code --global
```

**Parameters:**
- Query: Search query (required)
- `--type`: Search type, 'ai' (default) or 'keyword'
- `--index`: Zero-based index of result to install (default: 0 = top result)
- `--agent`: Target agent (optional)
- `--global`: Install globally (optional)

### 5. Detect Agents

Detect which AI agents are installed on the system.

**Example Invocation:**
```bash
python scripts/skillsmp_search.py detect-agents
```

## Workflow Decision Tree

```
User requests skill search or installation
    │
    ├─ Wants to install a known skill?
    │   └─ YES → Use install command directly
    │
    ├─ Exact keyword or skill name known?
    │   └─ YES → Use keyword search
    │       ├─ Need popular results? → Sort by 'stars'
    │       └─ Need latest results? → Sort by 'recent'
    │       └─ Want to install a result? → Use search-install
    │
    └─ Natural language query or use case?
        └─ YES → Use AI semantic search
            └─ Want to install a result? → Use search-install
```

## Automatic Search & Install Workflow

When a user needs a capability that isn't currently available:

1. **Detect** current agents: `python scripts/skillsmp_search.py detect-agents`
2. **Search** for relevant skills: `python scripts/skillsmp_search.py ai "description of needed capability"`
3. **Present** results to user with skill names, descriptions, and popularity
4. **Get user consent** — 반드시 사용자의 동의를 받을 것
5. **Install** approved skill: `python scripts/skillsmp_search.py install owner/repo --skill name --agent agent-name`
6. **Verify** installation succeeded

## Using the Search Script

The `scripts/skillsmp_search.py` script provides command-line access to both search methods.

### Keyword Search Examples

**Basic Search:**
```bash
python scripts/skillsmp_search.py keyword "automation"
```

**Sorted by Popularity:**
```bash
python scripts/skillsmp_search.py keyword "SEO" 1 20 stars
```

**Sorted by Recency:**
```bash
python scripts/skillsmp_search.py keyword "data analysis" 1 20 recent
```

**Paginated Results:**
```bash
# Get page 2 with 50 results per page
python scripts/skillsmp_search.py keyword "web development" 2 50
```

### AI Search Examples

**Problem-Based Search:**
```bash
python scripts/skillsmp_search.py ai "How to extract data from PDFs"
```

**Use Case Search:**
```bash
python scripts/skillsmp_search.py ai "I need to automate email responses"
```

**Feature Discovery:**
```bash
python scripts/skillsmp_search.py ai "Skills for image processing and computer vision"
```

## Integration with Workflow

### Direct Script Execution

Execute the search script directly when users request skill searches. The script handles authentication, API communication, error handling, and formatted output.

### Programmatic Integration

For Python-based workflows, import and use the functions directly:

```python
from scripts.skillsmp_search import keyword_search, ai_search

# Keyword search
results = keyword_search("automation", page=1, limit=20, sort_by="stars")

# AI search
results = ai_search("How to build a recommendation system")
```

### Error Handling

The script handles common errors automatically:
- Missing API key
- Invalid parameters
- Network failures
- API rate limits

Check the `success` field in responses:
```python
if not results.get("success", True):
    error = results.get("error", {})
    print(f"Error: {error.get('message')}")
```

## API Reference

For detailed API documentation, including authentication, endpoints, response formats, and error codes, refer to `references/api_reference.md`.

Key points:
- Base URL: `https://skillsmp.com/api/v1`
- Authentication: Bearer token (pre-configured in script)
- Rate limits: Standard API rate limiting applies
- Maximum results per page: 100

## Best Practices

1. **Choose the Right Search Method:**
   - Use keyword search when users provide specific terms
   - Use AI search for natural language questions or use cases
   - Default to AI search when query intent is unclear

2. **User Consent for Installation (MANDATORY):**
   - 특정 스킬을 설치하려는 경우, 반드시 사용자의 동의를 받을 것
   - Always show the skill name, author, and repository before installing
   - Never auto-install without explicit user approval

3. **Result Presentation:**
   - Show skill name, description, and relevance/popularity
   - Include URLs for users to explore further
   - Limit initial results to 20 for readability

4. **Pagination:**
   - Start with page 1 and default limit (20)
   - Increase limit only when users request more results
   - Use pagination for large result sets

5. **Sorting Strategy:**
   - Use 'stars' sort for general queries (shows popular, vetted skills)
   - Use 'recent' sort when users want latest capabilities
   - AI search automatically ranks by relevance

6. **Installation Strategy:**
   - Use `detect-agents` first to know which agents are available
   - Prefer project-level installation (default) over global
   - Use `--agent` to target specific agents when multiple are detected
   - Always verify installation succeeded by checking the output

## Resources

### scripts/skillsmp_search.py
Python script providing keyword search, AI search, skill installation, and agent detection functionality. Can be executed directly from command line or imported as a module.

### references/api_reference.md
Comprehensive API documentation including endpoints, authentication, request/response formats, error codes, and usage examples.

### requirements.txt
Python dependencies for the skill (requests, pytest).

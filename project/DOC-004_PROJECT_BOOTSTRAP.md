# DOC-004 — PROJECT BOOTSTRAP GUIDE

| Property | Value |
|----------|-------|
| Document ID | DOC-004 |
| Document Name | Harmony AI Project Bootstrap Guide |
| Version | 1.0.0 |
| Status | Draft |
| Owner | Project Owner |
| Maintained By | Chief Architect |
| Last Updated | 2026-07-13 |
| Related Documents | DOC-000, DOC-001, DOC-002, DOC-003, PROJECT.md |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Chief Architect|

---

# Table of Contents

## Part I — Introduction

1. Introduction
2. Development Environment
3. Required Software
4. Repository Setup
5. First-Time Project Setup

## Part II — Daily Development Workflow

6. Starting Development
7. Branching Strategy
8. Updating the Repository
9. Running the Project
10. Running Tests

## Part III — Engineering Workflow

11. Creating New Features
12. AI Development Workflow
13. Documentation Workflow
14. Commit Workflow
15. Pull Request Workflow

## Part IV — Maintenance

16. Updating Dependencies
17. Backup Strategy
18. Troubleshooting
19. Frequently Used Commands
20. Bootstrap Checklist

---

# Part I — Introduction

# Chapter 1 — Introduction

## 1.1 Purpose

This guide explains how to prepare a complete Harmony AI development environment from an empty computer.

Following this guide should result in a fully configured development environment capable of building, testing, documenting, and maintaining the Harmony AI project.

The guide is intended for both the Project Owner and future contributors.

---

## 1.2 Objectives

The objectives of this document are:

- Standardize the development environment.
- Reduce onboarding time.
- Minimize configuration errors.
- Improve consistency across development machines.
- Provide a repeatable setup process.
- Simplify future maintenance.

---

## 1.3 Intended Audience

This guide is intended for:

- Project Owner
- Human Developers
- Open Source Contributors
- AI-assisted Development Sessions

Every contributor should complete the bootstrap process before beginning implementation.

---

## 1.4 Prerequisites

Before starting, the developer should have:

- Basic knowledge of Git.
- Basic knowledge of Python.
- Visual Studio Code installed.
- Internet connection for initial setup.
- Access to the Harmony AI GitHub repository.

After the initial setup, most development activities can be performed offline.

---

## 1.5 Related Documents

This guide should be read together with:

- DOC-000 — Harmony AI Context
- DOC-001 — Operating Manual
- DOC-002 — AI Team Handbook
- DOC-003 — Development Standards
- PROJECT.md

These documents define the project's vision, governance, engineering workflow, and coding standards.

---

# Chapter 2 — Development Environment

## 2.1 Supported Operating Systems

Harmony AI is designed to be cross-platform.

Primary development platform:

- Windows 11

Supported platforms:

- Windows
- Linux
- macOS

Development should avoid platform-specific assumptions whenever practical.

---

## 2.2 Recommended Hardware

Minimum recommendations:

- Quad-core CPU
- 16 GB RAM
- SSD Storage
- 10 GB Free Disk Space

Recommended:

- 32 GB RAM
- NVMe SSD
- Multi-core processor
- Dual monitor setup

---

## 2.3 Recommended Development Tools

The standard development environment consists of:

| Tool | Purpose |
|------|---------|
| Visual Studio Code | Primary IDE |
| Git | Version Control |
| GitHub Desktop (Optional) | Git GUI |
| PowerShell | Windows Terminal |
| Python | Development |
| Flutter | Android Development |
| Docker Desktop | Future Container Support |

---

## 2.4 VS Code Extensions

Recommended extensions include:

- Python
- Pylance
- Ruff
- Black Formatter
- GitLens
- Error Lens
- Markdown All in One
- GitHub Pull Requests
- SQLite Viewer
- YAML

Install additional extensions only when they provide clear value.

---

## 2.5 Folder Layout

Recommended local workspace:

```
D:\Projects\

    HarmonyAI\

    automation\

    backups\
```

The HarmonyAI repository should remain the single source of truth for project files.

---

# Chapter 3 — Required Software

## 3.1 Required Software

Install the following software before beginning development:

| Software | Required |
|-----------|----------|
| Python 3.12+ | Yes |
| Git | Yes |
| Visual Studio Code | Yes |
| Flutter SDK | Future |
| Docker Desktop | Future |

---

## 3.2 Python

Use the project-supported Python version.

Avoid installing multiple unsupported Python versions unless required for compatibility testing.

---

## 3.3 Git

Configure Git with your preferred username and email before making commits.

Verify installation before cloning the repository.

---

## 3.4 Visual Studio Code

Visual Studio Code is the recommended integrated development environment.

Workspace settings should be committed only when appropriate for the entire team.

---

## 3.5 Verification

Verify that all required tools are installed successfully before continuing to repository setup.

---

# Chapter 4 — Repository Setup

## 4.1 Clone Repository

Clone the Harmony AI repository to the recommended workspace location.

---

## 4.2 Repository Structure

After cloning, verify that the repository structure matches the approved project layout.

Missing or unexpected files should be investigated before development begins.

---

## 4.3 Git Configuration

Verify:

- Current branch
- Remote origin
- Repository status

The working tree should be clean before beginning new work.

---

## 4.4 Initial Verification

Confirm:

- Repository opens correctly in VS Code.
- Project documentation is present.
- Git status reports no unexpected changes.

---

## 4.5 Chapter Summary

A correctly configured repository provides the foundation for all future development activities.

---

# Chapter 5 — First-Time Project Setup

## 5.1 Purpose

This chapter prepares the local development environment after the repository has been cloned.

---

## 5.2 Initial Steps

Complete the following sequence:

1. Clone the repository.
2. Open the project in VS Code.
3. Create the Python virtual environment.
4. Install project dependencies.
5. Verify project configuration.
6. Run validation commands.
7. Confirm successful setup.

---

## 5.3 Validation

Before beginning development, confirm:

- Required software installed.
- Repository synchronized.
- Documentation available.
- Development tools operational.

---

## 5.4 Chapter Summary

The first-time setup process ensures every contributor begins development from a consistent, validated environment.

---

# End of Part 1

Next:

Part 2 — Daily Development Workflow


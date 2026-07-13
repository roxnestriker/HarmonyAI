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

# Part II — Daily Development Workflow

# Chapter 6 — Starting Development

## 6.1 Purpose

This chapter defines the standard procedure for starting a development session.

Following a consistent startup process reduces mistakes, ensures the local repository is up to date, and provides awareness of the current project status.

---

## 6.2 Daily Startup Routine

Before beginning any implementation work, complete the following sequence:

1. Open the Harmony AI workspace.
2. Open PROJECT.md.
3. Review the current milestone.
4. Review the current task.
5. Pull the latest repository changes.
6. Verify the active branch.
7. Review assigned documentation.
8. Begin development.

---

## 6.3 Review Current Status

Before writing code, review:

- Current milestone
- Current sprint
- Open issues
- Pending pull requests
- Known technical debt
- Architecture Decision Records (ADRs)

Understanding the current project state reduces duplication and conflicting changes.

---

## 6.4 Verify Development Environment

Confirm:

- Virtual environment is active.
- Required dependencies are installed.
- Repository is synchronized.
- No unexpected local changes exist.

---

## 6.5 Session Goals

Every development session should have a clearly defined objective.

Examples:

- Implement one feature.
- Fix one defect.
- Improve one module.
- Update one document.

Avoid working on multiple unrelated tasks simultaneously.

---

## 6.6 Chapter Summary

A structured startup routine establishes consistency and reduces development errors.

---

# Chapter 7 — Branching Strategy

## 7.1 Purpose

Harmony AI uses Git to manage source code and documentation.

A consistent branching strategy improves collaboration and protects the stability of the main branch.

---

## 7.2 Primary Branches

The repository maintains the following permanent branches:

- main
- develop

Future release branches may be introduced as the project grows.

---

## 7.3 Feature Branches

Every new feature should be developed in its own branch.

Naming convention:

```
feature/<feature-name>
```

Examples:

```
feature/library-scanner

feature/metadata-parser

feature/cloud-sync
```

---

## 7.4 Bug Fix Branches

Naming convention:

```
bugfix/<issue-name>
```

Examples:

```
bugfix/duplicate-detection

bugfix/database-lock
```

---

## 7.5 Documentation Branches

Naming convention:

```
docs/<document-name>
```

Examples:

```
docs/doc-005

docs/user-guide
```

---

## 7.6 Branch Lifecycle

Typical workflow:

```
develop

↓

Create Feature Branch

↓

Implementation

↓

Review

↓

QA

↓

Merge into develop

↓

Release

↓

Merge into main
```

---

## 7.7 Branch Protection

The main branch should remain stable.

Direct commits to the main branch should be avoided except for approved releases.

---

## 7.8 Chapter Summary

A disciplined branching strategy improves collaboration, traceability, and release quality.

---

# Chapter 8 — Updating the Repository

## 8.1 Purpose

Keeping the local repository synchronized reduces merge conflicts and ensures contributors work with the latest approved changes.

---

## 8.2 Before Starting Work

Before beginning implementation:

- Pull latest changes.
- Review commit history.
- Verify branch status.
- Resolve outstanding merge conflicts.

---

## 8.3 During Development

Commit changes regularly.

Small, focused commits are preferred over large commits containing unrelated changes.

---

## 8.4 Before Ending the Day

Before finishing a session:

- Commit completed work.
- Push changes.
- Update PROJECT.md if required.
- Verify repository status.

---

## 8.5 Chapter Summary

Frequent synchronization keeps the project healthy and minimizes integration issues.

---

# Chapter 9 — Running the Project

## 9.1 Purpose

Every contributor should be able to verify that the application starts correctly after making changes.

---

## 9.2 Startup Verification

Before implementing new features:

- Activate the virtual environment.
- Verify dependencies.
- Run the application.
- Confirm there are no startup errors.

---

## 9.3 Validation

After implementation:

Verify:

- Application launches.
- New functionality operates correctly.
- Existing functionality remains unaffected.

---

## 9.4 Smoke Testing

Perform a quick smoke test after significant changes.

Typical checks include:

- Application startup
- Database connection
- Library loading
- User interface responsiveness

---

## 9.5 Chapter Summary

Frequent execution of the application helps identify problems early in the development cycle.

---

# Chapter 10 — Running Tests

## 10.1 Purpose

Testing verifies that Harmony AI behaves according to approved requirements.

All contributors should execute appropriate tests before submitting changes.

---

## 10.2 Test Types

Harmony AI includes:

- Unit Tests
- Integration Tests
- Functional Tests
- Regression Tests
- Performance Tests

---

## 10.3 Test Workflow

Standard testing process:

```
Implementation

↓

Unit Tests

↓

Integration Tests

↓

Regression Tests

↓

QA

↓

Merge
```

---

## 10.4 Failed Tests

If a test fails:

1. Investigate the cause.
2. Correct the issue.
3. Re-run affected tests.
4. Verify no regressions.

Never ignore failing tests.

---

## 10.5 Before Commit

Before committing changes, verify:

☐ Tests completed

☐ No failing tests

☐ Documentation updated

☐ Code formatted

☐ Linting passed

---

## 10.6 Chapter Summary

Routine testing ensures Harmony AI remains reliable as the project grows.

---

# End of Part 2

Next:

# Part III — Engineering Workflow

Chapters:

11. Creating New Features

12. AI Development Workflow

13. Documentation Workflow

14. Commit Workflow

15. Pull Request Workflow
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

# Part III — Engineering Workflow

# Chapter 11 — Creating New Features

## 11.1 Purpose

Harmony AI follows a structured engineering workflow for every new feature.

Features should be designed, documented, reviewed, implemented, tested, and documented before being considered complete.

Following a consistent workflow improves software quality, reduces technical debt, and simplifies future maintenance.

---

## 11.2 Feature Development Lifecycle

Every feature should progress through the following stages:

```
Idea

↓

Requirements

↓

Architecture

↓

Database Design (if required)

↓

API Design (if required)

↓

UI Design (if required)

↓

Implementation Prompt

↓

Implementation

↓

Code Review

↓

Quality Assurance

↓

Documentation

↓

Git Commit

↓

Project Dashboard Update
```

No implementation should bypass these stages without approval.

---

## 11.3 Feature Documentation

Before implementation begins, the following documents should exist where applicable:

- Product Requirements Document (PRD)
- Architecture Specification
- Database Design
- API Specification
- UI Specification
- Acceptance Criteria

Documentation becomes the reference for implementation.

---

## 11.4 Feature Completion

A feature is considered complete only when:

- Requirements are satisfied.
- Tests pass.
- Documentation is updated.
- Code review is approved.
- QA is completed.
- PROJECT.md reflects the new status.

---

## 11.5 Chapter Summary

Following a structured feature lifecycle ensures consistent engineering quality throughout the Harmony AI project.

---

# Chapter 12 — AI Development Workflow

## 12.1 Purpose

Harmony AI uses multiple AI roles working independently but collaboratively.

Each AI performs a specialized engineering function.

---

## 12.2 Standard AI Workflow

```
Chief Architect

↓

Prompt Engineer

↓

Implementation Engineer

↓

Code Reviewer

↓

QA Engineer

↓

Documentation Engineer

↓

Project Owner
```

Each role produces documented outputs for the next role.

---

## 12.3 AI Session Startup

Before beginning work, every AI session should:

1. Read DOC-000.
2. Read DOC-001.
3. Read DOC-002.
4. Read DOC-003.
5. Read PROJECT.md.
6. Review assigned task.
7. Confirm deliverables.

---

## 12.4 AI Deliverables

Each AI session should produce:

- Completed assigned task.
- Updated documentation (if required).
- Summary of work completed.
- Known issues.
- Recommended next step.

---

## 12.5 AI Session Completion

Before ending a session:

☐ Deliverables complete

☐ Documentation updated

☐ Known issues recorded

☐ Handoff prepared

☐ Next task identified

---

## 12.6 Chapter Summary

A structured AI workflow ensures continuity and consistency across independent AI conversations.

---

# Chapter 13 — Documentation Workflow

## 13.1 Purpose

Documentation evolves alongside implementation.

Every engineering change should be reflected in the project's documentation.

---

## 13.2 Documentation Process

Standard workflow:

```
Requirement

↓

Implementation

↓

Review

↓

Documentation Update

↓

Commit
```

---

## 13.3 Required Documentation Updates

Depending on the change, update:

- PROJECT.md
- Changelog
- User Guide
- Developer Guide
- Architecture Documents
- API Documentation
- Database Documentation

---

## 13.4 Documentation Quality

Documentation should be:

- Accurate
- Complete
- Up to date
- Easy to understand
- Consistent

---

## 13.5 Chapter Summary

Keeping documentation synchronized with implementation preserves project knowledge and simplifies future development.

---

# Chapter 14 — Commit Workflow

## 14.1 Purpose

Git commits provide a permanent history of project changes.

Commits should be meaningful, focused, and traceable.

---

## 14.2 Commit Principles

Each commit should:

- Represent one logical change.
- Include a clear message.
- Be reviewable.
- Build successfully.

Avoid mixing unrelated work in a single commit.

---

## 14.3 Commit Message Format

Harmony AI uses the following format:

```
type: short description
```

Examples:

```
feat: add library scanner

fix: resolve metadata parsing issue

docs: update project roadmap

refactor: simplify repository implementation

test: add metadata parser tests

chore: update dependencies
```

---

## 14.4 Before Commit

Verify:

☐ Code formatted

☐ Tests passed

☐ Documentation updated

☐ No debug code

☐ No temporary files

---

## 14.5 Chapter Summary

Consistent commits improve traceability and simplify collaboration.

---

# Chapter 15 — Pull Request Workflow

## 15.1 Purpose

Pull Requests provide a structured review process before changes are merged.

They improve quality through discussion and review.

---

## 15.2 Pull Request Process

Standard workflow:

```
Feature Branch

↓

Self Review

↓

Code Review

↓

QA

↓

Approval

↓

Merge
```

---

## 15.3 Pull Request Checklist

Before opening a Pull Request:

☐ Feature complete

☐ Tests passing

☐ Documentation updated

☐ PROJECT.md updated

☐ Commit history reviewed

☐ No merge conflicts

---

## 15.4 Merge Requirements

Changes should only be merged after:

- Code Review approval
- QA approval
- Documentation completion

---

## 15.5 Chapter Summary

A structured Pull Request process protects the quality and stability of Harmony AI.

---

# End of Part 3

Next:

# Part IV — Maintenance

# Chapter 16 — Updating Dependencies

## 16.1 Purpose

Software dependencies evolve over time.

Regular updates improve security, compatibility, performance, and long-term maintainability.

Harmony AI should update dependencies in a controlled and documented manner.

---

## 16.2 Update Policy

Dependencies should be reviewed periodically.

Review categories include:

- Security updates
- Bug fixes
- Performance improvements
- Major version upgrades
- Deprecated libraries

Major upgrades should be evaluated before adoption.

---

## 16.3 Update Process

Standard dependency update workflow:

```
Check for Updates

↓

Review Release Notes

↓

Create Feature Branch

↓

Update Dependencies

↓

Run Tests

↓

Review

↓

Merge
```

---

## 16.4 Validation

After updating dependencies verify:

- Application starts successfully.
- Tests pass.
- Documentation remains accurate.
- No deprecated APIs are introduced.

---

## 16.5 Chapter Summary

Controlled dependency management reduces technical risk while keeping Harmony AI current.

---

# Chapter 17 — Backup Strategy

## 17.1 Purpose

Project assets should be protected against accidental loss or corruption.

The GitHub repository serves as the primary backup, supported by local copies where appropriate.

---

## 17.2 Repository Backup

Every completed task should be:

- Committed locally.
- Pushed to GitHub.
- Verified after synchronization.

The GitHub repository is the authoritative source for project history.

---

## 17.3 Local Backups

Recommended local backup locations include:

```
D:\Projects\backups\
```

Backup items include:

- Repository clone
- Documentation
- Automation scripts
- Configuration files

---

## 17.4 Recovery

In the event of data loss:

1. Clone the latest repository.
2. Restore local configuration if necessary.
3. Verify project integrity.
4. Resume development.

---

## 17.5 Chapter Summary

A reliable backup strategy protects the project's long-term continuity.

---

# Chapter 18 — Troubleshooting

## 18.1 Purpose

Development issues should be resolved systematically.

Documenting common problems reduces repeated troubleshooting effort.

---

## 18.2 General Process

When a problem occurs:

1. Identify the issue.
2. Review recent changes.
3. Consult project documentation.
4. Reproduce the issue.
5. Apply corrective action.
6. Verify the solution.

---

## 18.3 Common Issues

Examples include:

- Git merge conflicts
- Dependency installation failures
- Virtual environment problems
- Python version mismatches
- Missing configuration files

---

## 18.4 Reporting Issues

When reporting an issue include:

- Description
- Steps to reproduce
- Expected behavior
- Actual behavior
- Environment details
- Relevant logs

---

## 18.5 Chapter Summary

A structured troubleshooting process improves efficiency and preserves engineering knowledge.

---

# Chapter 19 — Frequently Used Commands

## 19.1 Purpose

This chapter lists commonly used commands during development.

Commands should be reviewed periodically as the project evolves.

---

## 19.2 Git Commands

Typical commands include:

```
git status

git pull

git add .

git commit -m "message"

git push

git branch

git checkout
```

---

## 19.3 Python Commands

Typical commands include:

```
python --version

python -m venv .venv

pip install -r requirements.txt

pytest
```

---

## 19.4 Development Commands

As Harmony AI grows, this section should include commands for:

- Running the desktop application
- Running the API
- Running tests
- Formatting code
- Static analysis
- Documentation generation

---

## 19.5 Chapter Summary

Maintaining a list of common commands improves productivity and simplifies onboarding.

---

# Chapter 20 — Bootstrap Checklist

## 20.1 Purpose

This checklist confirms that a contributor has successfully completed the Harmony AI bootstrap process.

---

## 20.2 Environment Checklist

☐ Python installed

☐ Git installed

☐ Visual Studio Code installed

☐ Required extensions installed

☐ Repository cloned

☐ Virtual environment created

☐ Dependencies installed

---

## 20.3 Project Checklist

☐ Repository synchronized

☐ Documentation available

☐ PROJECT.md reviewed

☐ Development Standards reviewed

☐ AI Team Handbook reviewed

☐ Operating Manual reviewed

---

## 20.4 Verification Checklist

☐ Project opens successfully

☐ Tests execute successfully

☐ Git status clean

☐ Development environment operational

---

## 20.5 Ready to Develop

A contributor is ready to begin development when:

- Environment setup is complete.
- Documentation has been reviewed.
- Repository is synchronized.
- Development tools are operational.
- Current project status is understood.

---

## 20.6 Final Summary

The Project Bootstrap Guide provides a standardized process for preparing and maintaining the Harmony AI development environment.

Following this guide ensures that all contributors begin development from a consistent foundation, reducing configuration issues and improving engineering efficiency.

---

# Document Approval

## Status

Current Status:

Draft

This document shall become **Approved** after review and acceptance by the Project Owner.

---

## Approval Record

| Role | Name | Status |
|------|------|--------|
| Project Owner | Project Owner | Pending |
| Chief Architect | Chief Architect | Approved |

---

## Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Chief Architect|

---

# End of Document

**DOC-004 — Project Bootstrap Guide**

Version 1.0.0

End of File
# DOC-000 — HARMONY AI CONTEXT

| Property | Value |
|----------|-------|
| Document ID | DOC-000 |
| Document Name | Harmony AI Context |
| Version | 1.0.0 |
| Status | Approved |
| Owner | Project Owner |
| Maintained By | Chief Architect |
| Last Updated | 2026-07-12 |

---

# 1. Purpose

This document serves as the single source of truth for all AI assistants, contributors, developers, reviewers, and future maintainers working on the Harmony AI project.

Before performing any task, every AI role and contributor must read and follow this document together with the relevant engineering manuals.

This document defines the project's identity, vision, architecture, constraints, engineering philosophy, communication rules, and development workflow.

---

# 2. Project Identity

Project Name

Harmony AI

Project Type

Offline-first AI-powered personal music ecosystem.

Repository

HarmonyAI

License

Open Source

Primary Platform

Windows

Secondary Platforms

Android

Future Platforms

Linux

macOS

Fire TV

Web Dashboard

---

# 3. Project Vision

Harmony AI aims to become one of the most advanced open-source personal music management ecosystems.

The project focuses on managing a personal music collection while preserving privacy, maintaining original audio quality, and providing intelligent AI-assisted organization and discovery.

Harmony AI is designed to enhance an existing music library. It does not download or bypass copyrighted streaming services.

---

# 4. Core Principles

The project shall always be:

- Offline First
- Privacy Focused
- Open Source
- Cross Platform
- Modular
- Plugin Based
- Scalable
- Maintainable
- Extensible
- AI Assisted
- High Performance
- Production Ready

---

# 5. Project Goals

The project will eventually include:

- Library Management
- Metadata Management
- Album Art Management
- Lyrics Management
- Duplicate Detection
- Artist Management
- Genre Management
- Smart Search
- Recommendation Engine
- Playlist Generation
- Cloud Synchronization
- Android Companion
- Desktop Application
- REST API
- Plugin System
- Statistics Dashboard
- Voice Assistant
- Local AI Assistant
- Semantic Search

---

# 6. Technology Stack

Programming Language

Python

Desktop

PySide6

API

FastAPI

Database

SQLite

ORM

SQLAlchemy

Metadata

Mutagen

Metadata Sources

MusicBrainz

Audio Processing

FFmpeg

Similarity

RapidFuzz

Testing

PyTest

Formatting

Black

Linting

Ruff

Documentation

MkDocs

Version Control

Git

Hosting

GitHub

CI/CD

GitHub Actions

Containerization

Docker

---

# 7. Architecture Philosophy

Harmony AI follows:

- Clean Architecture
- SOLID Principles
- Domain-Driven Design (Lightweight)
- Repository Pattern
- Dependency Injection where appropriate
- Event-Driven Communication
- Plugin-Oriented Design
- API-First Thinking

Modules should communicate through interfaces and events whenever possible.

Avoid tight coupling.

---

# 8. Development Philosophy

Never rush into implementation.

Every feature follows the same lifecycle:

1. Requirements
2. Discussion
3. Research
4. Architecture
5. Database Design
6. API Design
7. UI Design
8. Prompt Generation
9. Implementation
10. Review
11. Testing
12. Documentation
13. Optimization
14. Release

No stage should be skipped.

---

# 9. AI Collaboration Model

Harmony AI uses multiple specialized AI threads.

Each thread has a dedicated responsibility.

Examples include:

- Chief Architect
- Implementation Engineer
- Code Reviewer
- QA Engineer
- Debugging Specialist
- Database Architect
- DevOps Engineer
- Documentation Engineer
- UI Designer
- AI Engineer
- Research Lab

No AI role may modify project architecture without approval from the Chief Architect thread.

---

# 10. Source of Truth

The Git repository is the only authoritative source of project information.

Chat conversations are temporary working sessions.

Every important decision must eventually be recorded inside the repository.

---

# 11. Documentation Hierarchy

Priority:

1. DOC-000_HARMONY_AI_CONTEXT.md
2. DOC-001_OPERATING_MANUAL.md
3. DOC-002_AI_TEAM_HANDBOOK.md
4. DOC-003_DEVELOPMENT_STANDARDS.md
5. Architecture Decision Records
6. Feature Specifications
7. Project Dashboard

---

# 12. Coding Philosophy

All production code must:

- Use type hints.
- Follow SOLID.
- Be modular.
- Be reusable.
- Include logging.
- Include documentation.
- Include error handling.
- Include unit tests.
- Avoid duplicated code.
- Avoid unnecessary dependencies.

---

# 13. Documentation Philosophy

Documentation is part of the product.

Documentation must evolve together with the codebase.

Every major feature must update documentation before being considered complete.

---

# 14. Repository Philosophy

The repository represents the entire software company.

Everything required to understand, develop, test, document, and release Harmony AI should exist within the repository whenever practical.

---

# 15. Prompt Engineering Philosophy

AI prompts are project assets.

Reusable prompts shall be stored inside the repository.

Prompts must be version controlled.

Prompts should continuously improve over time.

---

# 16. Decision Management

Major architectural decisions shall be recorded as Architecture Decision Records (ADR).

Experimental ideas shall first become RFCs before implementation.

---

# 17. Definition of Success

Harmony AI succeeds when it provides an exceptional offline music management experience while remaining:

- Private
- Fast
- Beautiful
- Intelligent
- Maintainable
- Community Friendly
- Extensible
- Reliable

---

# 18. AI Instructions

Every AI working on Harmony AI must:

- Read this document before starting work.
- Respect project architecture.
- Avoid unnecessary complexity.
- Prefer maintainability over cleverness.
- Explain important decisions.
- Produce production-quality outputs.
- Keep long-term scalability in mind.
- Never bypass documented engineering standards.

---

# 19. Revision History

| Version | Date | Description |
|----------|------|-------------|
| 1.0.0 | 2026-07-12 | Initial project context document. |
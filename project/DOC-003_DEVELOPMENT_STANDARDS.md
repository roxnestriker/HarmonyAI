# DOC-003 — DEVELOPMENT STANDARDS

| Property | Value |
|----------|-------|
| Document ID | DOC-003 |
| Document Name | Harmony AI Development Standards |
| Version | 1.0.0 |
| Status | Draft |
| Owner | Project Owner |
| Maintained By | Chief Architect |
| Last Updated | 2026-07-13 |
| Related Documents | DOC-000, DOC-001, DOC-002, DOC-004, PROJECT.md |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Chief Architect|

---

# Table of Contents

## Part I — Foundation

1. Introduction
2. Development Philosophy
3. Engineering Principles
4. Project Structure
5. Naming Conventions

## Part II — Python Standards

6. Python Style Guide
7. Type Hints
8. Documentation Standards
9. Module Organization
10. Import Rules

## Part III — Architecture Standards

11. Clean Architecture
12. SOLID Principles
13. Repository Pattern
14. Dependency Injection
15. Event-Driven Architecture

## Part IV — Coding Standards

16. Logging Standards
17. Error Handling
18. Configuration Management
19. Constants & Enumerations
20. Exception Design

## Part V — Quality Standards

21. Testing Standards
22. Code Review Standards
23. Performance Standards
24. Security Standards
25. Definition of Done

## Part VI — Templates & Checklists

26. File Template
27. Module Template
28. Class Template
29. Function Template
30. Implementation Checklist

---

# Part I — Foundation

# Chapter 1 — Introduction

## 1.1 Purpose

This document defines the software engineering standards used throughout the Harmony AI project.

The objective is to establish consistent development practices that improve maintainability, readability, scalability, reliability, and long-term sustainability.

Every implementation, regardless of size, shall follow the standards defined within this document.

---

## 1.2 Scope

These standards apply to all project artifacts, including:

- Python source code
- Configuration files
- Database models
- API implementations
- Desktop application
- AI modules
- Automation scripts
- Unit tests
- Integration tests
- Documentation examples

Any deviation from these standards should be documented and approved by the Chief Architect.

---

## 1.3 Objectives

The Development Standards aim to:

- Promote consistent coding practices.
- Reduce technical debt.
- Improve collaboration.
- Simplify code reviews.
- Increase software quality.
- Encourage reusable components.
- Support long-term maintenance.
- Reduce defects through disciplined engineering.

---

## 1.4 Audience

This document is intended for:

- Project Owner
- Human Developers
- AI Implementation Engineers
- Code Review Engineers
- QA Engineers
- Open Source Contributors

Every contributor is expected to understand and follow these standards before contributing to the project.

---

## 1.5 Relationship to Other Documents

This document complements:

- **DOC-000** — Project Context
- **DOC-001** — Operating Manual
- **DOC-002** — AI Team Handbook
- **DOC-004** — Project Bootstrap Guide
- **PROJECT.md** — Current Project Status

Where conflicts arise, document precedence follows the hierarchy defined in **DOC-001**.

---

# Chapter 2 — Development Philosophy

## 2.1 Philosophy Statement

Harmony AI is developed as a professional software product rather than a collection of scripts.

Every engineering decision should prioritize long-term maintainability over short-term convenience.

Software quality is achieved through disciplined engineering practices rather than extensive post-development correction.

---

## 2.2 Core Principles

Development within Harmony AI follows these principles:

- Simplicity
- Readability
- Maintainability
- Modularity
- Reusability
- Testability
- Scalability
- Reliability

These principles guide every implementation decision.

---

## 2.3 Documentation First

Development begins with documentation.

Before implementation starts, the following should be completed when applicable:

- Requirements
- Architecture
- Database Design
- API Design
- UI Design
- Acceptance Criteria
- Implementation Prompt

Implementation without adequate planning is discouraged.

---

## 2.4 Small, Incremental Changes

Features should be developed in small, manageable increments.

Each change should:

- Solve one problem.
- Be independently testable.
- Be reviewable.
- Be reversible if necessary.

Large, unrelated changes should be avoided.

---

## 2.5 Code as a Long-Term Asset

Source code should remain understandable years after it is written.

Engineers should write code that is easy to maintain by future contributors rather than optimized solely for the original author.

---

# Chapter 3 — Engineering Principles

## 3.1 General Principles

Every implementation should strive for:

- Low coupling
- High cohesion
- Separation of concerns
- Clear responsibilities
- Predictable behavior

---

## 3.2 SOLID Compliance

Where applicable, implementations should follow:

- Single Responsibility Principle
- Open/Closed Principle
- Liskov Substitution Principle
- Interface Segregation Principle
- Dependency Inversion Principle

SOLID should guide design decisions rather than become a rigid constraint.

---

## 3.3 Clean Architecture

Business logic should remain independent of:

- User Interface
- Database
- Frameworks
- External APIs
- Cloud Providers

Infrastructure should depend on business rules, not the other way around.

---

## 3.4 Modularity

Modules should:

- Have one primary responsibility.
- Expose well-defined interfaces.
- Minimize dependencies.
- Be independently testable.

---

## 3.5 Reusability

Reusable components are preferred over duplicated implementations.

Whenever practical, functionality should be shared through common libraries rather than copied between modules.

---

# Chapter 4 — Project Structure

## 4.1 Purpose

A consistent project structure improves discoverability, maintainability, and onboarding.

All contributors should respect the approved repository organization.

---

## 4.2 Top-Level Organization

The repository is organized into functional areas such as:

- `apps/`
- `packages/`
- `docs/`
- `project/`
- `prompts/`
- `automation/`
- `scripts/`
- `tests/`
- `assets/`
- `tools/`

Each directory has a clearly defined responsibility.

---

## 4.3 Module Organization

Each module should contain, where applicable:

- Source code
- Tests
- Configuration
- Documentation
- Examples

Modules should remain self-contained and easy to navigate.

---

## 4.4 Separation of Concerns

Application layers should be separated logically.

Examples include:

- Domain
- Application
- Infrastructure
- Presentation

Cross-layer dependencies should follow the project's architecture.

---

# Chapter 5 — Naming Conventions

## 5.1 General Principles

Names should be:

- Descriptive
- Consistent
- Concise
- Unambiguous

Avoid abbreviations unless they are widely recognized.

---

## 5.2 Naming Standards

| Item | Convention | Example |
|------|------------|---------|
| Package | lowercase | `library` |
| Module | lowercase_with_underscores | `music_scanner.py` |
| Class | PascalCase | `LibraryScanner` |
| Function | snake_case | `scan_library()` |
| Variable | snake_case | `scan_result` |
| Constant | UPPER_CASE | `DEFAULT_TIMEOUT` |
| Private Method | Leading underscore | `_load_cache()` |
| Enum | PascalCase | `ScanStatus` |

---

## 5.3 File Naming

Files should clearly describe their purpose.

Examples:

- `library_service.py`
- `metadata_repository.py`
- `album_art_provider.py`
- `playlist_generator.py`

Avoid generic names such as:

- helper.py
- utils.py
- misc.py
- temp.py

---

## 5.4 Chapter Summary

The Foundation establishes the engineering mindset for Harmony AI.

The standards defined in this section ensure that every contributor approaches development with a consistent philosophy before addressing language-specific implementation details.

---

**End of Part 1**

**Next:** Part 2 — Python Standards
# Part II — Python Standards

# Chapter 6 — Python Style Guide

## 6.1 Purpose

This chapter defines the Python coding standards for Harmony AI.

The objective is to produce code that is readable, maintainable, testable, and consistent across the entire project.

All Python code shall follow these standards unless an approved exception exists.

---

## 6.2 Python Version

Harmony AI standardizes on:

Python 3.12+

All new code should target the project's supported Python version.

Deprecated language features should not be used.

---

## 6.3 Style Guide

Harmony AI follows:

- PEP 8
- PEP 257
- PEP 484
- PEP 526
- PEP 544 (where appropriate)

Automatic formatting is performed using:

- Black

Static analysis is performed using:

- Ruff

Formatting should never be done manually if automated tools are available.

---

## 6.4 Line Length

Maximum line length:

88 characters

Exceptions should be rare and justified.

---

## 6.5 Indentation

Use:

Four spaces

Never use tabs.

---

## 6.6 Blank Lines

Use blank lines to improve readability.

Examples:

- Between classes
- Between major functions
- Between logical sections

Avoid excessive vertical spacing.

---

## 6.7 Comments

Comments should explain:

Why something exists.

Avoid comments that merely repeat the code.

Good:

```
# Cache album artwork to reduce repeated disk access.
```

Poor:

```
# Increment counter.
counter += 1
```

---

## 6.8 TODO Comments

Temporary work should use:

```
TODO:
```

Example

```
TODO: Support DSD metadata parsing.
```

Every TODO should be traceable to a project task.

---

# Chapter 7 — Type Hints

## 7.1 Philosophy

Harmony AI uses static typing wherever practical.

Type hints improve:

- Readability
- IDE support
- Static analysis
- Refactoring
- Documentation

---

## 7.2 Required Usage

Type hints are required for:

- Function parameters
- Return values
- Public methods
- Class attributes

---

## 7.3 Collections

Use built-in generic types.

Examples:

```
list[str]

dict[str, int]

set[str]
```

Avoid legacy typing syntax unless required.

---

## 7.4 Optional Values

Use:

```
str | None
```

rather than older Optional syntax whenever supported.

---

## 7.5 Any

Avoid:

```
Any
```

unless absolutely necessary.

Unknown types should be modeled explicitly whenever practical.

---

## 7.6 Type Aliases

Complex types should be simplified using aliases.

Example:

```
SongId = int

ArtistName = str
```

---

## 7.7 Type Checking

Static type checking should be part of development.

Type errors should be resolved before merging changes.

---

# Chapter 8 — Documentation Standards

## 8.1 Philosophy

Code should be understandable through:

- Good names
- Clear structure
- Helpful documentation

Documentation complements readable code.

---

## 8.2 Docstrings

Public modules should include module docstrings.

Public classes should include class docstrings.

Public functions should include function docstrings.

---

## 8.3 Docstring Style

Harmony AI adopts:

Google Style Docstrings

Example:

```
def scan_library(path: Path) -> ScanResult:
    """
    Scan a music library.

    Args:
        path:
            Root music folder.

    Returns:
        ScanResult containing discovered files.
    """
```

---

## 8.4 Inline Documentation

Explain:

- Algorithms
- Design decisions
- Non-obvious behavior

Avoid documenting obvious implementation.

---

## 8.5 Examples

Public APIs should include examples whenever practical.

Examples improve usability.

---

# Chapter 9 — Module Organization

## 9.1 Purpose

Every module should have one clear responsibility.

Large modules should be divided into smaller components.

---

## 9.2 File Size

Target:

Less than 500 lines.

Review modules exceeding 700 lines.

Avoid "God Modules."

---

## 9.3 Class Size

Classes should represent one concept.

Very large classes should be decomposed.

---

## 9.4 Function Size

Functions should be:

- Small
- Focused
- Easy to test

Target:

Less than 40 lines.

Exceptions should be uncommon.

---

## 9.5 Public API

Expose only what consumers require.

Internal implementation should remain private.

---

## 9.6 Circular Dependencies

Circular imports should be avoided.

Shared functionality belongs in dedicated modules.

---

# Chapter 10 — Import Rules

## 10.1 Import Order

Imports should be grouped in the following order:

1. Standard Library

2. Third-Party Libraries

3. Harmony AI Packages

Separate groups with blank lines.

---

## 10.2 Wildcard Imports

Never use:

```
from module import *
```

Explicit imports improve readability.

---

## 10.3 Relative Imports

Prefer absolute imports.

Relative imports should be limited to closely related modules.

---

## 10.4 Unused Imports

Unused imports should be removed.

Static analysis should report them.

---

## 10.5 Import Aliases

Aliases should only be used when they improve readability.

Avoid unnecessary abbreviations.

---

## 10.6 Optional Dependencies

Optional dependencies should be isolated.

Core functionality should remain operational whenever possible.

---

## 10.7 Lazy Imports

Lazy imports may be used to:

- Improve startup time.
- Reduce optional dependencies.
- Avoid circular imports.

Use only when justified.

---

## 10.8 Chapter Summary

The Python Standards establish a consistent coding style across Harmony AI.

Following these standards improves readability, maintainability, tooling support, and long-term software quality while reducing unnecessary variation between contributors.

---

**End of Part 2**

**Next: Part 3 — Architecture Standards**

# Part III — Architecture Standards

# Chapter 11 — Clean Architecture

## 11.1 Purpose

Harmony AI adopts Clean Architecture to ensure that business rules remain independent of frameworks, user interfaces, databases, and external services.

This architecture enables long-term maintainability, testability, and flexibility.

---

## 11.2 Architecture Philosophy

Business rules represent the heart of the application.

External technologies are implementation details and should not influence business logic.

Harmony AI is designed so that technologies may change without requiring changes to the core application logic.

---

## 11.3 Architectural Layers

Harmony AI consists of four primary layers.

```
Presentation

↓

Application

↓

Domain

↓

Infrastructure
```

Dependencies always point inward.

---

## 11.4 Domain Layer

The Domain Layer contains:

- Business Entities
- Value Objects
- Business Rules
- Interfaces
- Domain Services

The Domain Layer must not depend upon:

- Database
- GUI
- FastAPI
- SQLAlchemy
- Flutter
- PySide6
- AI Providers

---

## 11.5 Application Layer

The Application Layer coordinates business operations.

Responsibilities include:

- Use Cases
- Commands
- Queries
- Services
- Validation
- Workflow orchestration

Application logic may depend on Domain interfaces but never Infrastructure implementations.

---

## 11.6 Infrastructure Layer

Infrastructure contains implementation details.

Examples:

- SQLite
- SQLAlchemy
- File System
- MusicBrainz
- FFmpeg
- Cloud Providers
- Logging
- Configuration
- Repository Implementations

Infrastructure depends on Application and Domain.

---

## 11.7 Presentation Layer

Presentation provides user interaction.

Examples:

- Desktop UI
- Android UI
- REST API
- CLI
- Future Web Interface

Presentation should remain thin.

Business logic belongs elsewhere.

---

## 11.8 Dependency Rule

Dependencies shall always move toward the Domain Layer.

Never allow:

Domain

↓

Infrastructure

Correct:

Infrastructure

↓

Domain

---

## 11.9 Layer Communication

Layers communicate through:

- Interfaces
- DTOs
- Commands
- Events

Avoid exposing implementation details across layers.

---

## 11.10 Chapter Summary

Clean Architecture separates business logic from implementation details, ensuring Harmony AI remains flexible and maintainable throughout its lifetime.

---

# Chapter 12 — SOLID Principles

## 12.1 Purpose

SOLID principles improve software quality by encouraging maintainable, extensible, and testable designs.

Harmony AI uses SOLID as architectural guidance rather than rigid rules.

---

## 12.2 Single Responsibility Principle

Every class should have one primary responsibility.

Avoid classes responsible for:

- Database
- UI
- Business Logic
- Logging
- Configuration

simultaneously.

---

## 12.3 Open / Closed Principle

Software should be:

Open for extension.

Closed for modification.

Prefer extension mechanisms such as:

- Plugins
- Interfaces
- Strategy Pattern
- Configuration

---

## 12.4 Liskov Substitution Principle

Derived classes should behave consistently with their base classes.

Consumers should not require knowledge of specific implementations.

---

## 12.5 Interface Segregation Principle

Prefer multiple small interfaces over one large interface.

Interfaces should remain focused.

---

## 12.6 Dependency Inversion Principle

Depend upon abstractions.

Avoid depending directly upon concrete implementations.

Use interfaces wherever practical.

---

## 12.7 SOLID Review Checklist

Before implementation verify:

☐ One responsibility

☐ Interfaces defined

☐ Dependencies inverted

☐ Extensible design

☐ Small focused classes

---

## 12.8 Chapter Summary

SOLID provides practical design guidance that supports Harmony AI's long-term maintainability.

---

# Chapter 13 — Repository Pattern

## 13.1 Purpose

Repositories separate business logic from data storage.

Application code should never directly access database implementations.

---

## 13.2 Responsibilities

Repositories manage:

- Retrieval
- Storage
- Updates
- Deletion
- Queries

Business logic remains outside repositories.

---

## 13.3 Repository Rules

Repositories should:

- Hide persistence details.
- Return domain objects.
- Be independently testable.
- Support dependency injection.

---

## 13.4 Naming Convention

Examples:

```
SongRepository

AlbumRepository

ArtistRepository

PlaylistRepository
```

Implementation classes:

```
SQLiteSongRepository

SQLiteAlbumRepository
```

---

## 13.5 Repository Interfaces

Interfaces belong in:

Domain

Implementations belong in:

Infrastructure

---

## 13.6 Transactions

Repositories should not contain business workflows.

Transaction coordination belongs to Application Services.

---

## 13.7 Chapter Summary

The Repository Pattern isolates persistence logic and improves maintainability and testability.

---

# Chapter 14 — Dependency Injection

## 14.1 Purpose

Dependency Injection reduces coupling by supplying dependencies externally rather than creating them internally.

---

## 14.2 Benefits

Dependency Injection improves:

- Testability
- Maintainability
- Flexibility
- Modularity

---

## 14.3 Injection Methods

Preferred order:

1. Constructor Injection

2. Factory Injection

3. Method Injection

Avoid global service locators.

---

## 14.4 Object Creation

Business objects should avoid constructing dependencies directly.

Construction belongs to composition roots.

---

## 14.5 Lifetime Management

Dependencies should have clearly defined lifetimes.

Examples:

- Singleton
- Scoped
- Transient

Use the simplest lifetime that satisfies requirements.

---

## 14.6 Testing

Dependency Injection should simplify mocking during unit testing.

---

## 14.7 Chapter Summary

Dependency Injection supports modular, testable software by reducing direct dependencies between components.

---

# Chapter 15 — Event-Driven Architecture

## 15.1 Purpose

Harmony AI uses events to reduce coupling between modules.

Events allow independent components to react without direct knowledge of each other.

---

## 15.2 Event Philosophy

Publish information.

Avoid commanding unrelated modules.

Prefer notifications over direct dependencies.

---

## 15.3 Suitable Events

Examples include:

- Library Scanned
- Song Added
- Metadata Updated
- Playlist Created
- Artwork Downloaded
- Sync Completed

---

## 15.4 Event Rules

Events should:

- Be immutable.
- Be descriptive.
- Contain required context.
- Avoid unnecessary payload.

---

## 15.5 Event Naming

Use past-tense names.

Examples:

```
SongImported

MetadataUpdated

PlaylistGenerated

ArtworkCached
```

---

## 15.6 Subscribers

Subscribers should remain independent.

One event may have multiple subscribers.

Publishers should never know subscribers.

---

## 15.7 Event Bus

Future versions may introduce a centralized event bus.

All implementations should be compatible with this possibility.

---

## 15.8 Chapter Summary

Event-Driven Architecture promotes loose coupling, modularity, and extensibility, supporting Harmony AI's long-term architectural goals.

---

# End of Part 3

Next: Part 4 — Coding Standards


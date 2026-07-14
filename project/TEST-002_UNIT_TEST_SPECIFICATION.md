# TEST-002 — UNIT TEST SPECIFICATION

| Property | Value |
|----------|-------|
| Document ID | TEST-002 |
| Document Name | Unit Test Specification |
| Version | 1.0.0 |
| Status | Draft |
| Owner | QA Lead |
| Maintained By | Quality Assurance Team |
| Last Updated | 2026-07-13 |
| Related Documents | TEST-001, DOC-003, API-001, API-002, API-003 |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|QA Lead|

---

# Table of Contents

1. Purpose
2. Objectives
3. Unit Test Principles
4. Test Structure
5. Naming Conventions
6. Fixtures
7. Mocking Strategy
8. Assertions
9. Module Test Requirements
10. Code Coverage
11. Test Data
12. Failure Testing
13. Best Practices
14. Summary

---

# Chapter 1 — Purpose

## 1.1 Purpose

This document defines the standards for all unit tests within Harmony AI.

Unit tests verify the correctness of individual classes, methods, and functions in complete isolation.

External dependencies shall be replaced with mocks, stubs, or fixtures.

---

# Chapter 2 — Objectives

Unit testing shall ensure:

- Business logic correctness
- Stable APIs
- Early defect detection
- Safe refactoring
- Fast execution
- Repeatable results

Unit tests shall execute without requiring external services.

---

# Chapter 3 — Unit Test Principles

Every unit test shall be:

- Independent
- Deterministic
- Fast
- Repeatable
- Self-contained
- Easy to understand

Tests shall not depend on execution order.

---

# Chapter 4 — Test Structure

Harmony AI follows the **Arrange–Act–Assert (AAA)** pattern.

```
Arrange

↓

Act

↓

Assert
```

Each test should focus on a single behavior.

---

# Chapter 5 — Naming Conventions

## Test Files

```
test_scanner.py

test_metadata_reader.py

test_repository_artist.py

test_statistics_engine.py
```

---

## Test Classes

```
TestFolderScanner

TestMetadataValidator

TestSongRepository

TestStatisticsCalculator
```

---

## Test Methods

Use descriptive names.

Examples:

```
test_scan_detects_new_file()

test_scan_ignores_hidden_directory()

test_metadata_normalizes_artist_name()

test_repository_returns_song_by_id()

test_duplicate_confidence_is_calculated()

test_statistics_updates_incrementally()
```

---

# Chapter 6 — Fixtures

Shared fixtures shall be placed in:

```
tests/

conftest.py
```

Typical fixtures include:

- Temporary library
- Temporary SQLite database
- Mock repository
- Mock event bus
- Sample metadata
- Sample artwork
- Fake audio files

Fixtures should be reusable across modules.

---

# Chapter 7 — Mocking Strategy

Mock external dependencies including:

- Database
- File system
- Network
- Time
- Event Bus
- Configuration
- Repositories

Do NOT mock:

- Business logic
- Value objects
- Pure functions

Mocks should verify interactions where appropriate.

---

# Chapter 8 — Assertions

Assertions should verify:

- Returned values
- Object state
- Exceptions
- Events published
- Repository calls
- Collection contents

Avoid unnecessary assertions.

One behavior per test.

---

# Chapter 9 — Module Test Requirements

## Database

Test:

- CRUD operations
- Constraints
- Relationships
- Transactions
- Rollback

---

## Folder Scanner

Test:

- Directory traversal
- Ignore rules
- Extension filtering
- Change detection
- Queue generation
- Progress updates

---

## Metadata Engine

Test:

- Metadata extraction
- Normalization
- Validation
- Quality scoring
- Domain object creation

---

## Artwork Manager

Test:

- Embedded artwork extraction
- Folder artwork lookup
- Image validation
- Thumbnail generation
- Cache behavior

---

## Duplicate Detection

Test:

- Candidate generation
- Metadata comparison
- Hash comparison
- Confidence scoring
- Duplicate grouping

---

## Statistics Engine

Test:

- Aggregation
- Incremental updates
- Cache refresh
- Dashboard generation
- Report generation

---

# Chapter 10 — Code Coverage

Coverage targets:

| Module | Minimum |
|---------|----------|
| Database | 95% |
| Scanner | 90% |
| Metadata | 90% |
| Artwork | 85% |
| Duplicate Detection | 90% |
| Statistics | 85% |
| Overall | ≥90% |

Every public method should have at least one positive test.

Critical logic should also include negative tests.

---

# Chapter 11 — Test Data

Use deterministic test data.

Examples:

Artists

```
The Beatles

Pink Floyd

Daft Punk
```

Albums

```
Abbey Road

The Wall

Random Access Memories
```

Audio Files

```
song1.flac

song2.mp3

song3.m4a
```

Do not rely on production data.

---

# Chapter 12 — Failure Testing

Every module shall include failure tests.

Examples:

Database

- Constraint violation
- Transaction rollback

Scanner

- Missing folder
- Access denied

Metadata

- Corrupted tags
- Unsupported format

Artwork

- Invalid image
- Missing artwork

Duplicates

- Missing metadata
- Invalid hash

Statistics

- Empty library
- Corrupted cache

Failure paths are first-class citizens and must be tested.

---

# Chapter 13 — Best Practices

- One logical behavior per test.
- Prefer fixtures over duplicated setup.
- Keep tests small.
- Avoid hidden dependencies.
- Avoid random values unless controlled.
- Use clear assertion messages.
- Do not share mutable state.
- Refactor tests with the same care as production code.

---

# Chapter 14 — Summary

The Harmony AI unit testing strategy ensures that every component is validated independently before integration.

Consistent naming, reusable fixtures, deterministic data, and high coverage standards provide confidence that the codebase remains reliable as new functionality is added.

---

# Approval

## Status

Draft

---

# Approval Record

| Role | Status |
|------|--------|
| Project Owner | Pending |
| QA Lead | Approved |
| Chief Architect | Approved |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|QA Lead|

---

# End of Document

**TEST-002 — Unit Test Specification**

Version 1.0.0

End of File
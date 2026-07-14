# TEST-003 — INTEGRATION TEST SPECIFICATION

| Property | Value |
|----------|-------|
| Document ID | TEST-003 |
| Document Name | Integration Test Specification |
| Version | 1.0.0 |
| Status | Draft |
| Owner | QA Lead |
| Maintained By | Quality Assurance Team |
| Last Updated | 2026-07-13 |
| Related Documents | TEST-001, TEST-002, API-001, API-002, API-003, SPEC-001, SPEC-002, SPEC-003, SPEC-004, SPEC-005 |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|QA Lead|

---

# Table of Contents

1. Purpose
2. Objectives
3. Integration Test Principles
4. Test Environment
5. Component Integration Matrix
6. Workflow Test Scenarios
7. Event Integration
8. Repository Integration
9. Database Integration
10. Error Recovery
11. Data Integrity
12. Acceptance Criteria
13. Summary

---

# Chapter 1 — Purpose

## 1.1 Purpose

Integration testing verifies that Harmony AI modules communicate correctly using the interfaces defined by the architecture.

Unlike unit tests, integration tests validate complete workflows using real implementations of repositories, services, the event system, and the database.

---

# Chapter 2 — Objectives

Integration tests shall verify:

- Module interoperability
- API contract compliance
- Repository behavior
- Event propagation
- Database consistency
- Transaction integrity
- Error recovery
- End-to-end workflows

---

# Chapter 3 — Integration Test Principles

Integration tests shall:

- Use production-like components
- Minimize mocking
- Execute deterministically
- Validate observable behavior
- Verify complete workflows
- Remain repeatable

Tests shall execute against an isolated test environment.

---

# Chapter 4 — Test Environment

## Database

- SQLite (test database)
- Fresh schema before each test suite
- Alembic migrations applied

---

## File System

Temporary library structure containing:

```
Library/

    Artist/

        Album/

            Track01.flac

            Track02.flac

            cover.jpg
```

---

## Event Bus

Use the production event bus implementation with test subscribers.

---

## Configuration

Testing configuration shall be isolated from development and production settings.

---

# Chapter 5 — Component Integration Matrix

| Component A | Component B | Test Required |
|--------------|-------------|---------------|
| Folder Scanner | Metadata Engine | Yes |
| Metadata Engine | Artwork Manager | Yes |
| Metadata Engine | Repository Layer | Yes |
| Artwork Manager | Repository Layer | Yes |
| Duplicate Engine | Repository Layer | Yes |
| Statistics Engine | Repository Layer | Yes |
| Repository Layer | Database | Yes |
| Event Bus | Subscribers | Yes |
| Services | Repositories | Yes |

Every documented dependency shall have at least one integration test.

---

# Chapter 6 — Workflow Test Scenarios

## Scenario 1 — Initial Library Scan

Workflow:

```
Register Library

↓

Start Scan

↓

Discover Files

↓

Extract Metadata

↓

Extract Artwork

↓

Persist Data

↓

Update Statistics

↓

Publish Events
```

Expected Result:

Entire pipeline completes successfully.

---

## Scenario 2 — Incremental Scan

Workflow:

```
Modify File

↓

Incremental Scan

↓

Detect Change

↓

Refresh Metadata

↓

Update Database

↓

Refresh Statistics
```

Expected Result:

Only modified entities are updated.

---

## Scenario 3 — New Album Import

Workflow:

```
Copy Album

↓

Folder Scan

↓

Metadata Extraction

↓

Artwork Processing

↓

Statistics Refresh
```

Expected Result:

Album appears correctly in the library.

---

## Scenario 4 — Duplicate Detection

Workflow:

```
Library Loaded

↓

Duplicate Scan

↓

Candidate Generation

↓

Comparison

↓

Grouping

↓

Report Generation
```

Expected Result:

Duplicate groups are generated with expected confidence scores.

---

## Scenario 5 — Statistics Refresh

Workflow:

```
Library Change

↓

Incremental Statistics

↓

Dashboard Refresh
```

Expected Result:

Statistics reflect updated library state without a full rebuild.

---

# Chapter 7 — Event Integration

Verify:

- Events are published.
- Subscribers receive events.
- Subscriber failures do not prevent other subscribers.
- Event order is preserved.
- Event payloads conform to API-002.

Example events:

```
ScanCompleted

MetadataValidated

ArtworkCached

DuplicateDetected

StatisticsUpdated
```

---

# Chapter 8 — Repository Integration

Repositories shall be tested against the real database.

Verify:

- CRUD operations
- Transactions
- Rollbacks
- Constraints
- Relationships
- Query correctness

Repositories shall never expose ORM entities outside the infrastructure layer.

---

# Chapter 9 — Database Integration

Verify:

- Foreign key constraints
- Unique constraints
- Cascade rules
- Index creation
- Alembic migrations
- Schema compatibility

Database state shall remain consistent after every workflow.

---

# Chapter 10 — Error Recovery

Integration tests shall simulate:

Folder Scanner

- Missing directory
- Access denied

Metadata Engine

- Corrupted audio file
- Invalid metadata

Artwork Manager

- Missing artwork
- Corrupted image

Duplicate Engine

- Missing metadata

Statistics Engine

- Corrupted statistics cache

Expected behavior:

Recoverable failures shall affect only the current item while the overall workflow continues where appropriate.

---

# Chapter 11 — Data Integrity

Verify:

- No duplicate artists created
- No duplicate albums created
- Song relationships remain valid
- Artwork references remain valid
- Statistics remain synchronized
- Duplicate groups remain consistent

Database integrity shall be verified after each integration scenario.

---

# Chapter 12 — Acceptance Criteria

## Functional

☐ Complete library scan succeeds

☐ Incremental scan updates correctly

☐ Metadata persisted correctly

☐ Artwork processed correctly

☐ Duplicate detection works

☐ Statistics updated correctly

☐ Events delivered correctly

☐ Repository operations succeed

---

## Quality

☐ No data corruption

☐ No orphaned records

☐ No failed transactions

☐ Integration tests pass

☐ API contracts preserved

☐ Architecture unchanged

---

# Chapter 13 — Summary

Integration testing verifies that Harmony AI components work together as a complete system.

By validating real workflows across repositories, events, services, and the database, these tests ensure that independently tested modules integrate into a reliable and maintainable application.

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

## Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|QA Lead|

---

# End of Document

**TEST-003 — Integration Test Specification**

Version 1.0.0

End of File
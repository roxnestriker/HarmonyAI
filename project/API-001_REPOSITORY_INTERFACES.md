# API-001 — REPOSITORY INTERFACES

| Property | Value |
|----------|-------|
| Document ID | API-001 |
| Document Name | Repository Interfaces |
| Version | 1.0.0 |
| Status | Draft |
| Owner | Chief Architect |
| Maintained By | Architecture Team |
| Last Updated | 2026-07-13 |
| Related Documents | ARCH-001, DB-001, SPEC-001, SPEC-002, SPEC-003, SPEC-004, SPEC-005 |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Chief Architect|

---

# Table of Contents

1. Purpose
2. Design Principles
3. Repository Rules
4. Common Interface
5. Artist Repository
6. Album Repository
7. Song Repository
8. Song File Repository
9. Artwork Repository
10. Statistics Repository
11. Transaction Management
12. Error Handling
13. Future Extensions
14. Summary

---

# Chapter 1 — Purpose

## 1.1 Purpose

Repository Interfaces define the persistence contract between the Domain Layer and the Infrastructure Layer.

Repositories encapsulate all database operations and prevent business logic from depending on SQLAlchemy or SQLite.

The Domain Layer communicates exclusively through these interfaces.

---

# Chapter 2 — Design Principles

Repositories shall follow the following principles:

- Single Responsibility
- Dependency Inversion
- Interface First
- Persistence Ignorance
- Unit Test Friendly

Repositories shall expose business-oriented operations rather than SQL queries.

---

# Chapter 3 — Repository Rules

Every repository shall:

- Return domain models.
- Never expose ORM models.
- Never expose SQL statements.
- Be deterministic.
- Be independently testable.
- Support dependency injection.

Repositories shall not contain business rules.

---

# Chapter 4 — Common Repository Interface

All repositories shall support the following operations where applicable.

## Create

Creates a new entity.

---

## Update

Updates an existing entity.

---

## Delete

Removes an entity when permitted.

---

## Get By ID

Returns one entity by identifier.

---

## Exists

Returns whether an entity exists.

---

## Count

Returns the number of matching entities.

---

## List

Returns collections using pagination.

---

## Search

Returns filtered collections.

---

## Save

Persists pending changes.

---

# Chapter 5 — Artist Repository

## Responsibilities

- Find Artist
- Create Artist
- Update Artist
- Search Artist
- List Artists

---

## Operations

```
get_by_id()

get_by_name()

exists()

create()

update()

delete()

list()

search()

count()
```

---

# Chapter 6 — Album Repository

## Responsibilities

- Find Album
- Create Album
- Update Album
- Search Albums

---

## Operations

```
get_by_id()

get_by_title()

get_by_artist()

create()

update()

delete()

list()

count()
```

---

# Chapter 7 — Song Repository

## Responsibilities

- Manage Songs
- Search Songs
- Update Metadata
- Query Library

---

## Operations

```
get_by_id()

get_by_musicbrainz()

search()

create()

update()

delete()

find_duplicates()

list_recent()

count()
```

---

## Search Support

Search should support:

- Title
- Artist
- Album
- Genre
- Composer

---

# Chapter 8 — Song File Repository

## Responsibilities

- File lookup
- File updates
- Hash lookup
- Scan synchronization

---

## Operations

```
get_by_path()

get_by_hash()

mark_missing()

mark_present()

update_scan()

create()

update()

delete()
```

---

# Chapter 9 — Artwork Repository

## Responsibilities

- Store Artwork
- Retrieve Artwork
- Cache Lookup
- Thumbnail Lookup

---

## Operations

```
get_by_id()

get_by_hash()

create()

update()

delete()

get_thumbnail()

exists()
```

---

# Chapter 10 — Statistics Repository

## Responsibilities

- Store statistics
- Read statistics
- Refresh statistics
- Dashboard queries

---

## Operations

```
get()

set()

refresh()

delete()

list()

count()
```

---

# Chapter 11 — Transaction Management

Repositories shall participate in Unit of Work transactions.

```
Begin Transaction

↓

Repository Operations

↓

Commit

↓

Rollback (if required)
```

Repositories shall not commit independently unless explicitly requested.

---

# Chapter 12 — Error Handling

Repositories shall translate infrastructure exceptions into domain exceptions.

Examples:

Infrastructure

```
SQLite Error
```

↓

Domain

```
RepositoryUnavailable
```

---

Examples:

```
EntityNotFound

DuplicateEntity

ConstraintViolation

RepositoryUnavailable

TransactionFailed
```

No SQLAlchemy exceptions shall propagate beyond the Infrastructure Layer.

---

# Chapter 13 — Future Extensions

Future repositories may include:

- Playlist Repository
- Recommendation Repository
- AI Repository
- Cloud Repository
- Lyrics Repository
- Tag Repository
- User Profile Repository

The repository architecture shall support additional repositories without modifying existing interfaces.

---

# Chapter 14 — Summary

Repository Interfaces define the persistence contracts used throughout Harmony AI.

They isolate business logic from database technology, improve testability, and provide a stable API for all application services.

Every implementation of these interfaces shall conform to the architectural principles defined in ARCH-001.

---

# Approval

Status:

Draft

---

# Approval Record

| Role | Status |
|------|--------|
| Project Owner | Pending |
| Chief Architect | Approved |
| Engineering Team | Approved |

---

# End of Document

**API-001 — Repository Interfaces**

Version 1.0.0
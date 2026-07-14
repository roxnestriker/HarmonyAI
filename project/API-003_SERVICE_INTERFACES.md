# API-003 — SERVICE INTERFACES

| Property | Value |
|----------|-------|
| Document ID | API-003 |
| Document Name | Service Interfaces |
| Version | 1.0.0 |
| Status | Draft |
| Owner | Chief Architect |
| Maintained By | Architecture Team |
| Last Updated | 2026-07-13 |
| Related Documents | ARCH-001, API-001, API-002, SPEC-001, SPEC-002, SPEC-003, SPEC-004, SPEC-005 |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Chief Architect|

---

# Table of Contents

1. Purpose
2. Design Principles
3. Service Architecture
4. Common Service Rules
5. Library Service
6. Scan Service
7. Metadata Service
8. Artwork Service
9. Duplicate Detection Service
10. Statistics Service
11. Service Communication
12. Error Handling
13. Future Services
14. Summary

---

# Chapter 1 — Purpose

## 1.1 Purpose

Service Interfaces define the public application layer of Harmony AI.

Application Services coordinate workflows between repositories, domain services, and event publishing.

Services expose business use cases to clients while hiding implementation details.

---

# Chapter 2 — Design Principles

Services shall:

- Coordinate workflows
- Depend on interfaces
- Publish domain events
- Be stateless
- Support dependency injection
- Be independently testable

Services shall never contain database-specific code.

---

# Chapter 3 — Service Architecture

```
Presentation Layer

        │

        ▼

Application Services

        │

        ▼

Repositories

        │

        ▼

Database

        │

        ▼

Domain Events
```

Application Services orchestrate business operations.

Business rules remain within the Domain Layer.

---

# Chapter 4 — Common Service Rules

Every service shall:

- Validate input
- Coordinate repositories
- Publish events
- Return domain models or DTOs
- Translate infrastructure exceptions into application exceptions
- Avoid exposing ORM models

Long-running operations should report progress where applicable.

---

# Chapter 5 — Library Service

## Purpose

Coordinates high-level library management operations.

---

## Responsibilities

- Register Library
- Remove Library
- List Libraries
- Refresh Library
- Retrieve Library Information

---

## Operations

```
register_library()

remove_library()

list_libraries()

get_library()

refresh_library()

validate_library()

get_library_statistics()
```

---

# Chapter 6 — Scan Service

## Purpose

Coordinates all scanning workflows.

---

## Responsibilities

- Start Scan
- Stop Scan
- Pause Scan
- Resume Scan
- Scan Folder
- Scan File
- Monitor Progress

---

## Operations

```
start_scan()

pause_scan()

resume_scan()

cancel_scan()

scan_folder()

scan_file()

get_scan_status()

get_scan_history()
```

---

# Chapter 7 — Metadata Service

## Purpose

Coordinates metadata extraction workflows.

---

## Responsibilities

- Process Metadata
- Refresh Metadata
- Validate Metadata
- Normalize Metadata

---

## Operations

```
extract_metadata()

refresh_metadata()

validate_metadata()

normalize_metadata()

calculate_quality()

reprocess_library()
```

---

# Chapter 8 — Artwork Service

## Purpose

Coordinates artwork processing.

---

## Responsibilities

- Extract Artwork
- Refresh Artwork
- Generate Thumbnails
- Manage Artwork Cache

---

## Operations

```
extract_artwork()

refresh_artwork()

generate_thumbnail()

clear_cache()

get_artwork()

validate_artwork()
```

---

# Chapter 9 — Duplicate Detection Service

## Purpose

Coordinates duplicate analysis.

---

## Responsibilities

- Scan Library
- Analyze Songs
- Group Duplicates
- Generate Reports

---

## Operations

```
scan_duplicates()

analyze_song()

get_duplicate_groups()

get_duplicate_report()

calculate_confidence()

refresh_duplicates()
```

---

# Chapter 10 — Statistics Service

## Purpose

Coordinates statistical calculations.

---

## Responsibilities

- Refresh Statistics
- Generate Reports
- Calculate Metrics
- Retrieve Dashboard Data

---

## Operations

```
refresh_statistics()

calculate_statistics()

get_library_statistics()

get_artist_statistics()

get_album_statistics()

get_storage_statistics()

get_dashboard_data()
```

---

# Chapter 11 — Service Communication

Services communicate using:

- Repository Interfaces
- Domain Events
- Domain Models
- DTOs

Direct service-to-service dependencies should be minimized.

Where possible, services react to published events instead of invoking one another directly.

---

## Typical Workflow

```
UI

↓

Scan Service

↓

Folder Scanner

↓

Metadata Service

↓

Artwork Service

↓

Repository

↓

Statistics Service

↓

Domain Events

↓

UI Updated
```

---

# Chapter 12 — Error Handling

Services shall expose application-level exceptions.

Examples:

```
ValidationError

LibraryNotFound

ScanAlreadyRunning

MetadataProcessingFailed

ArtworkUnavailable

DuplicateAnalysisFailed

StatisticsUnavailable
```

Infrastructure exceptions shall be translated before leaving the service layer.

---

# Chapter 13 — Future Services

Future services may include:

- Recommendation Service
- Playlist Service
- Playback Service
- Cloud Synchronization Service
- User Profile Service
- Plugin Manager Service
- AI Assistant Service
- Semantic Search Service
- Notification Service

These services shall follow the same architectural principles defined in this document.

---

# Chapter 14 — Summary

Service Interfaces define the public application API for Harmony AI.

They orchestrate workflows across repositories, domain services, and event publishing while maintaining strict separation between presentation, application, domain, and infrastructure layers.

These interfaces provide a stable contract for desktop applications, future REST APIs, mobile applications, plugins, and automated workflows.

---

# Approval

## Status

Draft

---

# Approval Record

| Role | Status |
|------|--------|
| Project Owner | Pending |
| Chief Architect | Approved |
| Engineering Team | Approved |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Chief Architect|

---

# End of Document

**API-003 — Service Interfaces**

Version 1.0.0

End of File
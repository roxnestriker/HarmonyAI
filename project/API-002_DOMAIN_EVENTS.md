# API-002 — DOMAIN EVENTS

| Property | Value |
|----------|-------|
| Document ID | API-002 |
| Document Name | Domain Events |
| Version | 1.0.0 |
| Status | Draft |
| Owner | Chief Architect |
| Maintained By | Architecture Team |
| Last Updated | 2026-07-13 |
| Related Documents | ARCH-001, SPEC-001, SPEC-002, SPEC-003, SPEC-004, SPEC-005, API-001 |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Chief Architect|

---

# Table of Contents

1. Purpose
2. Event Architecture
3. Design Principles
4. Event Structure
5. Event Categories
6. Library Events
7. Metadata Events
8. Artwork Events
9. Duplicate Events
10. Statistics Events
11. Event Bus Rules
12. Error Handling
13. Event Versioning
14. Future Extensions
15. Summary

---

# Chapter 1 — Purpose

## 1.1 Purpose

Domain Events provide asynchronous communication between Harmony AI modules.

They notify interested components that a business action has completed.

Events improve modularity by removing direct dependencies between modules.

---

## 1.2 Goals

The event system shall:

- Decouple modules.
- Support asynchronous workflows.
- Enable multiple subscribers.
- Simplify future plugins.
- Support future distributed processing.

---

# Chapter 2 — Event Architecture

```
Publisher

      │

Publish Event

      │

      ▼

Event Bus

      │

 ┌────┼────┐
 ▼    ▼    ▼

Subscriber A

Subscriber B

Subscriber C
```

Publishers never know who receives the event.

Subscribers never know who published it.

---

# Chapter 3 — Design Principles

Events shall:

- Represent completed business actions.
- Be immutable.
- Contain business data only.
- Be serializable.
- Be framework independent.
- Be versioned.

Events shall never expose ORM models or infrastructure objects.

---

# Chapter 4 — Event Structure

Every event shall contain:

| Field | Description |
|-------|-------------|
| event_id | Unique identifier |
| event_name | Business event name |
| event_version | Schema version |
| occurred_at | UTC timestamp |
| correlation_id | Related workflow ID |
| source | Publishing component |
| payload | Business data |

---

## Example Structure

```
Event

↓

Header

↓

Payload

↓

Metadata
```

---

# Chapter 5 — Event Categories

Harmony AI defines the following event categories:

- Library Events
- Metadata Events
- Artwork Events
- Duplicate Events
- Statistics Events
- Playlist Events
- AI Events
- System Events

---

# Chapter 6 — Library Events

Published by the Folder Scanner and Library Manager.

Examples:

```
LibraryRegistered

LibraryRemoved

ScanStarted

ScanPaused

ScanResumed

ScanCompleted

ScanCancelled

FolderDiscovered

FileDiscovered

FileChanged

FileDeleted

QueueCreated
```

Typical subscribers:

- Metadata Engine
- Statistics Engine
- Logging
- UI

---

# Chapter 7 — Metadata Events

Published by the Metadata Engine.

Examples:

```
MetadataRead

MetadataValidated

MetadataNormalized

SongCreated

SongUpdated

ArtistCreated

AlbumCreated

GenreCreated

MetadataQualityCalculated

MetadataFailed
```

Typical subscribers:

- Artwork Manager
- Statistics Engine
- Duplicate Detection
- Repository Layer

---

# Chapter 8 — Artwork Events

Published by the Artwork Manager.

Examples:

```
ArtworkDiscovered

ArtworkExtracted

ArtworkValidated

ArtworkCached

ThumbnailGenerated

ArtworkUpdated

ArtworkMissing

ArtworkFailed
```

Typical subscribers:

- Repository Layer
- Statistics Engine
- UI

---

# Chapter 9 — Duplicate Events

Published by the Duplicate Detection Engine.

Examples:

```
DuplicateScanStarted

CandidateGenerated

DuplicateDetected

DuplicateGroupCreated

DuplicateAnalysisCompleted

DuplicateAnalysisFailed
```

Typical subscribers:

- UI
- Statistics Engine
- AI Engine (Future)

---

# Chapter 10 — Statistics Events

Published by the Statistics Engine.

Examples:

```
StatisticsCalculationStarted

StatisticsUpdated

StatisticsCompleted

LibraryStatisticsChanged

AudioStatisticsChanged

StatisticsFailed
```

Typical subscribers:

- Dashboard
- AI Engine
- Reports

---

# Chapter 11 — Event Bus Rules

The Event Bus shall:

- Deliver events in publication order.
- Support multiple subscribers.
- Isolate subscriber failures.
- Never block publishers unnecessarily.
- Log failed event deliveries.

---

## Delivery Rules

- Events are fire-and-forget.
- Subscribers process independently.
- Event handlers should be idempotent.
- Long-running work should be delegated to background processing.

---

# Chapter 12 — Error Handling

Publisher failures:

- Abort publication.
- Report error.
- Preserve transaction integrity.

Subscriber failures:

- Log error.
- Continue delivering to remaining subscribers.
- Never prevent unrelated subscribers from receiving the event.

---

# Chapter 13 — Event Versioning

Every event includes an `event_version`.

Versioning rules:

- New optional fields may be added.
- Existing required fields shall remain compatible.
- Breaking changes require a new event version.

This allows future modules and plugins to evolve independently.

---

# Chapter 14 — Future Extensions

Future event categories may include:

- Recommendation Events
- Playback Events
- Cloud Synchronization Events
- Plugin Events
- User Profile Events
- Semantic Search Events
- Notification Events
- Mobile Synchronization Events

The event architecture shall support new event categories without modifying existing contracts.

---

# Chapter 15 — Summary

Domain Events define the communication contracts between Harmony AI modules.

By using immutable, versioned business events, the architecture remains loosely coupled, extensible, and resilient.

The Event Bus enables modules to evolve independently while maintaining a consistent and predictable communication model.

---

# Approval

## Status

Draft

---

## Approval Record

| Role | Status |
|------|--------|
| Project Owner | Pending |
| Chief Architect | Approved |
| Engineering Team | Approved |

---

## Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Chief Architect|

---

# End of Document

**API-002 — Domain Events**

Version 1.0.0

End of File
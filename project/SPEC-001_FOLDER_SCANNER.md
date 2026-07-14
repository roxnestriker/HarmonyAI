# SPEC-001 — FOLDER SCANNER

| Property | Value |
|----------|-------|
| Document ID | SPEC-001 |
| Document Name | Folder Scanner Specification |
| Version | 1.0.0 |
| Status | Draft |
| Owner | Lead Software Architect |
| Maintained By | Engineering Team |
| Last Updated | 2026-07-13 |
| Related Documents | PRD-001, ARCH-001, DB-001 |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Lead Software Architect|

---

# Table of Contents

## Part A

1. Purpose
2. Scope
3. Design Goals
4. Responsibilities
5. High-Level Architecture
6. Scanner Components
7. Scan Modes
8. State Machine
9. Domain Events
10. Initial Scan Algorithm
11. Incremental Scan Algorithm
12. Folder Scan
13. File Scan
14. Change Detection

## Part B

15. File Discovery Pipeline
16. File Validation
17. Queue Manager
18. Progress Reporting
19. Error Handling
20. Performance
21. Configuration
22. Testing Strategy
23. Acceptance Criteria
24. Future Enhancements
25. Summary

# Chapter 1 — Purpose

## 1.1 Purpose

The Folder Scanner is responsible for discovering every supported audio file within one or more registered Music Library locations.

It is the first stage of the Harmony AI ingestion pipeline and provides the input for all downstream components including Metadata Engine, Artwork Manager, Duplicate Detection, Statistics Engine, and AI modules.

The Folder Scanner never reads metadata, modifies files, or writes directly to the database.

---

## 1.2 Objectives

The scanner shall:

- Discover supported audio files.
- Traverse directories recursively.
- Detect added files.
- Detect removed files.
- Detect renamed files.
- Detect modified files.
- Produce scan results.
- Publish scan events.
- Generate processing queues.
- Remain scalable for very large libraries.

---

# Chapter 2 — Scope

## Included

- Recursive directory traversal
- Multiple library roots
- Incremental scanning
- Background scanning
- Progress reporting
- Cancellation support
- File filtering
- Change detection
- Scan reporting

---

## Excluded

- Metadata extraction
- Artwork extraction
- Lyrics
- Database persistence
- Duplicate detection
- Statistics generation
- AI processing

---

# Chapter 3 — Design Goals

The scanner shall be:

- Offline First
- Cross Platform
- Thread Safe
- Event Driven
- Restartable
- Fault Tolerant
- Testable
- Extensible

Target library size:

500,000+ files.

---

# Chapter 4 — Responsibilities

The scanner owns:

- Folder traversal
- File discovery
- Scan scheduling
- Change detection
- Progress updates
- Queue creation
- Scan summaries

The scanner does NOT own:

- Metadata
- Database updates
- Artwork
- Statistics
- Recommendations

---

# Chapter 5 — High-Level Architecture

```
Library Manager

        │

        ▼

Folder Scanner

        │

        ▼

File Discovery

        │

        ▼

Validation

        │

        ▼

Change Detection

        │

        ▼

Processing Queue

        │

        ▼

Publish Events

        │

        ▼

Metadata Engine
```

The scanner only produces work.

Other modules consume it.

---

# Chapter 6 — Scanner Components

The scanner consists of the following internal components.

## Scan Controller

Coordinates the complete scan lifecycle.

Responsibilities:

- Start Scan
- Stop Scan
- Pause Scan
- Resume Scan
- Cancel Scan

---

## Directory Walker

Traverses folders recursively.

Responsibilities:

- Enumerate folders
- Enumerate files
- Ignore excluded folders
- Handle symbolic links

---

## File Filter

Determines whether a file should be processed.

Checks:

- Supported extension
- Hidden file rules
- Ignore patterns
- Temporary files

---

## Change Detector

Determines:

- New
- Updated
- Deleted
- Renamed
- Unchanged

---

## Queue Builder

Creates processing jobs.

Queues only changed files.

---

## Progress Manager

Publishes:

- Files discovered
- Files processed
- Current folder
- Current speed
- Estimated remaining time

---

## Event Publisher

Raises domain events for downstream modules.

---

# Chapter 7 — Scan Modes

Harmony AI supports multiple scan strategies.

## Full Scan

Scans every registered folder.

Use cases:

- Initial library creation
- Integrity verification

---

## Incremental Scan

Processes only changes since the previous scan.

Default mode.

---

## Folder Scan

Scans one selected folder.

Useful after importing albums.

---

## File Scan

Processes one file.

Used after drag-and-drop imports.

---

## Scheduled Scan

Runs automatically at configured intervals.

---

## Background Scan

Runs while the application is idle.

Should minimize CPU usage.

---

# Chapter 8 — Scanner State Machine

```
Idle

↓

Preparing

↓

Scanning

↓

Validating

↓

Queue Building

↓

Completed

↓

Idle
```

Possible transitions:

```
Scanning

↓

Paused

↓

Scanning

↓

Cancelled

↓

Idle

↓

Failed
```

Only one scan may actively modify scanner state at a time.

---

# Chapter 9 — Domain Events

Scanner events include:

```
ScanStarted

LibraryDiscovered

FolderDiscovered

FileDiscovered

FileIgnored

FileChanged

FileDeleted

QueueCreated

ProgressUpdated

ScanCompleted

ScanCancelled

ScanFailed
```

Events contain only business data.

No infrastructure objects are exposed.

---

# Chapter 10 — Initial Scan Algorithm

Initial Scan is performed when:

- New library created
- User requests full scan
- Database rebuilt

Workflow:

```
Register Library

↓

Traverse Directories

↓

Filter Files

↓

Validate

↓

Create Queue

↓

Publish Events

↓

Complete
```

All supported files are queued.

---

# Chapter 11 — Incremental Scan Algorithm

Incremental Scan compares the file system against the database.

Workflow:

```
Enumerate Files

↓

Lookup Existing Record

↓

Compare Timestamp

↓

Compare Size

↓

Optional Hash Check

↓

Determine Status

↓

Queue Changes
```

Possible results:

- New
- Modified
- Deleted
- Renamed
- Unchanged

Only changed files continue through the pipeline.

---

# Chapter 12 — Folder Scan

Folder Scan limits traversal to one directory.

Typical use cases:

- Newly copied album
- USB import
- Manual refresh

Behaviour:

- Recursive
- Independent
- Fast

---

# Chapter 13 — File Scan

Processes one individual file.

Typical triggers:

- Drag & Drop
- Manual Import
- File Watcher

Produces one processing request.

---

# Chapter 14 — Change Detection

The scanner determines change status using multiple comparison levels.

## Level 1

Path comparison.

Fastest.

---

## Level 2

Modified timestamp.

---

## Level 3

File size.

---

## Level 4

SHA-256 hash.

Most expensive.

Used only when required.

---

Priority order:

```
Path

↓

Timestamp

↓

File Size

↓

Hash
```

Hash calculation should be avoided unless cheaper comparisons indicate a possible change.

---

## Part A Summary

The Folder Scanner provides a scalable, event-driven mechanism for discovering music files and generating processing work for downstream modules.

Its responsibilities end once validated scan results and processing queues have been produced.

The scanner deliberately remains independent of metadata extraction, persistence, and AI logic, ensuring a clean separation of concerns and allowing future optimizations without affecting other components.

---

# End of Part A

# Part B — Processing Pipeline, Configuration & Quality

# Chapter 15 — File Discovery Pipeline

## 15.1 Purpose

The File Discovery Pipeline locates all supported audio files within registered library locations while filtering out unsupported or ignored content.

The pipeline should remain deterministic, resumable, and independent of metadata extraction.

---

## 15.2 Discovery Workflow

```
Start Scan
      │
      ▼
Load Library Locations
      │
      ▼
Validate Root Path
      │
      ▼
Enumerate Directories
      │
      ▼
Enumerate Files
      │
      ▼
Apply Ignore Rules
      │
      ▼
Apply Extension Filter
      │
      ▼
Create File Candidate
      │
      ▼
Forward to Validation Pipeline
```

---

## 15.3 Supported Extensions

Initial supported extensions:

```
.flac
.mp3
.m4a
.aac
.ogg
.opus
.wav
.aiff
.ape
.wma
```

Extension matching shall be case-insensitive.

---

## 15.4 Ignored Files

The scanner should ignore:

- Hidden operating system files
- Temporary files
- Zero-byte files
- Unsupported extensions
- Files matching user ignore patterns

Examples:

```
Thumbs.db
desktop.ini
*.tmp
*.bak
```

---

## 15.5 Ignored Directories

Examples include:

```
$RECYCLE.BIN
System Volume Information
.git
__pycache__
node_modules
```

The ignore list shall be configurable.

---

# Chapter 16 — File Validation

## 16.1 Purpose

Validation ensures only eligible files continue through the processing pipeline.

---

## 16.2 Validation Rules

Each discovered file shall be checked for:

- File exists
- Supported extension
- Read permission
- Non-zero size
- Accessible path
- Valid filename

---

## 16.3 Validation Results

Each candidate receives one status:

```
Valid
Invalid
Ignored
Unsupported
Failed
```

Only **Valid** files proceed to Change Detection.

---

## 16.4 Validation Errors

Examples:

- Access denied
- File locked
- Invalid filename
- Path too long
- Corrupted directory entry

Validation failures should be logged without stopping the scan.

---

# Chapter 17 — Queue Manager

## 17.1 Purpose

The Queue Manager prepares work items for downstream processing.

It separates file discovery from metadata extraction, enabling asynchronous processing.

---

## 17.2 Queue Workflow

```
Validated File
      │
      ▼
Change Detector
      │
      ▼
Queue Builder
      │
      ▼
Processing Queue
      │
      ▼
Metadata Engine
```

---

## 17.3 Queue Item

Each queue item should include:

- Library Location ID
- Relative Path
- File Name
- File Size
- Last Modified
- Scan Type
- Change Type
- Queue Timestamp

---

## 17.4 Queue Principles

The Queue Manager shall:

- Preserve processing order.
- Prevent duplicate entries.
- Allow retries.
- Support future priority queues.

---

# Chapter 18 — Progress Reporting

## 18.1 Purpose

The scanner shall continuously publish progress information to provide user feedback.

---

## 18.2 Reported Values

Progress includes:

- Current library
- Current folder
- Current file
- Files discovered
- Files processed
- Queue size
- Scan speed
- Estimated remaining time
- Elapsed time

---

## 18.3 Progress Events

Examples:

```
ScanStarted
ProgressUpdated
ScanPaused
ScanResumed
ScanCompleted
```

---

## 18.4 Update Frequency

Progress updates should be rate-limited to avoid excessive UI refreshes.

The UI should receive meaningful updates without degrading scan performance.

---

# Chapter 19 — Error Handling & Recovery

## 19.1 Principles

The Folder Scanner shall recover automatically whenever possible.

Individual file failures must not terminate the overall scan.

---

## 19.2 Recoverable Errors

Examples:

- Access denied
- Locked file
- Corrupted file
- Missing directory
- Network interruption (future)

Action:

- Log error
- Skip item
- Continue scanning

---

## 19.3 Fatal Errors

Examples:

- Invalid library configuration
- Database unavailable
- Storage device unavailable
- Unexpected scanner initialization failure

Action:

- Stop scan safely
- Publish failure event
- Preserve completed work

---

## 19.4 Retry Policy

Recoverable operations may be retried according to future configuration.

Retries should avoid creating duplicate queue entries.

---

# Chapter 20 — Performance Optimization

## 20.1 Goals

The Folder Scanner shall efficiently support very large music libraries.

---

## 20.2 Optimization Strategies

- Lazy directory traversal
- Incremental scanning
- Avoid unnecessary hash calculations
- Minimize disk access
- Batch queue generation
- Efficient path comparison

---

## 20.3 Memory Usage

The scanner should avoid loading the complete library into memory.

Processing should occur incrementally.

---

## 20.4 Future Optimizations

Planned improvements:

- Parallel directory traversal
- File system notifications
- Multi-threaded queue generation
- Persistent scan cache

---

# Chapter 21 — Configuration

## 21.1 Configurable Options

Examples:

| Setting | Description |
|----------|-------------|
| Auto Scan | Enable background scans |
| Scan Interval | Scheduled scan frequency |
| Follow Symbolic Links | Yes/No |
| Ignore Hidden Files | Yes/No |
| Ignore Hidden Directories | Yes/No |
| Calculate Hash During Scan | Always / Changed Only / Never |
| Maximum Concurrent Scan Jobs | Future |

---

## 21.2 Default Configuration

The default configuration should prioritize reliability over maximum performance.

---

# Chapter 22 — Testing Strategy

## Unit Tests

Verify:

- Directory traversal
- Extension filtering
- Ignore rules
- Change detection
- Queue generation

---

## Integration Tests

Verify:

- Database interaction
- Event publication
- Repository communication
- Metadata pipeline integration

---

## Performance Tests

Test libraries containing:

- 1,000 files
- 10,000 files
- 100,000 files
- 500,000 files (simulated)

---

## Failure Tests

Simulate:

- Locked files
- Missing folders
- Corrupted entries
- Permission failures

---

# Chapter 23 — Acceptance Criteria

The Folder Scanner is complete when it satisfies the following:

### Functional

☐ Recursively scans library locations

☐ Detects supported audio files

☐ Ignores unsupported files

☐ Detects added files

☐ Detects deleted files

☐ Detects modified files

☐ Generates processing queues

☐ Publishes scan events

☐ Reports progress

☐ Supports cancellation

---

### Quality

☐ Meets DOC-003 Development Standards

☐ Unit tests pass

☐ Integration tests pass

☐ No unhandled exceptions

☐ Logging implemented

☐ Documentation updated

---

# Chapter 24 — Future Enhancements

Planned future capabilities include:

- Real-time file system monitoring
- Parallel scanning
- Distributed scanning
- Network library optimization
- Persistent scan cache
- Scan prioritization
- Incremental hash database
- File watcher service
- Plugin-based file filters
- AI-assisted duplicate pre-classification

These enhancements shall extend the Folder Scanner without changing its core architecture.

---

# Chapter 25 — Summary

The Folder Scanner is the entry point into the Harmony AI ingestion pipeline.

Its responsibilities are intentionally limited to discovering files, validating them, detecting changes, and preparing processing work for downstream components.

By maintaining clear boundaries and communicating through events and queues, the Folder Scanner remains scalable, testable, and independent of metadata extraction, persistence, and AI logic.

This specification provides the complete engineering blueprint required to implement the Folder Scanner module.

---

# Specification Approval

## Status

Current Status:

Draft

This specification shall become **Approved** after technical review by the Project Owner.

---

## Approval Record

| Role | Name | Status |
|------|------|--------|
| Project Owner | Project Owner | Pending |
| Lead Software Architect | Lead Software Architect | Approved |
| Engineering Team | Engineering Team | Approved |

---

## Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Lead Software Architect|

---

# End of Document

**SPEC-001 — Folder Scanner**

Version 1.0.0

End of File
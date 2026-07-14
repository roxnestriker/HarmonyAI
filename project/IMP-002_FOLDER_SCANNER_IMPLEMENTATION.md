# IMP-002 — FOLDER SCANNER IMPLEMENTATION

| Property | Value |
|----------|-------|
| Document ID | IMP-002 |
| Document Name | Folder Scanner Implementation Prompt |
| Version | 1.0.0 |
| Status | Approved |
| Target AI | Coding AI |
| Maintained By | Architecture Team |

---

# PURPOSE

This document instructs the Coding AI to implement the complete Folder Scanner module for Harmony AI.

The implementation SHALL comply with every referenced architecture document.

The Coding AI SHALL implement only the Folder Scanner.

The Coding AI SHALL NOT redesign architecture.

The Coding AI SHALL NOT modify APIs.

The Coding AI SHALL NOT implement Metadata Extraction.

---

# REQUIRED REFERENCE DOCUMENTS

Read before writing code:

DOC-001 Project Foundation

DOC-002 Development Workflow

DOC-003 Development Standards

DOC-004 Architecture Principles

PRD-001 Music Library

ARCH-001 Music Library Architecture

DB-001 Initial Database Schema

SPEC-001 Folder Scanner

API-001 Repository Interfaces

API-002 Domain Events

API-003 Service Interfaces

PROJECT.md

These documents are authoritative.

---

# IMPLEMENTATION OBJECTIVE

Implement the complete Folder Scanner module.

The implementation shall:

- Discover files
- Traverse folders
- Detect changes
- Generate processing queues
- Publish events
- Report progress
- Support cancellation
- Support multiple libraries

No metadata extraction.

No artwork processing.

No database logic beyond repository usage.

---

# IMPLEMENTATION SCOPE

Implement:

Folder Scanner

Directory Walker

File Filter

Change Detector

Queue Builder

Progress Manager

Scan Controller

Configuration

Logging

Tests

Documentation

---

# PROJECT STRUCTURE

Implement inside:

backend/

scanner/

scanner.py

controller.py

walker.py

filters.py

detector.py

queue_builder.py

progress.py

events.py

config.py

exceptions.py

tests/

Do NOT create modules outside this structure.

---

# IMPLEMENTATION RULES

Follow:

Clean Architecture

SOLID

Dependency Injection

PEP8

Black

Ruff

Type Hints

Async-ready architecture

No circular imports

No duplicated logic

No global state

---

# SCAN MODES

Implement:

Full Scan

Incremental Scan

Folder Scan

Single File Scan

Background Scan (framework only)

Scheduled Scan (framework only)

---

# DIRECTORY WALKER

Implement recursive traversal.

Support:

- Multiple libraries
- Ignore patterns
- Hidden files
- Hidden folders
- Symbolic link configuration

Traversal must be deterministic.

---

# FILE FILTER

Support:

Extensions:

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

Reject:

Temporary files

Zero-byte files

Unsupported extensions

Hidden system files

Ignored paths

---

# CHANGE DETECTOR

Implement comparison levels:

1.

Path

2.

Timestamp

3.

File Size

4.

SHA-256 Hash

Hash calculation shall only occur when necessary.

---

# QUEUE BUILDER

Generate queue items containing:

Library ID

Relative Path

File Name

File Size

Timestamp

Change Type

Queue Timestamp

Queue shall prevent duplicate entries.

---

# EVENTS

Publish only events defined in API-002.

Examples:

ScanStarted

FolderDiscovered

FileDiscovered

FileChanged

FileDeleted

QueueCreated

ScanCompleted

Do not invent events.

---

# REPOSITORIES

Use only Repository Interfaces defined in API-001.

Do not access SQLAlchemy directly.

---

# SERVICES

Support Scan Service defined in API-003.

Do not implement service layer.

---

# ERROR HANDLING

Recoverable:

Access denied

Locked file

Missing folder

Corrupted entry

Continue scanning.

Fatal:

Invalid configuration

Repository unavailable

Initialization failure

Abort safely.

---

# PERFORMANCE

Optimize for:

Large libraries

Low memory usage

Minimal disk access

Batch queue creation

Incremental scanning

Future parallelization

---

# CONFIGURATION

Implement configurable:

Ignore patterns

Supported extensions

Hash policy

Scan interval

Follow symbolic links

Auto scan

Maximum recursion depth

---

# LOGGING

Support:

DEBUG

INFO

WARNING

ERROR

CRITICAL

No sensitive information in logs.

---

# TESTING

Generate:

Unit Tests

Traversal Tests

Change Detection Tests

Queue Tests

Performance Tests

Failure Tests

Integration Tests

Target:

500,000 simulated files.

---

# DOCUMENTATION

Every module shall include:

Module docstring

Class documentation

Method documentation

Usage examples

Architecture notes

---

# IMPLEMENTATION ORDER

Module 1

Configuration

↓

Module 2

Exceptions

↓

Module 3

Directory Walker

↓

Module 4

File Filter

↓

Module 5

Change Detector

↓

Module 6

Queue Builder

↓

Module 7

Progress Manager

↓

Module 8

Scan Controller

↓

Module 9

Events

↓

Module 10

Tests

↓

Module 11

Documentation

Wait for approval after each module.

---

# SUCCESS CRITERIA

Implementation is complete only when:

✓ Folder traversal works

✓ Incremental scan works

✓ Queue generation works

✓ Events published

✓ Repository interfaces used

✓ Unit tests pass

✓ Ruff passes

✓ Black passes

✓ Architecture compliance maintained

---

# IMPORTANT

If any implementation conflicts with Architecture, Database, Specification, or API documents:

STOP.

Explain the conflict.

Do NOT redesign.

Do NOT guess.

---

# OUTPUT FORMAT

For every implementation module provide:

1. Purpose

2. Design Notes

3. Source Code

4. Tests

5. Explanation

Then stop and wait for approval before continuing.

---

# END OF IMPLEMENTATION PROMPT

Begin with:

Module 1

Folder Scanner Configuration

Wait for approval before continuing.
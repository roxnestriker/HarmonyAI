# IMP-006 — STATISTICS ENGINE IMPLEMENTATION

| Property | Value |
|----------|-------|
| Document ID | IMP-006 |
| Document Name | Statistics Engine Implementation Prompt |
| Version | 1.0.0 |
| Status | Approved |
| Target AI | Coding AI |
| Maintained By | Architecture Team |

---

# PURPOSE

This document instructs the Coding AI to implement the complete Statistics Engine for Harmony AI.

The implementation SHALL strictly comply with all referenced project documentation.

The Coding AI SHALL implement only the Statistics Engine.

The Coding AI SHALL NOT redesign architecture.

The Coding AI SHALL NOT invent APIs.

The Coding AI SHALL NOT modify database schema.

---

# REQUIRED REFERENCE DOCUMENTS

Read before writing code:

DOC-001 Project Foundation

DOC-002 Development Workflow

DOC-003 Development Standards

DOC-004 Architecture Principles

PRD-001 Music Library Management

ARCH-001 Music Library Architecture

DB-001 Initial Database Schema

SPEC-005 Statistics Engine

API-001 Repository Interfaces

API-002 Domain Events

API-003 Service Interfaces

PROJECT.md

These documents are authoritative.

---

# IMPLEMENTATION OBJECTIVE

Implement the complete Statistics Engine.

The implementation shall:

- Calculate library statistics
- Aggregate metadata
- Generate dashboard metrics
- Cache expensive calculations
- Support incremental updates
- Publish domain events
- Produce reusable reports

The implementation shall NOT:

- Generate recommendations
- Modify metadata
- Modify user files
- Perform UI rendering

---

# IMPLEMENTATION SCOPE

Implement:

Statistics Engine

Aggregation Engine

Statistics Calculator

Incremental Update Engine

Statistics Cache

Dashboard Builder

Statistics Models

Configuration

Logging

Tests

Documentation

---

# PROJECT STRUCTURE

Implement inside:

backend/

statistics/

engine.py

aggregator.py

calculator.py

incremental.py

cache.py

dashboard.py

models.py

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

Repository Pattern

Dependency Injection

PEP8

Black

Ruff

Python Type Hints

Dataclasses where appropriate

No ORM access

No global state

No duplicated logic

---

# STATISTICS CATEGORIES

Implement calculations for:

Library

Artist

Album

Genre

Audio

Storage

Listening

Metadata Quality

Playlist

Scan History

Each category shall be independently testable.

---

# LIBRARY STATISTICS

Calculate:

Total Songs

Total Artists

Total Albums

Total Genres

Total Playlists

Total Library Size

Total Duration

Average Song Length

Average Bitrate

Average Sample Rate

---

# AUDIO STATISTICS

Calculate:

Codec Distribution

Sample Rate Distribution

Bit Depth Distribution

Channel Distribution

ReplayGain Coverage

Lossless vs Lossy Ratio

Average File Size

Largest File

Smallest File

---

# METADATA QUALITY

Calculate:

Missing Artwork

Missing Genre

Missing Year

Missing Album

Missing Artist

Missing ReplayGain

Metadata Quality Score

Metadata Completeness Percentage

---

# STORAGE STATISTICS

Calculate:

Storage by Library

Storage by Codec

Storage by Artist

Storage by Album

Storage Growth

Largest Album

Largest Artist

---

# LISTENING STATISTICS

Calculate:

Play Count

Skip Count

Completion Rate

Average Session Length

Most Played Songs

Most Played Artists

Most Played Albums

Daily Listening Time

Weekly Listening Time

Monthly Listening Time

---

# AGGREGATION

Implement:

Batch aggregation

Incremental aggregation

Grouped aggregation

Cached aggregation

Aggregations shall be deterministic.

---

# CACHE

Implement:

Statistics Cache

Cache Refresh

Cache Validation

Cache Expiration

Incremental Cache Updates

Avoid unnecessary recalculation.

---

# DASHBOARD

Generate dashboard models including:

Library Overview

Storage Overview

Audio Quality Overview

Metadata Health

Listening Summary

Recently Added

Recently Played

Top Artists

Top Albums

Top Genres

Dashboard models shall be presentation-independent.

---

# REPOSITORIES

Use Repository Interfaces only.

Do NOT access SQLAlchemy directly.

---

# EVENTS

Publish only API-002 events.

Examples:

StatisticsCalculationStarted

StatisticsUpdated

StatisticsCompleted

LibraryStatisticsChanged

AudioStatisticsChanged

StatisticsFailed

Do NOT invent events.

---

# SERVICES

Support Statistics Service defined in API-003.

Do NOT implement service layer.

---

# ERROR HANDLING

Recoverable:

Missing metadata

Missing artwork

Invalid values

Corrupted statistics entry

Continue processing.

Fatal:

Repository unavailable

Cache corruption

Configuration error

Abort calculation safely.

---

# PERFORMANCE

Optimize for:

Large libraries

Incremental updates

Low memory usage

Cached aggregation

Batch processing

Future parallel execution

Target:

500,000 songs

Statistics should avoid full recalculation whenever an incremental update is possible.

---

# CONFIGURATION

Implement configurable:

Enable Statistics

Enable Cache

Cache Expiration

Incremental Updates

Background Refresh

Batch Size

Maximum Aggregation Size

Dashboard Refresh Interval

---

# LOGGING

Support:

DEBUG

INFO

WARNING

ERROR

CRITICAL

Log calculation lifecycle without exposing sensitive information.

---

# TESTING

Generate:

Unit Tests

Aggregation Tests

Calculator Tests

Cache Tests

Incremental Update Tests

Dashboard Tests

Failure Tests

Performance Tests

Integration Tests

Target:

500,000 simulated songs

---

# DOCUMENTATION

Every module shall include:

Module documentation

Class documentation

Method documentation

Architecture notes

Usage examples

Type hints

---

# IMPLEMENTATION ORDER

Module 1

Configuration

↓

Module 2

Exceptions

↓

Module 3

Statistics Models

↓

Module 4

Aggregation Engine

↓

Module 5

Statistics Calculator

↓

Module 6

Incremental Update Engine

↓

Module 7

Statistics Cache

↓

Module 8

Dashboard Builder

↓

Module 9

Statistics Engine

↓

Module 10

Events

↓

Module 11

Tests

↓

Module 12

Documentation

Wait for approval after every module.

---

# SUCCESS CRITERIA

Implementation is complete only when:

✓ Library statistics implemented

✓ Audio statistics implemented

✓ Metadata quality implemented

✓ Storage statistics implemented

✓ Listening statistics implemented

✓ Incremental updates implemented

✓ Cache implemented

✓ Dashboard models generated

✓ Repository interfaces used

✓ Events published

✓ Unit tests pass

✓ Ruff passes

✓ Black passes

✓ Architecture compliance maintained

---

# IMPORTANT

If implementation conflicts with Architecture, Database, Specifications, or API documents:

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

Statistics Engine Configuration

Wait for approval before continuing.
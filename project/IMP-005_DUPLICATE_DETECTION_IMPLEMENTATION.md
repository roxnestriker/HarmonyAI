# IMP-005 — DUPLICATE DETECTION IMPLEMENTATION

| Property | Value |
|----------|-------|
| Document ID | IMP-005 |
| Document Name | Duplicate Detection Implementation Prompt |
| Version | 1.0.0 |
| Status | Approved |
| Target AI | Coding AI |
| Maintained By | Architecture Team |

---

# PURPOSE

This document instructs the Coding AI to implement the complete Duplicate Detection Engine for Harmony AI.

The implementation SHALL comply with all referenced project documents.

The Coding AI SHALL implement only duplicate detection.

The Coding AI SHALL NOT modify files.

The Coding AI SHALL NOT redesign architecture.

The Coding AI SHALL NOT invent APIs.

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

SPEC-004 Duplicate Detection Engine

API-001 Repository Interfaces

API-002 Domain Events

API-003 Service Interfaces

PROJECT.md

These documents are authoritative.

---

# IMPLEMENTATION OBJECTIVE

Implement the complete Duplicate Detection Engine.

The implementation shall:

- Generate duplicate candidates
- Compare metadata
- Compare technical properties
- Compare hashes
- Calculate confidence scores
- Group duplicates
- Generate duplicate reports
- Publish events

No file deletion.

No metadata editing.

No AI similarity.

No audio fingerprinting.

---

# IMPLEMENTATION SCOPE

Implement:

Duplicate Engine

Candidate Generator

Metadata Comparator

Technical Comparator

Hash Comparator

Confidence Calculator

Duplicate Grouper

Report Generator

Configuration

Logging

Tests

Documentation

---

# PROJECT STRUCTURE

Implement inside:

backend/

duplicates/

engine.py

candidate_generator.py

metadata_compare.py

technical_compare.py

hash_compare.py

confidence.py

grouping.py

report.py

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

Repository Pattern

PEP8

Black

Ruff

Python Type Hints

Dataclasses where appropriate

No global state

No duplicated logic

No ORM access

---

# DUPLICATE TYPES

Implement detection for:

Exact Duplicate

Metadata Duplicate

Technical Duplicate

Partial Duplicate

Possible Duplicate

Each duplicate type shall include the reason for classification.

---

# CANDIDATE GENERATION

Generate comparison candidates using indexed pre-filtering.

Primary candidate keys:

MusicBrainz Recording ID

ISRC

Normalized Title

Normalized Artist

Album

Duration

Candidates should minimize unnecessary comparisons.

---

# COMPARISON PIPELINE

Comparison stages:

1.

SHA-256 Hash

↓

2.

MusicBrainz Recording ID

↓

3.

ISRC

↓

4.

Normalized Title

↓

5.

Normalized Artist

↓

6.

Album

↓

7.

Duration

↓

8.

Track Number

↓

9.

Codec

↓

10.

Bitrate

↓

11.

Sample Rate

↓

12.

Bit Depth

The comparison order shall prioritize inexpensive and highly reliable checks.

---

# CONFIDENCE CALCULATION

Implement weighted confidence scoring.

Default ranges:

95–100%

Exact Duplicate

80–94%

Very Likely Duplicate

60–79%

Possible Duplicate

Below 60%

Not Duplicate

Weights shall be configurable.

---

# DUPLICATE GROUPING

Generate duplicate groups.

Each group shall contain:

Primary Song

Related Songs

Confidence Score

Detection Reason

Group Identifier

Groups shall be deterministic.

---

# REPORT GENERATION

Generate reports including:

Total Groups

Total Duplicates

Confidence Distribution

Duplicate Types

Storage Savings Estimate

Comparison Summary

Reports shall be serializable.

---

# REPOSITORIES

Use Repository Interfaces only.

Do NOT access SQLAlchemy directly.

---

# EVENTS

Publish only API-002 events.

Examples:

DuplicateScanStarted

CandidateGenerated

DuplicateDetected

DuplicateGroupCreated

DuplicateAnalysisCompleted

DuplicateAnalysisFailed

Do NOT invent events.

---

# SERVICES

Support Duplicate Detection Service defined in API-003.

Do NOT implement service layer.

---

# ERROR HANDLING

Recoverable:

Missing metadata

Invalid duration

Unsupported codec

Continue processing.

Fatal:

Repository unavailable

Candidate generation failure

Configuration error

Abort duplicate analysis safely.

---

# PERFORMANCE

Optimize for:

Large libraries

Indexed lookups

Minimal comparisons

Lazy loading

Batch processing

Future parallel comparison

Target:

500,000 songs

The implementation should scale approximately O(n log n) where practical by using candidate filtering rather than exhaustive comparisons.

---

# CONFIGURATION

Implement configurable:

Enable Hash Comparison

Enable Metadata Comparison

Enable Technical Comparison

Minimum Confidence

Duration Tolerance

Comparison Weights

Maximum Candidate Count

Batch Size

---

# LOGGING

Support:

DEBUG

INFO

WARNING

ERROR

CRITICAL

Log duplicate analysis lifecycle without exposing unnecessary internal details.

---

# TESTING

Generate:

Unit Tests

Candidate Generation Tests

Metadata Comparison Tests

Hash Comparison Tests

Confidence Calculation Tests

Grouping Tests

Report Tests

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

Candidate Generator

↓

Module 4

Hash Comparator

↓

Module 5

Metadata Comparator

↓

Module 6

Technical Comparator

↓

Module 7

Confidence Calculator

↓

Module 8

Duplicate Grouper

↓

Module 9

Report Generator

↓

Module 10

Duplicate Engine

↓

Module 11

Events

↓

Module 12

Tests

↓

Module 13

Documentation

Wait for approval after every module.

---

# SUCCESS CRITERIA

Implementation is complete only when:

✓ Candidate generation implemented

✓ Metadata comparison implemented

✓ Technical comparison implemented

✓ Hash comparison implemented

✓ Confidence scoring implemented

✓ Duplicate grouping implemented

✓ Reports generated

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

Duplicate Detection Configuration

Wait for approval before continuing.
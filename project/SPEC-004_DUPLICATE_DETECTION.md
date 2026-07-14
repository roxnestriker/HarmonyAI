# SPEC-004 — DUPLICATE DETECTION ENGINE

| Property | Value |
|----------|-------|
| Document ID | SPEC-004 |
| Document Name | Duplicate Detection Engine Specification |
| Version | 1.0.0 |
| Status | Draft |
| Owner | Lead Software Architect |
| Maintained By | Engineering Team |
| Last Updated | 2026-07-13 |
| Related Documents | PRD-001, ARCH-001, DB-001, SPEC-001, SPEC-002 |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Lead Software Architect|

---

# Table of Contents

1. Purpose
2. Scope
3. Design Goals
4. Responsibilities
5. High-Level Architecture
6. Duplicate Types
7. Detection Pipeline
8. Matching Algorithms
9. Confidence Scoring
10. Duplicate Groups
11. Repository Integration
12. Domain Events
13. Error Handling
14. Performance
15. Configuration
16. Testing Strategy
17. Acceptance Criteria
18. Future Enhancements
19. Summary

---

# Chapter 1 — Purpose

## 1.1 Purpose

The Duplicate Detection Engine identifies files that may represent the same musical recording.

Its objective is to assist users in identifying duplicate content while preserving complete user control.

The engine never deletes, modifies, or relocates music files.

---

## 1.2 Objectives

The engine shall:

- Detect duplicate songs.
- Group related duplicates.
- Calculate confidence scores.
- Support multiple comparison methods.
- Generate duplicate reports.
- Publish duplicate events.
- Support future AI comparison.

---

# Chapter 2 — Scope

## Included

- Metadata comparison
- File comparison
- Hash comparison
- Technical property comparison
- Duplicate grouping
- Confidence scoring

---

## Excluded

- Automatic deletion
- File movement
- Metadata editing
- Audio fingerprinting (Future)
- AI similarity (Future)

---

# Chapter 3 — Design Goals

The Duplicate Detection Engine shall be:

- Accurate
- Explainable
- Deterministic
- Extensible
- Scalable
- Testable

False positives should be minimized.

---

# Chapter 4 — Responsibilities

The engine owns:

- Duplicate analysis
- Candidate generation
- Confidence scoring
- Duplicate grouping
- Report generation

It shall not:

- Delete files
- Rename files
- Modify metadata
- Persist data directly

---

# Chapter 5 — High-Level Architecture

```
Song Repository

        │

        ▼

Duplicate Engine

        │

        ▼

Candidate Generator

        │

        ▼

Comparison Engine

        │

        ▼

Confidence Calculator

        │

        ▼

Duplicate Groups

        │

        ▼

Repository Layer
```

---

# Chapter 6 — Duplicate Types

Harmony AI recognizes several duplicate categories.

## Exact Duplicate

Same file hash.

---

## Metadata Duplicate

Metadata matches but file differs.

---

## Technical Duplicate

Different encoding but same recording.

Examples:

- FLAC
- MP3
- AAC

---

## Partial Duplicate

Most metadata matches but some fields differ.

---

## Possible Duplicate

Insufficient confidence for automatic grouping.

---

# Chapter 7 — Detection Pipeline

```
Load Songs

↓

Generate Candidates

↓

Compare Metadata

↓

Compare Technical Data

↓

Compare Hash

↓

Calculate Score

↓

Create Groups

↓

Publish Events
```

---

# Chapter 8 — Matching Algorithms

Comparison stages:

## Stage 1

File Hash

Weight: Very High

---

## Stage 2

MusicBrainz Recording ID

Weight: Very High

---

## Stage 3

ISRC

Weight: High

---

## Stage 4

Title

Weight: High

---

## Stage 5

Artist

Weight: High

---

## Stage 6

Album

Weight: Medium

---

## Stage 7

Duration

Tolerance:

±2 seconds

---

## Stage 8

Track Number

Weight: Low

---

## Stage 9

Technical Properties

Compare:

- Bitrate
- Codec
- Sample Rate
- Bit Depth

---

# Chapter 9 — Confidence Scoring

Overall confidence:

```
95–100%

Exact Duplicate

80–94%

Very Likely

60–79%

Possible Duplicate

Below 60%

Different Recording
```

Confidence shall be calculated from weighted comparisons.

The scoring model should remain configurable.

---

# Chapter 10 — Duplicate Groups

Duplicates are grouped together.

Example:

```
Group 001

Song A.flac

Song A.mp3

Song A.aac
```

Each group includes:

- Primary item
- Related items
- Confidence score
- Detection reason

---

# Chapter 11 — Repository Integration

Workflow:

```
Repository

↓

Duplicate Engine

↓

Duplicate Models

↓

Repository Interface

↓

Database
```

Persistence is delegated to repositories.

---

# Chapter 12 — Domain Events

Examples:

```
DuplicateScanStarted

CandidateGenerated

DuplicateDetected

DuplicateGroupCreated

DuplicateAnalysisCompleted

DuplicateAnalysisFailed
```

Events contain only business data.

---

# Chapter 13 — Error Handling

Recoverable:

- Missing metadata
- Invalid duration
- Unsupported codec

Action:

Continue comparison.

---

Fatal:

- Repository unavailable
- Candidate generation failure

Action:

Stop duplicate analysis safely.

---

# Chapter 14 — Performance

Optimization strategies:

- Candidate pre-filtering
- Hash reuse
- Indexed lookups
- Batch comparison
- Lazy loading

Future:

- Parallel comparison
- Audio fingerprint cache

---

# Chapter 15 — Configuration

Examples:

| Setting | Description |
|----------|-------------|
| Hash Comparison | Yes/No |
| Metadata Comparison | Yes/No |
| Duration Tolerance | Seconds |
| Minimum Confidence | Percentage |
| Compare Technical Properties | Yes/No |
| Enable Candidate Cache | Yes/No |

---

# Chapter 16 — Testing Strategy

Unit Tests

- Hash comparison
- Metadata comparison
- Confidence calculation
- Group generation

Integration Tests

- Repository
- Metadata Engine
- Statistics Engine

Performance Tests

Libraries:

- 10,000 songs
- 100,000 songs
- 500,000 songs

Failure Tests

- Missing metadata
- Corrupted database
- Invalid hash

---

# Chapter 17 — Acceptance Criteria

Functional

☐ Detect exact duplicates

☐ Detect metadata duplicates

☐ Generate duplicate groups

☐ Calculate confidence scores

☐ Publish events

☐ Produce duplicate reports

Quality

☐ Unit tests pass

☐ Integration tests pass

☐ No duplicate group corruption

☐ Meets DOC-003 Development Standards

---

# Chapter 18 — Future Enhancements

Future capabilities include:

- Audio fingerprinting
- Spectral similarity
- AI similarity ranking
- Duplicate artwork analysis
- Duplicate lyrics analysis
- Automatic duplicate suggestions
- Duplicate merge assistant
- Quality comparison
- Preferred version recommendation

---

# Chapter 19 — Summary

The Duplicate Detection Engine identifies duplicate recordings using multiple comparison strategies and confidence scoring while preserving complete user control.

Its architecture supports future AI-assisted similarity analysis without requiring changes to the core detection pipeline.

The engine never modifies user files and serves only as an intelligent analysis component within Harmony AI.

---

# Specification Approval

## Status

Draft

---

## Approval Record

| Role | Name | Status |
|------|------|--------|
| Project Owner | Project Owner | Pending |
| Lead Software Architect | Approved | Approved |
| Engineering Team | Approved | Approved |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Lead Software Architect|

---

# End of Document

**SPEC-004 — Duplicate Detection Engine**

Version 1.0.0

End of File
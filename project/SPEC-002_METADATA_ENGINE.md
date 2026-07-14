# SPEC-002 — METADATA ENGINE

| Property | Value |
|----------|-------|
| Document ID | SPEC-002 |
| Document Name | Metadata Engine Specification |
| Version | 1.0.0 |
| Status | Draft |
| Owner | Lead Software Architect |
| Maintained By | Engineering Team |
| Last Updated | 2026-07-13 |
| Related Documents | PRD-001, ARCH-001, DB-001, SPEC-001 |

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
6. Metadata Pipeline
7. Engine Components
8. Supported Formats
9. Metadata Mapping
10. Normalization Rules
11. Technical Audio Properties
12. Domain Events
13. Processing Workflow
14. Error Classification

## Part B

15. Validation Rules
16. Metadata Quality
17. Repository Integration
18. Performance
19. Configuration
20. Logging
21. Testing Strategy
22. Acceptance Criteria
23. Future Enhancements
24. Summary

# Chapter 1 — Purpose

## 1.1 Purpose

The Metadata Engine extracts, validates, normalizes, and prepares metadata from supported audio files.

It converts raw file tags into Harmony AI domain models while preserving the original file without modification.

The Metadata Engine is the authoritative source for music metadata within Harmony AI.

---

## 1.2 Objectives

The Metadata Engine shall:

- Read metadata from supported formats.
- Normalize metadata.
- Validate metadata.
- Extract technical audio properties.
- Generate domain models.
- Publish metadata events.
- Detect metadata changes.
- Support future metadata providers.

---

# Chapter 2 — Scope

## Included

- Metadata extraction
- Tag normalization
- Technical metadata
- ReplayGain
- MusicBrainz identifiers
- Embedded artwork detection
- Metadata validation

---

## Excluded

- Database persistence
- Artwork extraction
- Lyrics download
- Recommendation generation
- Audio fingerprinting

---

# Chapter 3 — Design Goals

The Metadata Engine shall be:

- Accurate
- Deterministic
- Extensible
- Testable
- Event Driven
- Provider Independent
- Offline First

Metadata extraction should produce identical results for identical files.

---

# Chapter 4 — Responsibilities

The Metadata Engine owns:

- Reading metadata
- Metadata normalization
- Metadata validation
- Technical audio properties
- Metadata models
- Metadata quality reporting

The engine shall not:

- Modify files
- Save data
- Download metadata
- Generate artwork
- Update statistics

---

# Chapter 5 — High-Level Architecture

```
Folder Scanner

        │

        ▼

Metadata Engine

        │

        ▼

Metadata Reader

        │

        ▼

Metadata Validator

        │

        ▼

Metadata Normalizer

        │

        ▼

Domain Model Builder

        │

        ▼

Repository Layer
```

Each stage performs one responsibility.

---

# Chapter 6 — Metadata Pipeline

```
Queue Item

↓

Open Audio File

↓

Read Native Tags

↓

Extract Technical Data

↓

Normalize Values

↓

Validate

↓

Create Domain Models

↓

Publish Metadata Event

↓

Repository
```

Every stage shall be independently testable.

---

# Chapter 7 — Engine Components

## Metadata Reader

Reads native metadata from supported formats.

---

## Technical Analyzer

Extracts:

- Duration
- Bitrate
- Sample Rate
- Bit Depth
- Channels
- Codec

---

## Metadata Validator

Checks completeness and validity.

---

## Metadata Normalizer

Standardizes values.

---

## Domain Builder

Produces:

- Artist
- Album
- Song
- Genre
- Lyrics Reference
- Artwork Reference

---

## Event Publisher

Publishes metadata-related domain events.

---

# Chapter 8 — Supported Formats

Initial formats:

- FLAC
- MP3
- M4A
- AAC
- OGG
- OPUS
- WAV
- AIFF
- APE

Future:

- DSD
- SACD
- CAF

The engine shall use provider-specific readers behind a common interface.

---

# Chapter 9 — Metadata Mapping

The Metadata Engine extracts:

## Music Metadata

- Title
- Artist
- Album Artist
- Album
- Genre
- Track Number
- Disc Number
- Year
- Composer
- Conductor
- BPM
- ISRC
- MusicBrainz IDs

---

## Technical Metadata

- Duration
- Codec
- Bitrate
- Sample Rate
- Bit Depth
- Channels
- File Size
- ReplayGain

---

## Optional Metadata

- Comment
- Copyright
- Publisher
- Grouping
- Mood
- Language

Future providers may extend this list.

---

# Chapter 10 — Normalization Rules

The Metadata Engine standardizes values before storage.

Examples:

Artist

```
beatles

↓

The Beatles
```

Track Number

```
01/12

↓

1
```

Whitespace

```
  Album Name

↓

Album Name
```

Genre aliases may also be normalized according to configurable mapping rules.

---

# Chapter 11 — Technical Audio Properties

The engine shall extract:

- Codec
- Container
- Duration
- Bitrate
- Sample Rate
- Bit Depth
- Channels
- ReplayGain
- Peak Level

Future versions may include:

- Dynamic Range
- Loudness
- Spectral Analysis

---

# Chapter 12 — Domain Events

Examples:

```
MetadataRead

MetadataValidated

MetadataNormalized

SongCreated

ArtistCreated

AlbumCreated

GenreCreated

MetadataUpdated

MetadataFailed
```

Events shall contain business information only.

---

# Chapter 13 — Processing Workflow

```
Receive Queue Item

↓

Read File

↓

Extract Metadata

↓

Normalize

↓

Validate

↓

Create Domain Objects

↓

Publish Event

↓

Forward to Repository
```

The workflow is deterministic and repeatable.

---

# Chapter 14 — Error Classification

Errors are classified as:

Recoverable

Examples:

- Missing tags
- Empty genre
- Unsupported optional field

Fatal

Examples:

- Corrupted audio file
- Unsupported format
- File unreadable

Recoverable errors shall not stop processing.

Fatal errors shall stop processing for the affected file only.

---

# Part A Summary

The Metadata Engine transforms raw audio metadata into validated Harmony AI domain models.

Its architecture separates reading, normalization, validation, and model creation into independent components, enabling future extensibility while maintaining deterministic behavior.

---

# End of Part A

# Part B — Validation, Integration & Quality

# Chapter 15 — Validation Rules

## 15.1 Purpose

The Metadata Engine validates extracted metadata before it is transformed into Harmony AI domain models.

Validation ensures consistency, completeness, and predictable downstream behavior.

Validation never modifies the original audio file.

---

## 15.2 Validation Stages

Metadata passes through the following stages:

```
Extraction

↓

Structural Validation

↓

Value Validation

↓

Normalization

↓

Business Validation

↓

Quality Assessment

↓

Domain Model Creation
```

---

## 15.3 Structural Validation

Verify:

- Required fields exist
- Tag format is readable
- Character encoding is valid
- Numeric values are parsable
- No malformed metadata blocks

---

## 15.4 Required Fields

Minimum required metadata:

- Title
- Artist
- Duration
- Codec

Album and Genre may be empty.

---

## 15.5 Value Validation

Validate:

Track Number

- Positive integer

Disc Number

- Positive integer

Year

- Valid calendar year

Duration

- Greater than zero

Bitrate

- Positive integer

Sample Rate

- Supported audio frequency

---

## 15.6 Identifier Validation

Validate when available:

- MusicBrainz Artist ID
- MusicBrainz Album ID
- MusicBrainz Recording ID
- ISRC

Malformed identifiers should be ignored but reported.

---

# Chapter 16 — Metadata Quality

## 16.1 Purpose

Harmony AI assigns a quality score to extracted metadata.

The score indicates metadata completeness and consistency.

---

## 16.2 Quality Levels

```
Excellent

Good

Acceptable

Poor

Incomplete
```

---

## 16.3 Evaluation Criteria

Factors include:

- Missing title
- Missing artist
- Missing album
- Missing genre
- Missing artwork reference
- Missing ReplayGain
- Invalid year
- Duplicate identifiers

---

## 16.4 Quality Report

Generated report includes:

- Missing fields
- Invalid values
- Suggested improvements
- Warnings
- Errors

Future AI modules may use metadata quality as an input.

---

# Chapter 17 — Repository Integration

## 17.1 Purpose

The Metadata Engine produces domain objects but never writes directly to the database.

Persistence is delegated to Repository interfaces.

---

## 17.2 Workflow

```
Metadata Engine

↓

Domain Objects

↓

Repository Interface

↓

Infrastructure Repository

↓

Database
```

---

## 17.3 Repository Operations

The engine may request:

- Find Artist
- Create Artist
- Find Album
- Create Album
- Find Genre
- Create Genre
- Create Song
- Update Song

Implementation details remain outside the engine.

---

## 17.4 Idempotency

Repeated processing of an unchanged file should produce the same domain objects without creating duplicate database records.

---

# Chapter 18 — Performance

## 18.1 Objectives

The Metadata Engine shall:

- Minimize file access.
- Avoid duplicate parsing.
- Support batch processing.
- Process large libraries efficiently.

---

## 18.2 Optimization Strategies

- Lazy metadata loading
- Single-pass extraction
- Provider abstraction
- Batch repository operations
- Reuse immutable objects where practical

---

## 18.3 Memory Management

The engine should:

- Process one file at a time where possible.
- Release temporary objects promptly.
- Avoid retaining unnecessary buffers.

---

## 18.4 Future Optimizations

Future enhancements may include:

- Parallel metadata extraction
- Persistent metadata cache
- Incremental metadata updates
- Multi-process execution

---

# Chapter 19 — Configuration

## 19.1 Configurable Settings

Examples:

| Setting | Description |
|----------|-------------|
| Read ReplayGain | Enable/Disable |
| Read MusicBrainz IDs | Enable/Disable |
| Normalize Artist Names | Yes/No |
| Normalize Genres | Yes/No |
| Read Comments | Yes/No |
| Read Lyrics References | Yes/No |
| Strict Validation | Yes/No |

---

## 19.2 Default Configuration

Default settings prioritize metadata completeness and compatibility with common audio formats.

---

# Chapter 20 — Logging

## 20.1 Purpose

Logging provides traceability for metadata extraction and troubleshooting.

---

## 20.2 Logged Events

Examples:

- File opened
- Metadata extracted
- Validation completed
- Metadata normalized
- Repository request created
- Processing completed
- Processing failed

---

## 20.3 Log Levels

Supported levels:

```
DEBUG

INFO

WARNING

ERROR

CRITICAL
```

Sensitive information should not be logged unnecessarily.

---

# Chapter 21 — Testing Strategy

## Unit Tests

Verify:

- Metadata extraction
- Normalization
- Validation
- Domain model creation
- Identifier parsing

---

## Integration Tests

Verify:

- Repository interaction
- Event publication
- Folder Scanner integration
- Artwork Manager integration

---

## Compatibility Tests

Supported formats:

- FLAC
- MP3
- AAC
- OGG
- OPUS
- WAV
- AIFF
- APE

---

## Failure Tests

Simulate:

- Corrupted metadata
- Invalid tags
- Missing fields
- Unsupported formats
- Locked files

---

## Performance Tests

Target datasets:

- 1,000 files
- 10,000 files
- 100,000 files
- 500,000 files (simulated)

---

# Chapter 22 — Acceptance Criteria

## Functional

☐ Reads metadata from all supported formats

☐ Extracts technical properties

☐ Normalizes metadata

☐ Validates required fields

☐ Generates domain models

☐ Publishes metadata events

☐ Produces quality reports

☐ Handles malformed metadata gracefully

---

## Quality

☐ Unit tests pass

☐ Integration tests pass

☐ Documentation updated

☐ No duplicate entities created

☐ Meets DOC-003 Development Standards

---

# Chapter 23 — Future Enhancements

Planned improvements include:

- MusicBrainz synchronization
- Discogs integration
- Online metadata enrichment
- AI-assisted metadata correction
- Audio fingerprinting
- Automatic genre normalization
- Multi-language metadata support
- Metadata conflict resolution
- Batch metadata comparison
- User-defined normalization rules

These features extend the Metadata Engine without altering its core architecture.

---

# Chapter 24 — Summary

The Metadata Engine is responsible for transforming raw audio file tags into structured Harmony AI domain models.

It performs extraction, validation, normalization, and quality assessment while remaining independent of persistence, artwork extraction, and AI processing.

This separation ensures the engine remains deterministic, scalable, and easy to test.

The specification provides the complete engineering blueprint required to implement the Metadata Engine module.

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

**SPEC-002 — Metadata Engine**

Version 1.0.0

End of File
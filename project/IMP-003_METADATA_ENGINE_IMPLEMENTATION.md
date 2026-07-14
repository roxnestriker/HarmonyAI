# IMP-003 — METADATA ENGINE IMPLEMENTATION

| Property | Value |
|----------|-------|
| Document ID | IMP-003 |
| Document Name | Metadata Engine Implementation Prompt |
| Version | 1.0.0 |
| Status | Approved |
| Target AI | Coding AI |
| Maintained By | Architecture Team |

---

# PURPOSE

This document instructs the Coding AI to implement the complete Metadata Engine for Harmony AI.

The Metadata Engine is responsible for extracting, validating, normalizing, and transforming metadata from supported audio files into Harmony AI domain models.

The implementation SHALL strictly comply with all referenced project documentation.

This prompt is implementation-only.

Do NOT redesign architecture.

Do NOT invent APIs.

Do NOT modify database schema.

---

# REQUIRED REFERENCE DOCUMENTS

Read and comply with:

DOC-001 Project Foundation

DOC-002 Development Workflow

DOC-003 Development Standards

DOC-004 Architecture Principles

PRD-001 Music Library Management

ARCH-001 Music Library Architecture

DB-001 Initial Database Schema

SPEC-002 Metadata Engine

API-001 Repository Interfaces

API-002 Domain Events

API-003 Service Interfaces

PROJECT.md

These documents are authoritative.

---

# IMPLEMENTATION OBJECTIVE

Implement the complete Metadata Engine.

The implementation shall:

- Read metadata
- Normalize metadata
- Validate metadata
- Extract technical properties
- Build domain models
- Publish events
- Support multiple metadata providers
- Report metadata quality

No artwork extraction.

No duplicate detection.

No statistics generation.

No UI.

---

# IMPLEMENTATION SCOPE

Implement:

Metadata Engine

Metadata Reader

Metadata Provider Interface

Tag Normalizer

Technical Analyzer

Metadata Validator

Quality Calculator

Domain Builder

Configuration

Logging

Tests

Documentation

---

# PROJECT STRUCTURE

Implement inside:

backend/

metadata/

engine.py

providers/

base.py

mutagen_provider.py

reader.py

normalizer.py

validator.py

quality.py

technical.py

builder.py

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

No circular imports

No duplicated logic

No ORM access

No global state

---

# SUPPORTED AUDIO FORMATS

Implement readers for:

FLAC

MP3

M4A

AAC

OGG

OPUS

WAV

AIFF

APE

WMA

Future providers shall be pluggable.

---

# METADATA EXTRACTION

Extract:

Title

Artist

Album Artist

Album

Genre

Track Number

Disc Number

Composer

Conductor

Year

ISRC

MusicBrainz IDs

ReplayGain

Comment

Publisher

Grouping

Language

Duration

Bitrate

Sample Rate

Bit Depth

Channels

Codec

Container

File Size

---

# NORMALIZATION

Implement:

Whitespace trimming

Track parsing

Disc parsing

Artist normalization

Album normalization

Genre normalization

Year validation

ReplayGain normalization

MusicBrainz validation

Normalization shall never modify source files.

---

# VALIDATION

Validate:

Required fields

Numeric values

Date values

Identifiers

Encoding

Malformed tags

Return structured validation results.

---

# QUALITY CALCULATION

Implement metadata quality scoring.

Levels:

Excellent

Good

Acceptable

Poor

Incomplete

Report:

Warnings

Errors

Suggestions

Missing fields

---

# DOMAIN BUILDER

Generate domain objects for:

Artist

Album

Song

Genre

Lyrics Reference

Artwork Reference

Repositories handle persistence.

---

# EVENTS

Publish only API-002 events.

Examples:

MetadataRead

MetadataValidated

MetadataNormalized

SongCreated

SongUpdated

ArtistCreated

AlbumCreated

MetadataFailed

Do not invent events.

---

# REPOSITORIES

Use Repository Interfaces only.

No SQLAlchemy.

No direct database access.

---

# SERVICES

Support Metadata Service defined in API-003.

Do not implement service layer.

---

# ERROR HANDLING

Recoverable:

Missing tags

Unsupported optional fields

Invalid ReplayGain

Continue processing.

Fatal:

Unreadable file

Unsupported format

Corrupted metadata

Abort processing for current file only.

---

# PERFORMANCE

Optimize for:

Large libraries

Minimal file access

Single-pass extraction

Low memory usage

Batch repository usage

Future parallel execution

---

# CONFIGURATION

Implement configurable:

Read ReplayGain

Normalize Genres

Normalize Artist Names

Read Comments

Read MusicBrainz IDs

Strict Validation

Supported Providers

---

# LOGGING

Support:

DEBUG

INFO

WARNING

ERROR

CRITICAL

Log processing lifecycle without exposing sensitive data.

---

# TESTING

Generate:

Unit Tests

Metadata Extraction Tests

Normalization Tests

Validation Tests

Quality Score Tests

Provider Tests

Failure Tests

Performance Tests

Integration Tests

Target:

500,000 simulated files.

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

Provider Interface

↓

Module 4

Mutagen Provider

↓

Module 5

Metadata Reader

↓

Module 6

Normalizer

↓

Module 7

Validator

↓

Module 8

Technical Analyzer

↓

Module 9

Quality Calculator

↓

Module 10

Domain Builder

↓

Module 11

Metadata Engine

↓

Module 12

Events

↓

Module 13

Tests

↓

Module 14

Documentation

Wait for approval after every module.

---

# SUCCESS CRITERIA

Implementation is complete only when:

✓ Metadata extracted correctly

✓ Normalization implemented

✓ Validation implemented

✓ Domain models generated

✓ Repository interfaces used

✓ Events published

✓ Unit tests pass

✓ Ruff passes

✓ Black passes

✓ Architecture compliance maintained

---

# IMPORTANT

If implementation conflicts with any architecture, specification, database, or API document:

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

Metadata Engine Configuration

Wait for approval before continuing.
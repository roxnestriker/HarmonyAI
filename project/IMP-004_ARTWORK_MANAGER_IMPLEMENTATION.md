# IMP-004 — ARTWORK MANAGER IMPLEMENTATION

| Property | Value |
|----------|-------|
| Document ID | IMP-004 |
| Document Name | Artwork Manager Implementation Prompt |
| Version | 1.0.0 |
| Status | Approved |
| Target AI | Coding AI |
| Maintained By | Architecture Team |

---

# PURPOSE

This document instructs the Coding AI to implement the complete Artwork Manager module for Harmony AI.

The Artwork Manager is responsible for discovering, extracting, validating, processing, caching, and serving artwork associated with music files.

The implementation SHALL comply with every referenced project document.

This prompt is implementation-only.

The Coding AI SHALL NOT redesign architecture.

The Coding AI SHALL NOT invent APIs.

The Coding AI SHALL NOT modify database schema.

---

# REQUIRED REFERENCE DOCUMENTS

Read before generating any code:

DOC-001 Project Foundation

DOC-002 Development Workflow

DOC-003 Development Standards

DOC-004 Architecture Principles

PRD-001 Music Library Management

ARCH-001 Music Library Architecture

DB-001 Initial Database Schema

SPEC-003 Artwork Manager

API-001 Repository Interfaces

API-002 Domain Events

API-003 Service Interfaces

PROJECT.md

These documents are authoritative.

---

# IMPLEMENTATION OBJECTIVE

Implement the complete Artwork Manager.

The implementation shall:

- Discover artwork
- Extract embedded artwork
- Discover folder artwork
- Validate images
- Generate thumbnails
- Cache processed artwork
- Publish domain events
- Integrate with repositories

No metadata extraction.

No duplicate detection.

No AI image processing.

No online downloads.

---

# IMPLEMENTATION SCOPE

Implement:

Artwork Manager

Artwork Extractor

Embedded Artwork Reader

Folder Artwork Finder

Image Validator

Thumbnail Generator

Artwork Cache

Artwork Hash Calculator

Configuration

Logging

Tests

Documentation

---

# PROJECT STRUCTURE

Implement inside:

backend/

artwork/

manager.py

extractor.py

embedded.py

folder.py

validator.py

thumbnail.py

cache.py

hashing.py

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

No global state

---

# ARTWORK SOURCES

Search in this order:

1. Embedded artwork

2. Folder artwork

3. Cached artwork

4. Online provider (framework only)

---

# EMBEDDED ARTWORK

Support:

FLAC Picture Block

ID3 APIC

MP4 Cover

Vorbis Cover

The implementation shall support provider abstraction.

---

# FOLDER ARTWORK

Search for:

cover.jpg

cover.png

folder.jpg

folder.png

front.jpg

front.png

album.jpg

album.png

Search shall be case-insensitive.

Configurable filenames shall be supported.

---

# IMAGE VALIDATION

Validate:

Image format

Image dimensions

Image readability

MIME type

Corrupted image

Zero-byte image

Unsupported format

Return structured validation results.

---

# SUPPORTED IMAGE FORMATS

Implement support for:

JPEG

PNG

BMP

GIF (first frame only)

Future-ready:

WEBP

AVIF

---

# THUMBNAIL GENERATION

Generate:

64×64

128×128

256×256

512×512

Thumbnail generation shall preserve aspect ratio.

Avoid unnecessary recompression.

---

# HASHING

Generate SHA-256 hash for artwork.

Hash shall be used for:

Duplicate detection

Cache lookup

Repository lookup

Avoid recalculating existing hashes.

---

# CACHE

Implement:

Artwork Cache

Thumbnail Cache

Cache Validation

Cache Invalidation

Orphan Cleanup

Cache shall reuse existing artwork whenever possible.

---

# REPOSITORIES

Use Repository Interfaces only.

Do NOT access SQLAlchemy directly.

---

# EVENTS

Publish only API-002 events.

Examples:

ArtworkDiscovered

ArtworkExtracted

ArtworkValidated

ArtworkCached

ThumbnailGenerated

ArtworkUpdated

ArtworkMissing

ArtworkFailed

Do NOT invent events.

---

# SERVICES

Support Artwork Service defined in API-003.

Do NOT implement service layer.

---

# ERROR HANDLING

Recoverable:

Missing artwork

Corrupted image

Unsupported format

Cache miss

Continue processing.

Fatal:

Decoder failure

Cache unavailable

Memory allocation failure

Abort artwork processing for current item.

---

# PERFORMANCE

Optimize for:

Large libraries

Low memory usage

Cache reuse

Minimal disk access

Single decode per image

Future parallel thumbnail generation

---

# CONFIGURATION

Implement configurable:

Extract Embedded Artwork

Search Folder Artwork

Generate Thumbnails

Thumbnail Sizes

Preferred Artwork Source

Artwork Cache Size

Cache Directory

Image Quality

Maximum Artwork Resolution

---

# LOGGING

Support:

DEBUG

INFO

WARNING

ERROR

CRITICAL

Log artwork lifecycle without exposing sensitive information.

---

# TESTING

Generate:

Unit Tests

Extraction Tests

Validation Tests

Thumbnail Tests

Hash Tests

Cache Tests

Failure Tests

Performance Tests

Integration Tests

Target:

100,000 artwork images (simulated)

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

Embedded Artwork Reader

↓

Module 4

Folder Artwork Finder

↓

Module 5

Artwork Extractor

↓

Module 6

Image Validator

↓

Module 7

Hash Calculator

↓

Module 8

Thumbnail Generator

↓

Module 9

Artwork Cache

↓

Module 10

Artwork Manager

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

✓ Embedded artwork extracted

✓ Folder artwork discovered

✓ Validation implemented

✓ Hash generation implemented

✓ Thumbnail generation implemented

✓ Cache implemented

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

Artwork Manager Configuration

Wait for approval before continuing.    
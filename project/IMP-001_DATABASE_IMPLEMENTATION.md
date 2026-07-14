# IMP-001 — DATABASE IMPLEMENTATION

| Property | Value |
|----------|-------|
| Document ID | IMP-001 |
| Document Name | Database Implementation Prompt |
| Version | 1.0.0 |
| Status | Approved |
| Target AI | Coding AI |
| Maintained By | Architecture Team |

---

# PURPOSE

This document is an implementation prompt for the Coding AI.

Its purpose is to generate production-quality code for the Harmony AI Database Layer.

The implementation SHALL strictly follow all referenced project documents.

This prompt is implementation-only.

The Coding AI shall NOT redesign architecture.

The Coding AI shall NOT invent APIs.

The Coding AI shall NOT modify requirements.

---

# REQUIRED REFERENCE DOCUMENTS

Before generating any code, read and comply with:

DOC-001 Project Foundation

DOC-002 Development Workflow

DOC-003 Development Standards

DOC-004 Architecture Principles

PRD-001 Music Library Management

ARCH-001 Music Library Architecture

DB-001 Initial Database Schema

API-001 Repository Interfaces

API-002 Domain Events

API-003 Service Interfaces

PROJECT.md

These documents are authoritative.

If conflicts exist:

Architecture > Database > Specification > Implementation

---

# IMPLEMENTATION OBJECTIVE

Implement the complete Database Layer for Harmony AI.

This includes:

• SQLAlchemy models

• Alembic migrations

• Repository implementations

• Database configuration

• Session management

• Unit of Work

• Base classes

• Database initialization

No UI.

No AI.

No Metadata processing.

No Folder Scanner.

Only Database Layer.

---

# IMPLEMENTATION SCOPE

Implement:

Database package

SQLAlchemy Base

SQLite configuration

Alembic configuration

ORM models

Relationships

Indexes

Constraints

Repositories

Transaction support

Dependency Injection

Logging

Configuration

Exceptions

Unit Tests

Documentation

---

# PROJECT STRUCTURE

Implement inside:

backend/

database/

models/

repositories/

migrations/

config/

exceptions/

tests/

---

Do NOT create files outside these folders.

---

# IMPLEMENTATION RULES

Follow:

Clean Architecture

SOLID

Repository Pattern

Dependency Injection

Type Hints

Dataclasses where appropriate

PEP8

Black formatting

Ruff compatibility

No duplicated logic.

No global state.

No circular imports.

---

# DATABASE

Database:

SQLite

ORM:

SQLAlchemy 2.x

Migration:

Alembic

Future compatibility:

PostgreSQL

---

# IMPLEMENTATION ORDER

Step 1

Create Base ORM configuration

Step 2

Database Session

Step 3

Database Configuration

Step 4

ORM Models

Artist

Album

Song

SongFile

Genre

Artwork

Lyrics

Playlist

PlaylistItem

History

Rating

Favorite

Statistics

Recommendation

LibraryLocation

ScanHistory

Tag

SongTag

Step 5

Relationships

Step 6

Indexes

Step 7

Constraints

Step 8

Repositories

Step 9

Unit of Work

Step 10

Alembic Initial Migration

Step 11

Unit Tests

Step 12

Documentation

---

# REPOSITORY RULES

Repositories shall implement API-001 exactly.

Do not invent methods.

Repositories return Domain Models.

Never expose ORM models.

---

# EVENTS

Repositories shall publish events defined in API-002 where appropriate.

Do not invent events.

---

# SERVICES

Repositories shall support API-003.

Do not implement services.

Only support them.

---

# TESTING

Generate:

Unit Tests

Repository Tests

Migration Tests

Relationship Tests

Constraint Tests

Index Tests

SQLite Integration Tests

---

# DOCUMENTATION

Every module shall include:

Module docstring

Class documentation

Method documentation

Type hints

Usage example

---

# OUTPUT FORMAT

Generate code module-by-module.

Never generate the entire implementation in one response.

For every module provide:

1.

Purpose

2.

Architecture Notes

3.

Implementation

4.

Tests

5.

Explanation

Wait for approval before generating the next module.

---

# IMPORTANT

If implementation differs from Architecture or Database documents:

STOP

Explain the conflict.

Do NOT guess.

Do NOT redesign.

---

# SUCCESS CRITERIA

Implementation is complete only when:

✓ Database builds successfully

✓ Alembic migration succeeds

✓ All relationships work

✓ Unit tests pass

✓ Ruff passes

✓ Black passes

✓ Architecture compliance maintained

✓ Repository interfaces implemented

✓ Documentation completed

---

# END OF IMPLEMENTATION PROMPT

Begin with:

Module 1

Database Configuration

Wait for approval after completing each module.
# DB-001 — INITIAL DATABASE SCHEMA

| Property | Value |
|----------|-------|
| Document ID | DB-001 |
| Document Name | Initial Database Schema |
| Version | 1.0.0 |
| Status | Draft |
| Owner | Database Architect |
| Maintained By | Chief Architect |
| Last Updated | 2026-07-13 |
| Related Documents | PRD-001, ARCH-001, DOC-003, PROJECT.md |

---

# Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Database Architect|

---

# Table of Contents

## Part I — Database Foundation

1. Purpose
2. Database Goals
3. Design Principles
4. Technology Stack
5. Naming Conventions

## Part II — Entity Model

6. Core Entities
7. Relationship Overview
8. Database Layers
9. Data Ownership
10. Entity Lifecycle

## Part III — Core Tables

11. Artists
12. Albums
13. Songs
14. Genres
15. Song Files

## Part IV — Library Tables

16. Library Locations
17. Scan History
18. Artwork
19. Lyrics
20. Tags

## Part V — User Data

21. Playlists
22. Playlist Items
23. History
24. Ratings
25. Favorites

## Part VI — AI Tables

26. Statistics
27. Recommendations
28. Embeddings (Future)
29. Similarity
30. AI Cache

## Part VII — Infrastructure

31. Index Strategy
32. Constraints
33. Migration Strategy
34. Backup Strategy
35. Summary

# Chapter 1 — Purpose

## 1.1 Purpose

The Harmony AI database is the authoritative source of structured information describing the user's music collection.

The database stores metadata, relationships, user activity, AI data, and application configuration while preserving complete separation from the original audio files.

Original music files always remain on the user's storage devices.

Harmony AI stores references to those files rather than embedding audio data within the database.

---

## 1.2 Scope

This document defines:

- Database architecture
- Entity relationships
- Table definitions
- Primary keys
- Foreign keys
- Constraints
- Index strategy
- Migration strategy
- Future extensibility

Implementation details are defined separately within SQLAlchemy models and Alembic migrations.

---

# Chapter 2 — Database Goals

The database shall:

- Support libraries exceeding 500,000 songs.
- Support multiple library locations.
- Preserve data integrity.
- Minimize duplication.
- Enable fast searching.
- Support future AI modules.
- Support cloud synchronization.
- Support plugin extensions.
- Support future database engines.

---

# Chapter 3 — Design Principles

Harmony AI follows the following database principles.

## Normalization

The schema should remain normalized while avoiding unnecessary complexity.

---

## Immutable Identity

Each business entity has one permanent identifier.

IDs never change.

---

## Separation of Concerns

Separate:

- Music Metadata
- User Data
- AI Data
- Configuration
- Statistics

---

## Future Compatibility

Schema evolution should require migrations rather than redesign.

---

## Referential Integrity

Foreign key relationships should protect database consistency.

---

# Chapter 4 — Technology Stack

Initial implementation:

Database Engine

SQLite

ORM

SQLAlchemy

Migration

Alembic

Future support:

- PostgreSQL
- MySQL

The schema should remain database-independent wherever practical.

---

# Chapter 5 — Naming Conventions

Tables

Plural nouns.

Examples:

Artists

Albums

Songs

Genres

Columns

snake_case

Examples

artist_id

album_id

created_at

updated_at

Indexes

idx_<table>_<column>

Example

idx_song_title

Foreign Keys

fk_<table>_<reference>

Primary Keys

id

UUID support may be introduced in future versions if required.

---

# Chapter Summary

The Database Foundation establishes the principles, goals, and conventions that govern every table within Harmony AI.

The following sections define the entity model and table relationships that implement these principles.

---

# End of Part 1

# Part II — Entity Model

# Chapter 6 — Core Entities

## 6.1 Purpose

Core Entities represent the primary business objects within Harmony AI.

These entities describe the user's music collection independently of how the data is stored or presented.

Each entity has a unique identity and well-defined relationships with other entities.

---

## 6.2 Core Entity List

The initial database consists of the following primary entities:

### Music Library

- Library Location
- Scan Job
- Scan Result

---

### Music Metadata

- Song
- Song File
- Artist
- Album
- Genre
- Artwork
- Lyrics

---

### User Data

- Playlist
- Playlist Item
- Rating
- Favorite
- Play History

---

### AI Data

- Statistics
- Recommendation
- Similarity
- AI Cache

---

### Configuration

- Settings
- User Profile

---

## 6.3 Entity Responsibilities

### Artist

Represents a musical artist or performer.

Stores information shared across all songs and albums by that artist.

---

### Album

Represents a music album.

Groups multiple songs together.

Maintains artwork and release information.

---

### Song

Represents the logical musical work.

Contains normalized metadata independent of storage location.

---

### Song File

Represents a physical audio file.

Stores file-specific information including:

- File Path
- File Hash
- Codec
- Sample Rate
- Bit Depth
- File Size

Multiple Song Files may represent the same Song.

---

### Genre

Represents a musical genre.

Shared across multiple songs.

---

### Artwork

Represents artwork associated with an album or artist.

Supports multiple artwork types.

---

### Lyrics

Stores synchronized or unsynchronized lyrics.

Linked to one Song.

---

### Playlist

Represents a user-defined playlist.

Contains ordered Playlist Items.

---

### Statistics

Stores calculated analytics.

Statistics are regenerated when required.

---

## 6.4 Entity Independence

Business entities should remain independent of:

- SQLite
- SQLAlchemy
- PySide6
- Flutter
- AI Models

Persistence belongs to Infrastructure.

---

# Chapter 7 — Relationship Overview

## 7.1 Philosophy

Relationships should accurately model the real-world music collection while minimizing duplication.

Normalization is preferred unless denormalization provides measurable performance benefits.

---

## 7.2 Primary Relationships

```
Artist

  │

  ├──────────────┐

  ▼              ▼

Albums         Songs

  │              ▲

  └──────┐       │

         ▼       │

      Song Files │

         │       │

         ▼       │

      Artwork    │

                 │

Genres───────────┘

Songs────────Lyrics

Songs────────History

Songs────────Ratings

Songs────────Favorites

Songs────────Playlist Items
```

---

## 7.3 Cardinality

### Artist → Album

One Artist

↓

Many Albums

---

### Album → Song

One Album

↓

Many Songs

---

### Song → Song File

One Song

↓

One or Many Song Files

This allows multiple copies of the same recording.

---

### Genre → Song

One Genre

↓

Many Songs

Future versions may support multiple genres per song.

---

### Playlist → Playlist Item

One Playlist

↓

Many Playlist Items

---

### Song → History

One Song

↓

Many History Records

---

### Song → Rating

One Song

↓

Zero or One Rating

---

### Song → Favorite

One Song

↓

Zero or One Favorite Record

---

## 7.4 Relationship Principles

Relationships should:

- Preserve integrity.
- Minimize duplication.
- Support future expansion.
- Avoid circular dependencies.

---

# Chapter 8 — Database Layers

Harmony AI separates data into logical layers.

```
Configuration

↓

Library

↓

Metadata

↓

User Data

↓

AI Data
```

---

## Configuration Layer

Contains:

- Settings
- Profiles
- Preferences

---

## Library Layer

Contains:

- Library Locations
- Scan History
- Song Files

---

## Metadata Layer

Contains:

- Songs
- Albums
- Artists
- Genres
- Artwork
- Lyrics

---

## User Layer

Contains:

- Playlists
- History
- Ratings
- Favorites

---

## AI Layer

Contains:

- Recommendations
- Statistics
- Similarity
- AI Cache

---

This separation improves maintainability and future scalability.

---

# Chapter 9 — Data Ownership

Each entity has one authoritative owner.

| Entity | Owner |
|---------|-------|
| Library Location | Library Manager |
| Song File | Folder Scanner |
| Song | Metadata Engine |
| Artist | Metadata Engine |
| Album | Metadata Engine |
| Genre | Metadata Engine |
| Artwork | Artwork Manager |
| Lyrics | Metadata Engine |
| Statistics | Statistics Engine |
| Recommendation | AI Engine |
| Playlist | Playlist Manager |
| History | Playback History |
| Rating | User |
| Favorite | User |

Ownership prevents conflicting updates between modules.

---

## Modification Rules

Only the owning component should create, update, or delete records for its entities.

Other components should request changes through services or publish events.

Direct modification by unrelated modules is prohibited.

---

# Chapter 10 — Entity Lifecycle

## Song Lifecycle

```
File Discovered

↓

Metadata Extracted

↓

Song Created

↓

Artwork Linked

↓

Statistics Updated

↓

Duplicate Checked

↓

Available for Search

↓

Available for AI
```

---

## Artwork Lifecycle

```
Artwork Discovered

↓

Validated

↓

Cached

↓

Linked

↓

Thumbnail Generated
```

---

## Playlist Lifecycle

```
Created

↓

Songs Added

↓

Modified

↓

Exported (Future)

↓

Deleted
```

---

## Recommendation Lifecycle (Future)

```
History Updated

↓

Statistics Calculated

↓

AI Analysis

↓

Recommendations Generated

↓

Presented to User
```

---

## Lifecycle Principles

Every entity should:

- Have one creation point.
- Have one owning component.
- Support updates when appropriate.
- Support soft deletion where appropriate.
- Preserve referential integrity throughout its lifecycle.

---

## Chapter Summary

The Entity Model establishes the conceptual structure of Harmony AI's database.

It defines the business entities, their relationships, ownership boundaries, and lifecycle, providing the foundation for the detailed table definitions that follow.

---

# End of Part 2

Next:

# Part III — Core Tables

# Part III — Core Tables

# Chapter 11 — Artists

## 11.1 Purpose

The Artists table stores information about musical artists.

An Artist represents a performer, band, orchestra, composer, or contributor associated with one or more songs or albums.

Artist information is normalized to avoid duplication.

---

## 11.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| name | TEXT | No | Display name |
| sort_name | TEXT | Yes | Sort-friendly name |
| musicbrainz_id | TEXT | Yes | MusicBrainz Artist ID |
| country | TEXT | Yes | Country code |
| artist_type | TEXT | Yes | Person, Band, Orchestra, etc. |
| artwork_id | INTEGER | Yes | Default artist image |
| created_at | DATETIME | No | Record creation time |
| updated_at | DATETIME | No | Last modification |

---

## 11.3 Constraints

- Primary Key on `id`
- Unique Constraint on `(musicbrainz_id)` when present
- Unique Index on `(name)` where appropriate

---

## 11.4 Relationships

Artist

↓

Albums (1:N)

Artist

↓

Songs (1:N)

Artist

↓

Artwork (1:1 Optional)

---

## 11.5 Planned Indexes

```
idx_artist_name

idx_artist_sort_name

idx_artist_musicbrainz
```

---

# Chapter 12 — Albums

## 12.1 Purpose

The Albums table stores album-level information shared across multiple songs.

---

## 12.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| artist_id | INTEGER | No | Album Artist |
| title | TEXT | No | Album title |
| sort_title | TEXT | Yes | Sort title |
| year | INTEGER | Yes | Release year |
| release_date | DATE | Yes | Full release date |
| album_type | TEXT | Yes | Album, EP, Single, Live |
| total_discs | INTEGER | Yes | Disc count |
| artwork_id | INTEGER | Yes | Album artwork |
| musicbrainz_id | TEXT | Yes | MusicBrainz Release ID |
| created_at | DATETIME | No | Created timestamp |
| updated_at | DATETIME | No | Updated timestamp |

---

## 12.3 Constraints

- PK(id)
- FK(artist_id → Artists.id)
- FK(artwork_id → Artwork.id)

---

## 12.4 Relationships

Album

↓

Songs (1:N)

Album

↓

Artwork (1:1)

---

## 12.5 Planned Indexes

```
idx_album_title

idx_album_artist

idx_album_year

idx_album_musicbrainz
```

---

# Chapter 13 — Songs

## 13.1 Purpose

The Songs table represents the logical musical work.

A Song is independent of any physical audio file.

---

## 13.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| artist_id | INTEGER | No | Primary artist |
| album_id | INTEGER | Yes | Album |
| genre_id | INTEGER | Yes | Genre |
| title | TEXT | No | Song title |
| track_number | INTEGER | Yes | Track number |
| disc_number | INTEGER | Yes | Disc number |
| composer | TEXT | Yes | Composer |
| conductor | TEXT | Yes | Conductor |
| bpm | REAL | Yes | Beats Per Minute |
| duration_ms | INTEGER | No | Duration |
| lyrics_id | INTEGER | Yes | Lyrics |
| musicbrainz_recording_id | TEXT | Yes | Recording ID |
| replaygain_track | REAL | Yes | ReplayGain |
| replaygain_album | REAL | Yes | Album ReplayGain |
| created_at | DATETIME | No | Created timestamp |
| updated_at | DATETIME | No | Updated timestamp |

---

## 13.3 Constraints

Primary Key

Foreign Keys:

- artist_id
- album_id
- genre_id
- lyrics_id

---

## 13.4 Relationships

Song

↓

Song Files (1:N)

Song

↓

History (1:N)

Song

↓

Playlist Items (1:N)

Song

↓

Ratings (1:1)

Song

↓

Favorites (1:1)

---

## 13.5 Planned Indexes

```
idx_song_title

idx_song_artist

idx_song_album

idx_song_duration

idx_song_musicbrainz
```

---

# Chapter 14 — Genres

## 14.1 Purpose

Genres normalize musical classifications.

Future versions may support multiple genres per song using a junction table.

---

## 14.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| name | TEXT | No | Genre name |
| parent_genre_id | INTEGER | Yes | Parent genre |
| description | TEXT | Yes | Description |
| created_at | DATETIME | No | Created |
| updated_at | DATETIME | No | Updated |

---

## 14.3 Relationships

Genre

↓

Songs (1:N)

Genre

↓

Child Genres (1:N)

---

## 14.4 Planned Indexes

```
idx_genre_name
```

---

# Chapter 15 — Song Files

## 15.1 Purpose

Song Files represent the physical audio files stored on disk.

This separation allows multiple files to reference the same logical Song.

Examples:

- FLAC
- MP3
- Backup copy
- NAS copy
- OneDrive cache

---

## 15.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| song_id | INTEGER | No | Related Song |
| library_location_id | INTEGER | No | Root library |
| relative_path | TEXT | No | Relative path |
| file_name | TEXT | No | File name |
| extension | TEXT | No | Extension |
| file_hash | TEXT | No | SHA-256 hash |
| file_size | INTEGER | No | Bytes |
| codec | TEXT | No | Codec |
| bitrate | INTEGER | Yes | kbps |
| sample_rate | INTEGER | No | Hz |
| bit_depth | INTEGER | Yes | Bits |
| channels | INTEGER | No | Audio channels |
| last_modified | DATETIME | No | File timestamp |
| first_discovered | DATETIME | No | Initial scan |
| last_scanned | DATETIME | No | Last scan |
| is_missing | BOOLEAN | No | Missing flag |
| created_at | DATETIME | No | Created |
| updated_at | DATETIME | No | Updated |

---

## 15.3 Constraints

Primary Key

Foreign Keys:

- song_id
- library_location_id

Unique Constraint:

```
library_location_id + relative_path
```

This prevents duplicate database records for the same file.

---

## 15.4 Relationships

Song

↓

Song Files (1:N)

Library Location

↓

Song Files (1:N)

---

## 15.5 Planned Indexes

```
idx_songfile_hash

idx_songfile_path

idx_songfile_modified

idx_songfile_codec

idx_songfile_samplerate

idx_songfile_song
```

---

## 15.6 Design Rationale

Separating `Song` from `SongFile` provides several long-term benefits:

- Multiple file copies can reference one logical song.
- File metadata can change without affecting song metadata.
- Cloud synchronization becomes simpler.
- Duplicate detection becomes more accurate.
- Audio quality comparisons (e.g., FLAC vs. MP3) are easier.
- Future transcoding or caching features remain isolated from the core music metadata.

---

## Chapter Summary

The Core Tables define the fundamental entities of Harmony AI:

- Artists
- Albums
- Songs
- Genres
- Song Files

These tables form the normalized foundation of the Music Library and establish the relationships upon which all higher-level features will be built.

---

# End of Part 3

# Part IV — Library Tables

# Chapter 16 — Library Locations

## 16.1 Purpose

The Library Locations table stores all root directories managed by Harmony AI.

A user may register multiple music libraries located on different drives, network shares, or cloud-synchronized folders.

---

## 16.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| name | TEXT | No | Friendly library name |
| root_path | TEXT | No | Root directory |
| location_type | TEXT | No | Local, Network, Cloud |
| is_enabled | BOOLEAN | No | Enable/Disable scanning |
| auto_scan | BOOLEAN | No | Automatic monitoring |
| scan_interval | INTEGER | Yes | Minutes between scans |
| total_files | INTEGER | Yes | Cached statistics |
| total_size | INTEGER | Yes | Cached size in bytes |
| last_scan | DATETIME | Yes | Last completed scan |
| created_at | DATETIME | No | Created timestamp |
| updated_at | DATETIME | No | Updated timestamp |

---

## 16.3 Constraints

Primary Key

Unique:

```
root_path
```

---

## 16.4 Relationships

Library Location

↓

Song Files (1:N)

Library Location

↓

Scan History (1:N)

---

## 16.5 Planned Indexes

```
idx_library_root

idx_library_enabled

idx_library_last_scan
```

---

# Chapter 17 — Scan History

## 17.1 Purpose

The Scan History table records every scan performed by Harmony AI.

Historical scan data supports diagnostics, performance analysis, and future scheduling.

---

## 17.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| library_location_id | INTEGER | No | Library scanned |
| scan_type | TEXT | No | Full, Incremental, Folder |
| started_at | DATETIME | No | Start time |
| completed_at | DATETIME | Yes | Completion time |
| status | TEXT | No | Success, Failed, Cancelled |
| files_scanned | INTEGER | No | Number processed |
| new_files | INTEGER | No | Newly discovered |
| updated_files | INTEGER | No | Modified |
| deleted_files | INTEGER | No | Removed |
| failed_files | INTEGER | No | Processing failures |
| duration_ms | INTEGER | Yes | Total scan duration |
| error_message | TEXT | Yes | Failure summary |
| created_at | DATETIME | No | Record creation |

---

## 17.3 Relationships

Library Location

↓

Scan History (1:N)

---

## 17.4 Planned Indexes

```
idx_scan_started

idx_scan_status

idx_scan_library
```

---

# Chapter 18 — Artwork

## 18.1 Purpose

The Artwork table manages all images associated with artists and albums.

Artwork is stored independently from metadata to simplify caching and future synchronization.

---

## 18.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| artwork_type | TEXT | No | Album, Artist, Disc |
| source | TEXT | No | Embedded, Folder, Cache, Online |
| file_path | TEXT | Yes | Cached artwork path |
| mime_type | TEXT | Yes | Image format |
| width | INTEGER | Yes | Pixels |
| height | INTEGER | Yes | Pixels |
| file_size | INTEGER | Yes | Bytes |
| checksum | TEXT | Yes | Image hash |
| created_at | DATETIME | No | Created timestamp |
| updated_at | DATETIME | No | Updated timestamp |

---

## 18.3 Relationships

Artwork may be associated with:

- Artist
- Album

Future:

- Playlist
- User Profile

---

## 18.4 Planned Indexes

```
idx_artwork_source

idx_artwork_checksum
```

---

# Chapter 19 — Lyrics

## 19.1 Purpose

The Lyrics table stores synchronized and unsynchronized lyrics.

Lyrics are separated from Songs to support multiple providers and future translations.

---

## 19.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| lyrics_type | TEXT | No | Plain, LRC |
| language | TEXT | Yes | ISO language code |
| provider | TEXT | Yes | Source |
| content | TEXT | Yes | Lyrics text |
| synchronized | BOOLEAN | No | LRC available |
| checksum | TEXT | Yes | Content hash |
| created_at | DATETIME | No | Created timestamp |
| updated_at | DATETIME | No | Updated timestamp |

---

## 19.3 Relationships

Lyrics

↓

Song (1:1)

Future:

Lyrics

↓

Translations (1:N)

---

## 19.4 Planned Indexes

```
idx_lyrics_provider

idx_lyrics_language
```

---

# Chapter 20 — Tags

## 20.1 Purpose

The Tags table provides a flexible tagging system beyond traditional genres.

Tags enable custom organization without modifying metadata.

Examples:

- Workout
- Relax
- Family
- Favorite Guitar
- Live Recording
- Instrumental

---

## 20.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| name | TEXT | No | Tag name |
| color | TEXT | Yes | UI display color |
| description | TEXT | Yes | Optional notes |
| created_at | DATETIME | No | Created timestamp |
| updated_at | DATETIME | No | Updated timestamp |

---

## 20.3 Song Tags (Junction Table)

Since one song may have many tags and one tag may apply to many songs, Harmony AI uses a junction table.

### SongTags

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| song_id | INTEGER | No | FK → Songs |
| tag_id | INTEGER | No | FK → Tags |
| created_at | DATETIME | No | Assigned timestamp |

Composite Primary Key:

```
(song_id, tag_id)
```

---

## 20.4 Relationships

Song

↓

SongTags

↓

Tags

Many-to-Many

---

## 20.5 Planned Indexes

```
idx_tag_name

idx_songtag_song

idx_songtag_tag
```

---

## 20.6 Future Uses

The tagging system will support:

- Smart Playlists
- AI Training Labels
- Search Filters
- Recommendation Bias
- Personal Collections
- Temporary Collections

---

## Chapter Summary

The Library Tables extend the core metadata model with operational and organizational information.

These tables support:

- Multiple library locations
- Scan history and diagnostics
- Artwork management
- Lyrics storage
- Flexible user-defined tagging

Together, they provide the infrastructure required for efficient library maintenance and future feature expansion.

---

# End of Part 4

Next:

# Part V — User Data Tables

# Chapter 21 — Playlists

## 21.1 Purpose

The Playlists table stores user-created and system-generated playlists.

Playlists are logical collections of songs and do not modify the original music library.

Future AI-generated playlists will also use this table.

---

## 21.2 Playlist Types

Harmony AI supports the following playlist categories:

- User Playlist
- Smart Playlist
- AI Playlist
- Imported Playlist
- Temporary Playlist
- System Playlist

---

## 21.3 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| name | TEXT | No | Playlist name |
| description | TEXT | Yes | Optional description |
| playlist_type | TEXT | No | User, Smart, AI |
| artwork_id | INTEGER | Yes | Playlist artwork |
| created_by | TEXT | Yes | User or System |
| is_dynamic | BOOLEAN | No | Smart playlist flag |
| created_at | DATETIME | No | Created timestamp |
| updated_at | DATETIME | No | Updated timestamp |

---

## 21.4 Relationships

Playlist

↓

Playlist Items (1:N)

---

## 21.5 Planned Indexes

```
idx_playlist_name

idx_playlist_type
```

---

# Chapter 22 — Playlist Items

## 22.1 Purpose

Playlist Items define the ordered list of songs within a playlist.

The same song may appear in multiple playlists.

---

## 22.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| playlist_id | INTEGER | No | Playlist reference |
| song_id | INTEGER | No | Song reference |
| position | INTEGER | No | Playlist order |
| added_at | DATETIME | No | Date added |
| added_by | TEXT | Yes | User/System |

---

## 22.3 Constraints

Foreign Keys:

- playlist_id
- song_id

Unique Constraint:

```
playlist_id + position
```

---

## 22.4 Relationships

Playlist

↓

Playlist Items

↓

Songs

Many-to-Many

---

## 22.5 Planned Indexes

```
idx_playlistitem_playlist

idx_playlistitem_song

idx_playlistitem_position
```

---

# Chapter 23 — Play History

## 23.1 Purpose

Play History records every playback event.

This table becomes the primary data source for recommendation algorithms.

Unlike statistics, Play History stores raw listening events.

---

## 23.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| song_id | INTEGER | No | Played song |
| started_at | DATETIME | No | Playback started |
| completed_at | DATETIME | Yes | Playback ended |
| duration_played_ms | INTEGER | No | Played duration |
| completion_percent | REAL | No | Percentage completed |
| skipped | BOOLEAN | No | User skipped |
| device | TEXT | Yes | Playback device |
| source | TEXT | Yes | Manual, Playlist, AI |
| session_id | TEXT | Yes | Listening session |
| created_at | DATETIME | No | Record creation |

---

## 23.3 Relationships

Song

↓

Play History

(1:N)

---

## 23.4 Planned Indexes

```
idx_history_song

idx_history_started

idx_history_session

idx_history_device
```

---

## 23.5 AI Usage

Future AI models may analyze:

- Time of day
- Listening sessions
- Skip behavior
- Completion rate
- Device preference
- Daily habits
- Weekly trends

---

# Chapter 24 — Ratings

## 24.1 Purpose

Ratings store explicit user preferences for songs.

Ratings complement implicit signals such as play history.

---

## 24.2 Rating Scale

Initial version:

- 1
- 2
- 3
- 4
- 5 Stars

Future versions may support configurable rating systems.

---

## 24.3 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| song_id | INTEGER | No | Song reference |
| rating | INTEGER | No | 1–5 |
| rated_at | DATETIME | No | Rating timestamp |
| updated_at | DATETIME | No | Last update |

---

## 24.4 Constraints

One rating per song.

Unique:

```
song_id
```

---

## 24.5 Planned Indexes

```
idx_rating_song

idx_rating_value
```

---

# Chapter 25 — Favorites

## 25.1 Purpose

Favorites provide a quick mechanism for marking preferred songs.

Favorites represent explicit user intent and are valuable inputs for recommendation models.

---

## 25.2 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| song_id | INTEGER | No | Favorite song |
| favorited_at | DATETIME | No | Date favorited |
| notes | TEXT | Yes | Optional notes |

---

## 25.3 Constraints

Unique:

```
song_id
```

---

## 25.4 Planned Indexes

```
idx_favorite_song

idx_favorite_date
```

---

## 25.5 Future Extensions

Favorites may later support:

- Favorite Artist
- Favorite Album
- Favorite Genre
- Favorite Playlist
- Favorite Mix
- Favorite Version

---

# Chapter Summary

The User Data layer captures user interaction with the music library while remaining independent of metadata.

These tables provide the behavioral signals required for personalization and future AI capabilities.

Key responsibilities include:

- Playlist management
- Playlist ordering
- Listening history
- Explicit ratings
- Favorite songs

This separation ensures that user preferences remain distinct from the underlying music metadata and can evolve independently.

---

# End of Part 5

Next:

# Part VI — AI Tables

# Chapter 26 — Statistics

## 26.1 Purpose

The Statistics table stores precomputed analytical information used throughout Harmony AI.

Instead of recalculating expensive queries repeatedly, Harmony AI maintains cached statistics that can be refreshed when the music library changes.

Statistics support dashboards, reports, AI models, and recommendation algorithms.

---

## 26.2 Statistic Categories

Harmony AI maintains statistics for:

- Entire Library
- Artist
- Album
- Genre
- Playlist
- Listening History
- Recommendations

Future releases may introduce additional categories.

---

## 26.3 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| statistic_type | TEXT | No | Library, Artist, Album, Genre |
| entity_type | TEXT | Yes | Related entity type |
| entity_id | INTEGER | Yes | Related entity ID |
| statistic_key | TEXT | No | Statistic name |
| statistic_value | TEXT | No | Stored value |
| calculated_at | DATETIME | No | Last calculation |
| created_at | DATETIME | No | Created timestamp |
| updated_at | DATETIME | No | Updated timestamp |

---

## 26.4 Examples

Examples include:

```
Total Songs

Total Artists

Total Albums

Total Duration

Favorite Genre

Average Bitrate

Library Size

Recently Added
```

---

## 26.5 Planned Indexes

```
idx_statistics_type

idx_statistics_entity

idx_statistics_key
```

---

# Chapter 27 — Recommendations

## 27.1 Purpose

The Recommendations table stores generated recommendations produced by Harmony AI.

Recommendations are generated by AI models but remain separate from listening history.

This separation allows multiple recommendation engines to coexist.

---

## 27.2 Recommendation Types

Supported recommendation categories include:

- Daily Mix
- Weekly Mix
- Discovery
- Forgotten Favorites
- Workout
- Relax
- Driving
- Office
- Family
- Kids
- Prayer
- Seasonal

---

## 27.3 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| song_id | INTEGER | No | Recommended song |
| recommendation_type | TEXT | No | Mix type |
| confidence_score | REAL | No | 0–1 |
| ranking | INTEGER | No | Position |
| generated_by | TEXT | No | Recommendation engine |
| generated_at | DATETIME | No | Creation time |
| expires_at | DATETIME | Yes | Optional expiration |
| created_at | DATETIME | No | Record creation |

---

## 27.4 Relationships

Recommendation

↓

Song

(Many-to-One)

---

## 27.5 Planned Indexes

```
idx_recommendation_type

idx_recommendation_song

idx_recommendation_score

idx_recommendation_generated
```

---

# Chapter 28 — Embeddings (Future)

## 28.1 Purpose

Embeddings store AI vector representations used for semantic search, similarity detection, and future machine learning features.

These vectors are generated by AI models and are not intended for manual editing.

---

## 28.2 Supported Entities

Future embedding targets include:

- Song
- Album
- Artist
- Playlist
- Lyrics

---

## 28.3 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| entity_type | TEXT | No | Song, Album, Artist |
| entity_id | INTEGER | No | Related entity |
| model_name | TEXT | No | Embedding model |
| vector_dimensions | INTEGER | No | Vector size |
| embedding_blob | BLOB | No | Serialized vector |
| created_at | DATETIME | No | Generated timestamp |

---

## 28.4 Future Database Support

SQLite will store serialized vectors.

Future PostgreSQL deployments may use vector extensions for efficient similarity search.

---

## 28.5 Planned Indexes

```
idx_embedding_entity

idx_embedding_model
```

---

# Chapter 29 — Similarity

## 29.1 Purpose

The Similarity table stores relationships between music entities.

Similarity values are calculated by AI models and may combine metadata, listening behavior, and audio analysis.

---

## 29.2 Similarity Types

Examples include:

- Song ↔ Song
- Artist ↔ Artist
- Album ↔ Album
- Genre ↔ Genre

---

## 29.3 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| source_entity_type | TEXT | No | Source entity |
| source_entity_id | INTEGER | No | Source ID |
| target_entity_type | TEXT | No | Target entity |
| target_entity_id | INTEGER | No | Target ID |
| similarity_type | TEXT | No | Metadata, Audio, AI |
| similarity_score | REAL | No | 0–1 |
| calculated_at | DATETIME | No | Calculation date |

---

## 29.4 Planned Indexes

```
idx_similarity_source

idx_similarity_target

idx_similarity_score
```

---

# Chapter 30 — AI Cache

## 30.1 Purpose

The AI Cache stores temporary AI-generated data that can be regenerated.

Cached results improve responsiveness while avoiding unnecessary AI computations.

---

## 30.2 Cache Contents

Examples include:

- Search results
- Recommendation candidates
- AI summaries
- Similarity calculations
- Temporary embeddings
- Playlist generation results

---

## 30.3 Table Definition

| Column | Type | Nullable | Description |
|---------|------|----------|-------------|
| id | INTEGER | No | Primary Key |
| cache_key | TEXT | No | Unique cache identifier |
| cache_type | TEXT | No | Recommendation, Search |
| cache_value | BLOB | No | Serialized data |
| expires_at | DATETIME | Yes | Expiration time |
| created_at | DATETIME | No | Creation timestamp |
| last_accessed | DATETIME | Yes | Last read |

---

## 30.4 Cache Policy

The AI Cache:

- May be cleared safely.
- Does not contain authoritative data.
- May be regenerated.
- Should automatically remove expired entries.

---

## 30.5 Planned Indexes

```
idx_cache_key

idx_cache_type

idx_cache_expiration
```

---

# Chapter Summary

The AI Data layer prepares Harmony AI for advanced intelligent features while remaining independent of the core music library.

These tables support:

- Cached statistics
- Recommendation generation
- Semantic embeddings
- Similarity analysis
- AI-generated cache

The design allows Harmony AI to evolve from a traditional music manager into an intelligent personal music ecosystem without requiring significant database redesign.

---

# End of Part 6

Next:

# Part VII — Database Infrastructure

# Chapter 31 — Index Strategy

## 31.1 Purpose

Indexes improve query performance by reducing the amount of data scanned during database operations.

Harmony AI shall create indexes based on expected query patterns rather than indexing every column.

---

## 31.2 Indexing Principles

Indexes should:

- Improve read performance.
- Minimize write overhead.
- Support common search operations.
- Avoid unnecessary duplication.
- Be reviewed as the application evolves.

---

## 31.3 Primary Key Indexes

Every table shall have a Primary Key.

Primary Keys are automatically indexed.

Examples:

```
Artists.id

Albums.id

Songs.id

SongFiles.id
```

---

## 31.4 Foreign Key Indexes

Foreign Keys should be indexed whenever they participate in joins.

Examples:

```
Songs.artist_id

Songs.album_id

SongFiles.song_id

Albums.artist_id

PlaylistItems.song_id

History.song_id
```

---

## 31.5 Search Indexes

Frequently searched columns should be indexed.

Examples:

```
Artist.name

Album.title

Song.title

Genre.name

SongFile.file_hash

LibraryLocation.root_path
```

---

## 31.6 Composite Indexes

Composite indexes shall be created for common filtering patterns.

Examples:

```
Songs
(artist_id, album_id)

SongFiles
(library_location_id, relative_path)

Recommendations
(recommendation_type, ranking)

History
(song_id, started_at)
```

---

## 31.7 Future Full-Text Search

Future releases may introduce Full-Text Search (FTS).

Candidate entities include:

- Song titles
- Artist names
- Album titles
- Lyrics
- Playlist names

This feature will be implemented without redesigning the existing schema.

---

## 31.8 Index Maintenance

Indexes should be reviewed periodically.

Unused indexes should be removed after performance analysis.

---

# Chapter 32 — Constraints

## 32.1 Purpose

Constraints enforce database integrity independently of application logic.

---

## 32.2 Primary Keys

Every table shall contain one Primary Key.

Primary Keys are immutable.

---

## 32.3 Foreign Keys

Foreign Keys enforce valid relationships between entities.

Invalid references shall not be permitted.

---

## 32.4 Unique Constraints

Examples include:

```
Artists.musicbrainz_id

LibraryLocations.root_path

SongFiles
(library_location_id, relative_path)

Ratings.song_id

Favorites.song_id
```

---

## 32.5 Check Constraints

Examples:

Ratings

```
rating BETWEEN 1 AND 5
```

Completion Percentage

```
completion_percent BETWEEN 0 AND 100
```

Similarity Score

```
similarity_score BETWEEN 0 AND 1
```

Confidence Score

```
confidence_score BETWEEN 0 AND 1
```

---

## 32.6 NOT NULL Constraints

Business-critical fields should not permit NULL values.

Examples:

- Song title
- Artist name
- File hash
- Root path
- Recommendation type

---

## 32.7 Cascade Rules

Preferred deletion behavior:

| Relationship | Action |
|--------------|--------|
| Artist → Album | RESTRICT |
| Album → Song | RESTRICT |
| Song → SongFile | CASCADE |
| Playlist → PlaylistItem | CASCADE |
| Song → History | CASCADE |
| Song → Recommendation | CASCADE |
| Song → Statistics | CASCADE (when entity-specific) |

Automatic deletion of physical music files is never performed.

---

# Chapter 33 — Alembic Migration Strategy

## 33.1 Purpose

Database schema changes shall be managed using Alembic migrations.

Manual modification of production databases is prohibited.

---

## 33.2 Migration Principles

Each migration should:

- Perform one logical change.
- Be reversible where practical.
- Be documented.
- Be version controlled.

---

## 33.3 Migration Workflow

```
Modify SQLAlchemy Models

↓

Generate Migration

↓

Review Migration

↓

Execute Migration

↓

Run Tests

↓

Commit
```

---

## 33.4 Migration Naming

Recommended format:

```
YYYYMMDD_HHMM_description
```

Examples:

```
20260713_0930_create_artists

20260715_1845_add_statistics
```

---

## 33.5 Backward Compatibility

Whenever practical:

- Preserve user data.
- Avoid destructive migrations.
- Provide data migration scripts.
- Support rollback.

---

# Chapter 34 — Backup & Recovery

## 34.1 Purpose

The Harmony AI database stores valuable user information that should be protected against accidental loss.

---

## 34.2 Backup Types

Supported backup strategies include:

- Manual backup
- Scheduled backup
- Pre-migration backup
- Export backup

---

## 34.3 Backup Contents

Backups should include:

- SQLite database
- Configuration
- User settings
- Playlists
- AI data
- Statistics

Music files remain outside the database.

---

## 34.4 Recovery

Recovery procedure:

```
Restore Backup

↓

Validate Database

↓

Verify Integrity

↓

Resume Operation
```

---

## 34.5 Integrity Verification

Recovery should verify:

- Table structure
- Foreign keys
- Row counts
- Indexes
- Checksums (where available)

---

# Chapter 35 — Entity Relationship Diagram (ERD)

## 35.1 Conceptual ER Diagram

```
                    Artists
                       │
          ┌────────────┴────────────┐
          │                         │
          ▼                         ▼
       Albums                    Songs
          │                         │
          │                         ▼
          │                    SongFiles
          │                         │
          │                         │
          ▼                         ▼
      Artwork                 LibraryLocations
          │
          ▼
        Lyrics

Songs
 │
 ├──────────────► Genres
 │
 ├──────────────► History
 │
 ├──────────────► Ratings
 │
 ├──────────────► Favorites
 │
 ├──────────────► PlaylistItems
 │                     │
 │                     ▼
 │                 Playlists
 │
 ├──────────────► Statistics
 │
 ├──────────────► Recommendations
 │
 ├──────────────► Similarity
 │
 └──────────────► Embeddings (Future)

Songs
 │
 ▼
SongTags
 │
 ▼
Tags
```

---

## 35.2 Layer Overview

```
Configuration

↓

Library

↓

Metadata

↓

User Data

↓

AI Data
```

Each layer depends only on lower architectural layers through approved interfaces.

---

# Chapter 36 — Database Summary

The Harmony AI database provides a normalized, scalable, and maintainable foundation for the entire application.

The schema supports:

- Large music libraries
- Multiple library locations
- Rich metadata
- Artwork management
- Lyrics
- Flexible tagging
- User playlists
- Listening history
- Ratings
- Favorites
- AI recommendations
- Semantic search preparation
- Future cloud synchronization

The schema is intentionally designed for long-term evolution while preserving data integrity and application performance.

---

# Database Approval

## Status

Current Status:

Draft

This document shall become **Approved** after review by the Project Owner.

---

## Approval Record

| Role | Name | Status |
|------|------|--------|
| Project Owner | Project Owner | Pending |
| Chief Architect | Chief Architect | Approved |
| Database Architect | Database Architect | Approved |

---

## Revision History

| Version | Date | Description | Author |
|----------|------|-------------|--------|
|1.0.0|2026-07-13|Initial Draft|Database Architect|

---

# End of Document

**DB-001 — Initial Database Schema**

Version 1.0.0

End of File
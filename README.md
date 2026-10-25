# Referee Training Platform

A video-based learning platform for football referees. Instructors and administrators publish match clips, organize them into a structured library, tag them with the referee involved and the type of decision, and share them with selected users or groups, optionally with an expiry date.

It works like a private, YouTube-style site: a player, descriptions for every case, comments, playlists and search. Access is invitation-only and role-based.

> Internal project name: `rel`. Built as a heavily customized fork of the PlayTube PHP video CMS (see [Credits and license](#credits-and-license)).

## Features

**Structured content library**
- Four-level hierarchy: **Library → Channel → Topic → Video**
- Topics can share a name across different channels without clashing
- Each library has its own background and slider images; libraries and sliders can be re-ordered by the admin
- A clip can be published into several topics in one upload

**Referee and decision tagging**
- Referee directory with first and last name, country, role (Referee, Assistant Referee, VAR Referee, VAR Assistant Referee) and a positive/negative status flag
- Decision types (Technical / Disciplinary) managed by the admin and attached to each clip at upload
- Referee-to-clip linking is partially implemented (see [Status and roadmap](#status-and-roadmap))

**Users, roles and access**
- Admin-created users with country, phone, photo, active/inactive status, equipment size and shoe size
- Roles: Referee, Assistant Referee, VAR Referee, Instructor, VAR Instructor, Technical Assessor, Physical Assessor, Guest, Staff, Admin, IT Support
- Per-user library access and user groups used for sharing
- Time-limited sharing of playlists and topics (access ends at a set date)
- Export of the users list to PDF and Excel

**Admin panel**
- Management pages for libraries, channels, topics, videos, users, groups, referees, decisions, sliders, email templates, languages, menus and general settings
- Admin menu entries can be added and toggled from the panel

**Inherited from PlayTube**
- Video upload with FFmpeg conversion, thumbnails, view analytics
- Comments, replies, likes, playlists, watch history, saved videos, search
- Notifications and real-time messaging (Node.js and Socket.IO)
- Three front-end themes (`default`, `vidplay`, `youplay`) and six languages (Arabic, English, French, German, Spanish, Dutch)
- Mobile API under `app_api/`

## Content hierarchy

```
Library
└── Channel
    └── Topic
        └── Video  (tagged with referee + decision type)
```

## Tech stack

| Layer | Technology |
|---|---|
| Backend | PHP 7.1+ / 8, MySQL (mysqli) |
| Real-time | Node.js, Express, Socket.IO |
| Media | FFmpeg |
| Exports | Dompdf (PDF), PhpSpreadsheet (Excel) |
| Frontend | Server-rendered PHP templates, jQuery, Bootstrap |

## Project structure

```
admin-panel/   Admin dashboard pages
ajax/          AJAX endpoints (ap.php holds most admin actions)
app_api/       Mobile / desktop API
assets/        Core includes (init, helpers, table names), language files
sources/       Page controllers (watch, upload-video, timeline, ...)
themes/        Front-end themes and video players
nodejs/        Real-time messaging server
Docs/          Phase specifications and UI mock-ups
```

## Installation

This repository does not include a database dump, and the installer inherited from PlayTube asks for a valid PlayTube purchase code. To run it you need:

1. A web server with PHP and MySQL, and FFmpeg available on the server
2. A PlayTube base installation or database schema, plus the custom tables used by this project (`libraries`, `channel`, `topic`, `user_library`, `user_group`, `shared_playlist`, `refereeing`, `video_referee`, `decisions`, `decisions_information`, `slider`)
3. Database credentials set in `config.php` and `nodejs/config.json`
4. For real-time messaging: `cd nodejs && npm install && node server.js`

## Status and roadmap

Implemented: libraries, channels and topics, user and role management, groups, time-limited sharing, referee directory, decision tagging, sliders, admin exports.

Partially implemented: linking a clip to a referee. The upload form collects the referee, and the admin referee page lists linked clips, but the insert into `video_referee` is overwritten before it runs in `ajax/ffmpeg-submit.php`, so new uploads are not linked yet.

Specified in `Docs/` but not present in the code: the match analysis module (competitions, matches, appointments, team lists, activity logs). Other items from the specification, such as frame-by-frame stepping, a slow-motion control, a PDF overlay on the player and OneDrive storage, are not implemented in this codebase.

## Credits and license

Built on **PlayTube** by DoughouzForest (Deen Doughouz), a commercial script sold on CodeCanyon. PlayTube is not open source, and its license does not allow redistributing its source. Check the license terms and any client agreement before making this repository public.

## Author

Mahmoud Almalah, backend developer (PHP / Laravel / Node.js), Cairo, Egypt.

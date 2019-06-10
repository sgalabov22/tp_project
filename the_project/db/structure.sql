CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "admin" boolean, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE IF NOT EXISTS "songs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "performer_id" integer, "album_id" integer);
CREATE TABLE IF NOT EXISTS "playlists" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "name" varchar);
CREATE TABLE IF NOT EXISTS "subscriptions" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "song_id" integer, "playlist_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "performers" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE IF NOT EXISTS "albums" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "performer_id" integer);
CREATE VIEW searches AS
        SELECT
          s.title AS reverse_index,
          s.id AS searchable_id, 'Song' AS searchable_type,
          s.title AS label,
          s.updated_at AS updated_at
        FROM songs s

        UNION ALL

        SELECT
          a.title AS reverse_index,
          a.id AS searchable_id, 'Album' AS searchable_type,
          a.title AS label,
          a.updated_at AS updated_at
        FROM albums a
/* searches(reverse_index,searchable_id,searchable_type,label,updated_at) */;
INSERT INTO "schema_migrations" (version) VALUES
('20190325202444'),
('20190325205550'),
('20190327113651'),
('20190327121411'),
('20190331130046'),
('20190402092301'),
('20190402145508'),
('20190402190842'),
('20190403112324'),
('20190403115538'),
('20190409144326');



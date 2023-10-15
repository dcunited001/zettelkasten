CREATE TABLE moz_origins(
  id INTEGER PRIMARY KEY,
  prefix TEXT NOT NULL,
  host TEXT NOT NULL,
  frecency INTEGER NOT NULL,
  recalc_frecency INTEGER NOT NULL DEFAULT 0,
  alt_frecency INTEGER,
  recalc_alt_frecency INTEGER NOT NULL DEFAULT 0,
  UNIQUE(prefix, host)
);
CREATE TABLE moz_places(
  id INTEGER PRIMARY KEY,
  url LONGVARCHAR,
  title LONGVARCHAR,
  rev_host LONGVARCHAR,
  visit_count INTEGER DEFAULT 0,
  hidden INTEGER DEFAULT 0 NOT NULL,
  typed INTEGER DEFAULT 0 NOT NULL,
  frecency INTEGER DEFAULT -1 NOT NULL,
  last_visit_date INTEGER ,
  guid TEXT,
  foreign_count INTEGER DEFAULT 0 NOT NULL,
  url_hash INTEGER DEFAULT 0 NOT NULL ,
  description TEXT,
  preview_image_url TEXT,
  site_name TEXT,
  origin_id INTEGER REFERENCES moz_origins(id),
  recalc_frecency INTEGER NOT NULL DEFAULT 0,
  alt_frecency INTEGER,
  recalc_alt_frecency INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE moz_historyvisits(
  id INTEGER PRIMARY KEY,
  from_visit INTEGER,
  place_id INTEGER,
  visit_date INTEGER,
  visit_type INTEGER,
  session INTEGER,
  source INTEGER DEFAULT 0 NOT NULL,
  triggeringPlaceId INTEGER
);
CREATE TABLE moz_inputhistory(
  place_id INTEGER NOT NULL,
  input LONGVARCHAR NOT NULL,
  use_count INTEGER,
  PRIMARY KEY(place_id, input)
);
CREATE TABLE moz_bookmarks(
  id INTEGER PRIMARY KEY,
  type INTEGER,
  fk INTEGER DEFAULT NULL,
  parent INTEGER,
  position INTEGER,
  title LONGVARCHAR,
  keyword_id INTEGER,
  folder_type TEXT,
  dateAdded INTEGER,
  lastModified INTEGER,
  guid TEXT,
  syncStatus INTEGER NOT NULL DEFAULT 0,
  syncChangeCounter INTEGER NOT NULL DEFAULT 1
);
CREATE TABLE moz_bookmarks_deleted(
  guid TEXT PRIMARY KEY,
  dateRemoved INTEGER NOT NULL DEFAULT 0
);
CREATE TABLE moz_keywords(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  keyword TEXT UNIQUE,
  place_id INTEGER,
  post_data TEXT
);
CREATE TABLE moz_anno_attributes(
  id INTEGER PRIMARY KEY,
  name VARCHAR(32) UNIQUE NOT NULL
);
CREATE TABLE moz_annos(
  id INTEGER PRIMARY KEY,
  place_id INTEGER NOT NULL,
  anno_attribute_id INTEGER,
  content LONGVARCHAR,
  flags INTEGER DEFAULT 0,
  expiration INTEGER DEFAULT 0,
  type INTEGER DEFAULT 0,
  dateAdded INTEGER DEFAULT 0,
  lastModified INTEGER DEFAULT 0
);
CREATE TABLE moz_items_annos(
  id INTEGER PRIMARY KEY,
  item_id INTEGER NOT NULL,
  anno_attribute_id INTEGER,
  content LONGVARCHAR,
  flags INTEGER DEFAULT 0,
  expiration INTEGER DEFAULT 0,
  type INTEGER DEFAULT 0,
  dateAdded INTEGER DEFAULT 0,
  lastModified INTEGER DEFAULT 0
);
CREATE TABLE moz_meta(key TEXT PRIMARY KEY, value NOT NULL) WITHOUT ROWID;
CREATE TABLE moz_places_metadata(
  id INTEGER PRIMARY KEY,
  place_id INTEGER NOT NULL,
  referrer_place_id INTEGER,
  created_at INTEGER NOT NULL DEFAULT 0,
  updated_at INTEGER NOT NULL DEFAULT 0,
  total_view_time INTEGER NOT NULL DEFAULT 0,
  typing_time INTEGER NOT NULL DEFAULT 0,
  key_presses INTEGER NOT NULL DEFAULT 0,
  scrolling_time INTEGER NOT NULL DEFAULT 0,
  scrolling_distance INTEGER NOT NULL DEFAULT 0,
  document_type INTEGER NOT NULL DEFAULT 0,
  search_query_id INTEGER,
  FOREIGN KEY(place_id) REFERENCES moz_places(id) ON DELETE CASCADE,
  FOREIGN KEY(referrer_place_id) REFERENCES moz_places(id) ON DELETE CASCADE,
  FOREIGN KEY(search_query_id) REFERENCES moz_places_metadata_search_queries(id) ON DELETE CASCADE CHECK(place_id != referrer_place_id)
);
CREATE TABLE moz_places_metadata_search_queries(
  id INTEGER PRIMARY KEY,
  terms TEXT NOT NULL UNIQUE
);
CREATE TABLE moz_previews_tombstones(hash TEXT PRIMARY KEY) WITHOUT ROWID;
CREATE INDEX moz_places_url_hashindex ON moz_places(url_hash);
CREATE INDEX moz_places_hostindex ON moz_places(rev_host);
CREATE INDEX moz_places_visitcount ON moz_places(visit_count);
CREATE INDEX moz_places_frecencyindex ON moz_places(frecency);
CREATE INDEX moz_places_lastvisitdateindex ON moz_places(last_visit_date);
CREATE UNIQUE INDEX moz_places_guid_uniqueindex ON moz_places(guid);
CREATE INDEX moz_places_originidindex ON moz_places(origin_id);
CREATE INDEX moz_historyvisits_placedateindex ON moz_historyvisits(
  place_id,
  visit_date
);
CREATE INDEX moz_historyvisits_fromindex ON moz_historyvisits(from_visit);
CREATE INDEX moz_historyvisits_dateindex ON moz_historyvisits(visit_date);
CREATE INDEX moz_bookmarks_itemindex ON moz_bookmarks(fk, type);
CREATE INDEX moz_bookmarks_parentindex ON moz_bookmarks(parent, position);
CREATE INDEX moz_bookmarks_itemlastmodifiedindex ON moz_bookmarks(
  fk,
  lastModified
);
CREATE INDEX moz_bookmarks_dateaddedindex ON moz_bookmarks(dateAdded);
CREATE UNIQUE INDEX moz_bookmarks_guid_uniqueindex ON moz_bookmarks(guid);
CREATE UNIQUE INDEX moz_keywords_placepostdata_uniqueindex ON moz_keywords(
  place_id,
  post_data
);
CREATE UNIQUE INDEX moz_annos_placeattributeindex ON moz_annos(
  place_id,
  anno_attribute_id
);
CREATE UNIQUE INDEX moz_items_annos_itemattributeindex ON moz_items_annos(
  item_id,
  anno_attribute_id
);
CREATE UNIQUE INDEX moz_places_metadata_placecreated_uniqueindex ON moz_places_metadata(
  place_id,
  created_at
);
CREATE INDEX moz_places_metadata_referrerindex ON moz_places_metadata(
  referrer_place_id
);
CREATE INDEX moz_places_altfrecencyindex ON moz_places(alt_frecency);
CREATE TABLE moz_places_extra(
  place_id INTEGER PRIMARY KEY NOT NULL,
  sync_json TEXT,
  FOREIGN KEY(place_id) REFERENCES moz_places(id) ON DELETE CASCADE
);
CREATE TABLE moz_historyvisits_extra(
  visit_id INTEGER PRIMARY KEY NOT NULL,
  sync_json TEXT,
  FOREIGN KEY(visit_id) REFERENCES moz_historyvisits(id) ON DELETE CASCADE
);
ANALYZE sqlite_schema;
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_guid_uniqueindex','23 1');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_dateaddedindex','23 2');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_itemlastmodifiedindex','23 2 2');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_parentindex','23 4 1');
INSERT INTO sqlite_stat1 VALUES('moz_bookmarks','moz_bookmarks_itemindex','23 2 2');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_altfrecencyindex','21 21');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_originidindex','21 2');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_guid_uniqueindex','21 1');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_lastvisitdateindex','21 2');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_frecencyindex','21 3');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_visitcount','21 6');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_hostindex','21 2');
INSERT INTO sqlite_stat1 VALUES('moz_places','moz_places_url_hashindex','21 1');
INSERT INTO sqlite_stat1 VALUES('moz_historyvisits','moz_historyvisits_dateindex','48 1');
INSERT INTO sqlite_stat1 VALUES('moz_historyvisits','moz_historyvisits_fromindex','48 4');
INSERT INTO sqlite_stat1 VALUES('moz_historyvisits','moz_historyvisits_placedateindex','48 3 1');
ANALYZE sqlite_schema;

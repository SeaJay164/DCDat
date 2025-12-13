DROP DATABASE dc_dat; CREATE DATABASE dc_dat TEMPLATE template0;

CREATE TABLE publishers (
    pub_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publisher TEXT
);

CREATE TABLE imprints (
    imprint_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    imprint_name TEXT
);

CREATE TABLE groups_t (
    group_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    group_name TEXT
);

CREATE FUNCTION article_sort (unsorted TEXT)
    RETURNS TEXT
    LANGUAGE plpgsql
AS $$
DECLARE
    sorted TEXT;
BEGIN
    IF LEFT(unsorted, 4) = 'The ' THEN
        sorted := RIGHT(unsorted, LENGTH(unsorted) - 4) || ', The';
    ELSIF LEFT(unsorted, 4) = 'the ' THEN
        sorted := RIGHT(unsorted, LENGTH(unsorted) - 4) || ', the';
    ELSIF LEFT(unsorted, 3) = 'An ' THEN
        sorted := RIGHT(unsorted, LENGTH(unsorted) - 3) || ', An';
    ELSIF LEFT(unsorted, 3) = 'an ' THEN
        sorted := RIGHT(unsorted, LENGTH(unsorted) - 3) || ', an';
    ELSIF LEFT(unsorted, 2) = 'A ' THEN
        sorted := RIGHT(unsorted, LENGTH(unsorted) - 2) || ', A';
    ELSIF LEFT(unsorted, 2) = 'a ' THEN
        sorted := RIGHT(unsorted, LENGTH(unsorted) - 2) || ', a';
    ELSE
        sorted := unsorted;
    END IF;
    RETURN sorted;
END;
$$;

CREATE TABLE series (
    series_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    series_title TEXT,
    --series_title_sort TEXT GENERATED ALWAYS AS article_sort(series_title) STORED,
    group_id INTEGER REFERENCES groups_t (group_id),
    imprint_id INTEGER REFERENCES imprints (imprint_id)
);

CREATE TABLE volumes (
    volume_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    series_id INTEGER REFERENCES series (series_id),
    volume_num REAL,
    volume_name TEXT,
    year_start INTEGER,
    year_end INTEGER,
    fan_vol INTEGER,
    num_from INTEGER REFERENCES volumes (volume_id),
    vol_url TEXT
);

CREATE TABLE date_sources (
    date_source_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    d_source_name TEXT
);

CREATE TABLE issues (
    issue_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    volume_id INTEGER REFERENCES volumes (volume_id),
    issue_num REAL,
    issue_type TEXT,
    issue_title TEXT,
    cover_month INTEGER,
    cover_year INTEGER,
    release_date DATE,
    date_source_id INTEGER REFERENCES date_sources (date_source_id),
    notes TEXT,
    pub_id INTEGER REFERENCES publishers (pub_id),
    iss_url TEXT,
    legacy_vol_id INTEGER REFERENCES volumes (volume_id),
    iss_num_sub_num_title TEXT,
    tie_in TEXT,
    date_read DATE
);

CREATE TABLE stories (
    story_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    story_num INTEGER,
    story_title TEXT,
    issue_id INTEGER REFERENCES issues (issue_id),
    reprint_of INTEGER REFERENCES stories (story_id),
    read_date DATE
);

CREATE TABLE iss_stor (
    iss_stor_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    issue_id INTEGER REFERENCES issues (issue_id),
    story_id INTEGER REFERENCES stories (story_id)
);

CREATE TABLE arcs (
    arc_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    arc TEXT,
    arc_event BOOLEAN,
    issues TEXT
);

CREATE TABLE tie_ins (
    tie_in_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    arc TEXT,
    order_num INTEGER,
    story_id INTEGER REFERENCES stories (story_id),
    issue_id INTEGER REFERENCES issues (issue_id),
    arc_id INTEGER REFERENCES arcs (arc_id)
);

CREATE TABLE eras (
    era_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    era TEXT
);

CREATE TABLE earths (
    earth_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    earth TEXT,
    descr TEXT,
    era_id INTEGER REFERENCES eras (era_id)
);

CREATE TABLE characters_primary (
    character_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    char_name TEXT,
    group_id INTEGER REFERENCES groups_t (group_id),
    group_name TEXT,
    earthOrigin INTEGER,
    earth_id INTEGER REFERENCES earths (earth_id)
);

CREATE TABLE character_versions (
    character_version_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    character_id INTEGER REFERENCES characters_primary (character_id),
    char_name TEXT,
    group_id INTEGER REFERENCES groups_t (group_id),
    group_name TEXT,
    earthOrigin INTEGER,
    earth_id INTEGER REFERENCES earths (earth_id)
);

CREATE TABLE character_aliases (
    char_alias_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    character_id INTEGER REFERENCES characters_primary (character_id),
    character_version_id INTEGER REFERENCES character_versions (character_version_id),
    char_alt_name TEXT
);

CREATE TABLE character_story (
    char_stor_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    character_id INTEGER REFERENCES characters_primary (character_id),
    story_id INTEGER REFERENCES stories (story_id)
);

CREATE TABLE code_pull_num (
    cpn_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    code_time_hour INTEGER,
    code_time_min INTEGER,
    code_time_sec REAL,
    code_time_sec_full REAL
);

CREATE TABLE collected (
    collected_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    coll_title TEXT,
    coll_type TEXT,
    read_date DATE
);

CREATE TABLE collections (
    collections_id  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    collected_id INTEGER REFERENCES collected (collected_id),
    issue_id INTEGER REFERENCES issues (issue_id)
);

CREATE TABLE creators (
    creator_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE creator_roles (
    role_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role_title TEXT
);

CREATE TABLE story_creators (
    stor_crea_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    story_id INTEGER REFERENCES stories (story_id),
    creator_id INTEGER REFERENCES creators (creator_id),
    role_id INTEGER REFERENCES creator_roles (role_id)
);

CREATE TABLE bg_order (
    bg_order_id  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book TEXT,
    date1 DATE,
    story TEXT,
    date_note TEXT
);

CREATE TABLE flashpoint (
    fp_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fp_num REAL,
    book TEXT
);

CREATE TABLE fourth_world (
    fw_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book TEXT,
    issue_num INTEGER
);

CREATE TABLE gl_order2 (
    glo_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    r_order INTEGER,
    age TEXT,
    book TEXT,
    annual_special TEXT,
    volume_num INTEGER,
    issue_num INTEGER
);

CREATE TABLE mawoc_dc (
    mawocdc_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    series TEXT,
    vol_num INTEGER,
    issue TEXT,
    iss_num TEXT,
    imprint TEXT,
    variant TEXT,
    note TEXT,
    printing TEXT,
    cover_month TEXT,
    cover_year TEXT,
    release_date DATE,
    owned INTEGER
);

CREATE TABLE mawoc_digital (
    mawocd_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    series TEXT,
    vol_num INTEGER,
    issue TEXT,
    iss_num TEXT,
    cover_month TEXT,
    cover_year TEXT,
    release_date DATE,
    owned INTEGER
);

CREATE TABLE mawoc_promo (
    mawocp_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    series TEXT,
    vol_num INTEGER,
    issue TEXT,
    iss_num TEXT,
    variant TEXT,
    note TEXT,
    cover_month TEXT,
    cover_year TEXT,
    release_date DATE,
    add_notes TEXT,
    owned INTEGER
);

CREATE TABLE notes (
    notes_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    note_short TEXT,
    note_long TEXT
);

CREATE TABLE sheet1 (
    issue_id INTEGER,
    iss_url TEXT
);

CREATE TABLE triangle (
    triangle_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tri_year INTEGER,
    tri_num INTEGER,
    issue_id INTEGER REFERENCES issues (issue_id),
    series TEXT,
    issue_num TEXT
);

CREATE TABLE volume_types (
    volume_type_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    volume_type TEXT
);

INSERT INTO publishers (publisher)
VALUES
    ('National'),
    ('All-American'),
    ('DC'),
    ('Centaur'),
    ('Fawcett'),
    ('Quality'),
    ('Fox'),
    ('Holyoke'),
    ('Charlton');

INSERT INTO groups_t (group_name)
VALUES
    ('Anthology'),
    ('Team'),
    ('Superman'),
    ('Batman'),
    ('Wonder Woman'),
    ('Flash'),
    ('Green Lantern'),
    ('Aquaman'),
    ('Green Arrow'),
    ('Blue Beetle'),
    ('Booster Gold'),
    ('Marvel'),
    ('Fourth World'),
    ('Omega Men'),
    ('Plastic Man'),
    ('WildStorm'),
    ('Young Justice'),
    ('Boy Commandos'),
    ('War'),
    ('Western'),
    ('Other'),
    ('Event'),
    ('Crisis');

INSERT INTO date_sources (d_source_name)
VALUES
    ('Cover'),
    ('DCDb'),
    ('DCUI'),
    ('MAWoC'),
    ('See Note'),
    ('Solicit');

INSERT INTO eras (era)
VALUES
    ('Pre-Crisis'),
    ('Hypertime'),
    ('Interregnum'),
    ('52'),
    ('New 52'),
    ('Rebirth'),
    ('Dark Multiverse'),
    ('All-In');

INSERT INTO code_pull_num (code_time_hour, code_time_min,code_time_sec,code_time_sec_full)
VALUES
    (0,0,16.146,16.146),
    (0,5,15.872,315.872),
    (0,5,51.862,351.862),
    (0,16,6.378,966.378),
    (0,22,36.268,1356.268),
    (0,57,3.926,3423.926),
    (2,13,42.424,8022.424),
    (3,27,3.502,12423.502);

INSERT INTO volume_types (volume_type)
VALUES
    ('Limited'),
    ('Ongoing');

INSERT INTO collected (coll_title,coll_type,read_date)
VALUES
    ('DC vs. Vampires Vol. 1','TPB','2025-06-24'),
    ('DC vs. Vampires Vol. 2','TPB','2025-06-25');

INSERT INTO collections (collected_id,issue_id)
VALUES
    (1,13575),
    (1,13576),
    (1,13577),
    (1,13578),
    (1,13579),
    (1,13580),
    (2,13581),
    (2,13582),
    (2,13583),
    (2,13584),
    (2,13585),
    (2,13586);

COPY series(series_title,group_id)
FROM 'D:\Downloads\series_insert.csv'
DELIMITER ','
CSV HEADER;

COPY volumes(series_id,volume_num,volume_name,year_start,year_end,fan_vol,num_from,vol_url)
FROM 'D:\Downloads\volumes_insert.csv'
DELIMITER ','
CSV HEADER;

COPY issues(volume_id,issue_num,issue_type,issue_title,cover_month,cover_year,release_date,date_source_id,notes,pub_id,iss_url,legacy_vol_id,iss_num_sub_num_title,tie_in,date_read)
FROM 'D:\Downloads\issues_insert.csv'
DELIMITER ','
CSV HEADER;

COPY mawoc_dc(series,vol_num,issue,iss_num,imprint,variant,note,printing,cover_month,cover_year,release_date,owned)
FROM 'D:\Downloads\MAWoCDC.csv'
DELIMITER ','
CSV HEADER;

COPY mawoc_digital(series,vol_num,issue,iss_num,cover_month,cover_year,release_date,owned)
FROM 'D:\Downloads\MAWoCDigital.csv'
DELIMITER ','
CSV HEADER;

COPY mawoc_promo(series,vol_num,issue,iss_num,variant,note,cover_month,cover_year,release_date,add_notes,owned)
FROM 'D:\Downloads\MAWoCPromo.csv'
DELIMITER ','
CSV HEADER;

COPY notes(note_short,note_long)
FROM 'D:\Downloads\series_insert.csv'
DELIMITER ','
CSV HEADER;

COPY arcs(arc,arc_event,issues)
FROM 'D:\Downloads\Arcs.csv'
DELIMITER ','
CSV HEADER;

COPY bg_order(book,date1,story,date_note)
FROM 'D:\Downloads\BGOrder.csv'
DELIMITER ','
CSV HEADER;

COPY earths(earth,descr,era_id)
FROM 'D:\Downloads\Earths.csv'
DELIMITER ','
CSV HEADER;

COPY triangle(tri_year,tri_num,issue_id,series,issue_num)
FROM 'D:\Downloads\Triangle.csv'
DELIMITER ','
CSV HEADER;

COPY flashpoint(fp_num,book)
FROM 'D:\Downloads\Flashpoint.csv'
DELIMITER ','
CSV HEADER;

COPY fourth_world(book,issue_num)
FROM 'D:\Downloads\FourthWorld.csv'
DELIMITER ','
CSV HEADER;

COPY gl_order2(r_order,age,book,annual_special,volume_num,issue_num)
FROM 'D:\Downloads\GLOrder2.csv'
DELIMITER ','
CSV HEADER;
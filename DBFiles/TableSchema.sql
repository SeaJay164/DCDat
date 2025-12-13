--This file is for the creation of tables related to this DC Database

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

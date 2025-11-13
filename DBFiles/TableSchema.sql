--This file is for the creation of tables related to this DC Database

CREATE TABLE publishers (
    pub_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    publisher TEXT
);

CREATE TABLE imprints (
    imprint_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    imprint_name TEXT
);

CREATE TABLE groups (
    group_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    group_name TEXT
);

CREATE FUNCTION article_sort (@unsorted TEXT)
    RETURNS TEXT AS
    BEGIN
        CASE
            WHEN LEFT(@unsorted ,4) = 'The ' THEN
                RETURN RIGHT(@unsorted,-4) || ", The"
            WHEN LEFT(@unsorted ,3) = 'An ' THEN
                RETURN RIGHT(@unsorted,-3) || ", An"
            WHEN LEFT(@unsorted ,2) = 'A ' THEN
                RETURN RIGHT(@unsorted,-2) || ", A"
            ELSE
                RETURN @unsorted
        END
    END;

CREATE TABLE series (
    series_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    series_title TEXT
    series_title_sort TEXT GENERATED ALWAYS AS article_sort(series_title) STORED
    FOREIGN KEY(group_id) REFERENCES groups (group_id)
    FOREIGN KEY(imprint_id) REFERENCES imprints (imprint_id)
);

CREATE TABLE volumes (
    volume_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(series_id) REFERENCES series (series_id)
    volume_num INTEGER
    volume_name TEXT
    year_start INTEGER
    year_end INTEGER
    fan_vol INTEGER
    num_from INTEGER REFERENCES volumes (volume_id)
    vol_url TEXT
);

CREATE TABLE date_sources (
    date_source_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    d_source_name TEXT
);

CREATE TABLE issues (
    issue_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(volume_id) REFERENCES volumes (volume_id)
    issue_num INTEGER
    issue_type TEXT
    issue_title TEXT
    cover_month INTEGER
    cover_year INTEGER
    release_date DATE
    FOREIGN KEY(date_source_id) REFERENCES date_sources (date_source_id)
    notes TEXT
    FOREIGN KEY(pub_id) REFERENCES publishers (pub_id)
    issURL TEXT
    FOREIGN KEY(legacy_vol_id) REFERENCES volumes (volume_id)
    iss_num_sub_num_title TEXT
    tie_in TEXT
    date_read DATE
);

CREATE TABLE stories (
    story_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    story_num INTEGER
    story_title TEXT
    FOREIGN KEY(issue_id) REFERENCES issues (issue_id)
    reprint_of REFERENCES stories (story_id)
    read_date DATE
);

CREATE TABLE iss_stor (
    iss_stor_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(issue_id) REFERENCES issues (issue_id)
    FOREIGN KEY(story_id) REFERENCES stories (story_id)
);

CREATE TABLE arcs (
    arc_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    arc TEXT
    arc_event BOOLEAN
    issues TEXT
);

CREATE TABLE tie_ins (
    tie_in_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    arc TEXT
    order_num INTEGER
    FOREIGN KEY(story_id) REFERENCES stories (story_id)
    FOREIGN KEY(issue_id) REFERENCES issues (issue_id)
    FOREIGN KEY(arc_id) REFERENCES arc (arc_id)
);

CREATE TABLE eras (
    era_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    era TEXT
);

CREATE TABLE earths (
    earth_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    earth TEXT
    descr TEXT
    FOREIGN KEY(era_id) REFERENCES eras (era_id)
);

CREATE TABLE characters (
    character_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    char_name TEXT
    char_name_alt_1 TEXT
    char_name_alt_2 TEXT
    FOREIGN KEY(group_id) REFERENCES groups (group_id)
    group TEXT
    earthOrigin INTEGER
    FOREIGN KEY(earth_id) REFERENCES earths (earth_id)
);

CREATE TABLE character_versions (
    character_version_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(character_id) REFERENCES characters (character_id)
    char_name TEXT
    char_name_alt_1 TEXT
    char_name_alt_2 TEXT
    FOREIGN KEY(group_id) REFERENCES groups (group_id)
    group TEXT
    earthOrigin INTEGER
    FOREIGN KEY(earth_id) REFERENCES earths (earth_id)
);

CREATE TABLE character_aliases (
    char_alias_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(character_version_id) REFERENCES character_versions (character_version_id)
);

CREATE TABLE character_story (
    char_stor_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(character_id) REFERENCES characters (character_id)
    FOREIGN KEY(story_id) REFERENCES stories (story_id)
);

CREATE TABLE code_pull_num (
    cpn_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    code_time_hour INTEGER
    code_time_min INTEGER
    code_time_sec REAL
    code_time_sec_full REAL
);

CREATE TABLE collected (
    collected_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    coll_title TEXT
    coll_type TEXT
    read_date DATE
);

CREATE TABLE collections (
    collections_id  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(collected_id) REFERENCES collected (collected_id)
    FOREIGN KEY(issue_id) REFERENCES issues (issue_id)
);

CREATE TABLE creators (
    creator_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    first_name TEXT
    last_name TEXT
);

CREATE TABLE creator_roles (
    role_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    role_title TEXT
);

CREATE TABLE story_creators (
    stor_crea_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(story_id) REFERENCES stories (story_id)
    FOREIGN KEY(creator_id) REFERENCES creators (creator_id)
    FOREIGN KEY(role_id) REFERENCES creator_roles (role_id)
);

CREATE TABLE bg_order (
    bg_order_id  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    book TEXT
    date1 DATE
    story TEXT
    date_note TEXT
);

CREATE TABLE flashpoint (
    fp_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    book TEXT
);

CREATE TABLE fourth_world (
    fw_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    book TEXT
    issue_num INTEGER
);

CREATE TABLE gl_order2 (
    glo_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    order INTEGER
    age TEXT
    book TEXT
    annual_special TEXT
    volume_num INTEGER
    issue_num INTEGER
);

CREATE TABLE mawoc_dc (
    mawocdc_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    series TEXT
    vol_num INTEGER
    issue TEXT
    iss_num TEXT
    imprint TEXT
    variant TEXT
    note TEXT
    printing TEXT
    cover_month TEXT
    cover_year TEXT
    release_date DATE
    owned INTEGER
);

CREATE TABLE mawoc_digital (
    mawocd_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    series TEXT
    vol_num INTEGER
    issue TEXT
    iss_num TEXT
    cover_month TEXT
    cover_year TEXT
    release_date DATE
    owned INTEGER
);

CREATE TABLE mawoc_promo (
    mawocp_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    series TEXT
    vol_num INTEGER
    issue TEXT
    iss_num TEXT
    variant TEXT
    note TEXT
    cover_month TEXT
    cover_year TEXT
    release_date DATE
    add_notes TEXT
    owned INTEGER
);

CREATE TABLE notes (
    notes_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    note_short TEXT
    note_long TEXT
);

CREATE TABLE sheet1 (
    issue_id INTEGER
    iss_url TEXT
);

CREATE TABLE triangle (
    triangle_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    tri_year INTEGER
    tri_num INTEGER
    FOREIGN KEY(issue_id) REFERENCES issues (issue_id)
    series TEXT
    issue_num TEXT
);

CREATE TABLE volume_types (
    volume_type_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    volume_type TEXT
);

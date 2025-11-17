--Adding typable data to tables

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

COPY series(series_title,group_id)
FROM 'D:\Downloads\public_series_export_2025-11-16_182835.csv'
DELIMITER ','
CSV HEADER;

COPY volumes(series_id,volume_num,volume_name,year_start,year_end,fan_vol,vol_url)
FROM 'D:\Downloads\public_volumes_export_2025-11-16_183014.csv'
DELIMITER ','
CSV HEADER;

COPY issues(volume_id,issue_num,issue_type,issue_title,cover_month,cover_year,release_date,date_source_id,notes,pub_id,iss_url,legacy_vol_id,iss_num_sub_num_title,tie_in,date_read)
FROM 'D:\Downloads\Issues.csv'
DELIMITER ','
CSV HEADER;

COPY mawoc_dc(series,vol_num,issue,issue_num,imprint,variant,note,printing,cover_month,cover_year,release_date,owned)
FROM 'D:\Downloads\MAWoCDC.csv'
DELIMITER ','
CSV HEADER;

COPY mawoc_digital(series,vol_num,issue,iss_num,cover_month,cover_year,release_date,owned)
FROM 'D:\Downloads\MAWoCDigital.csv'
DELIMITER ','
CSV HEADER;

COPY mawoc_promo(series,vol_num,issue,iss_num,variant,note,cover_month,cover_year,release_date,add_notes_owned)
FROM 'D:\Downloads\MAWoCPromo.csv'
DELIMITER ','
CSV HEADER;

COPY notes(note_short,note_long)
FROM 'D:\Downloads\series_insert.csv'
DELIMITER ','
CSV HEADER;

/*
CREATE TABLE test_tab (
    test_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    test_name TEXT
);

INSERT INTO test_tab (test_id,test_name)
OVERRIDING SYSTEM VALUE
    VALUES
        (1,'test1'),
        (2,'test2'),
        (3,'test3');
*/

/*
COPY ()
FROM ''
DELIMITER ','
CSV HEADER;

COPY ()
FROM ''
DELIMITER ','
CSV HEADER;

COPY ()
FROM ''
DELIMITER ','
CSV HEADER;

COPY ()
FROM ''
DELIMITER ','
CSV HEADER;

COPY ()
FROM ''
DELIMITER ','
CSV HEADER;

COPY ()
FROM ''
DELIMITER ','
CSV HEADER;
*/
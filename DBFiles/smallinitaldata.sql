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

COPY mawoc_dc(series,vol_num,issue,iss_num,imprint,variant,note,printing,cover_month,cover_year,release_date,owned)
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
/*
COPY ()
FROM 'D:\Downloads\.csv'
DELIMITER ','
CSV HEADER;

COPY ()
FROM 'D:\Downloads\.csv'
DELIMITER ','
CSV HEADER;
*/
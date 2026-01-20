UPDATE volumes
SET series_id = 352,
    volume_num = 2,
    volume_name = 'Batman: Curse of the White Knight'
WHERE volume_id = 427;
DELETE FROM series
WHERE series_id = 269;

UPDATE volumes
SET series_id = 352,
    volume_num = 4,
    volume_name = 'Batman: White Knight Presents Harley Quinn'
WHERE volume_id = 517;
DELETE FROM series
WHERE series_id = 353;

UPDATE volumes
SET series_id = 352,
    volume_num = 5,
    volume_name = 'Batman: Beyond the White Knight',
WHERE volume_id = 419;
DELETE FROM series
WHERE series_id = 262;

UPDATE volumes
SET series_id = 352,
    volume_num = 6,
    volume_name = 'Batman: White Knight Presents: Red Hood',
WHERE volume_id = 403;
DELETE FROM series
WHERE series_id = 246;

UPDATE volumes
SET series_id = 352,
    volume_num = 7,
    volume_name = 'Batman: White Knight Presents: Generation Joker',
WHERE volume_id = 518;
DELETE FROM series
WHERE series_id = 354;

INSERT INTO volumes (series_id, vol_num, volume_name, year_start, year_end, fan_vol, vol_url)
VALUES
    (352, 3, 'Batman: White Knight Presents Von Freeze', 2019, 2019, 1, 'https://dc.fandom.com/wiki/Batman:_White_Knight_Presents_Von_Freeze_Vol_1_1'); --white night VF

INSERT INTO issues (volume_id, issue_num, issue_type, issue_title, release_date, date_source_id, pub_id, date_read)
VALUES
    (516,1,'zStandard','2017-10-04',3,3,'2025-12-25'), --white night 1
    (516,2,'zStandard','2017-11-01',3,3,'2025-12-25'), --white night 2
    (516,3,'zStandard','2017-12-06',3,3,'2025-12-25'), --white night 3
    (516,4,'zStandard','2018-01-03',3,3,'2025-12-25'), --white night 4
    (516,5,'zStandard','2018-02-07',3,3,'2025-12-25'), --white night 5
    (516,6,'zStandard','2018-03-07',3,3,'2025-12-25'), --white night 6
    (516,7,'zStandard','2018-04-04',3,3,'2025-12-25'), --white night 7
    (516,8,'zStandard','2018-05-02',3,3,'2025-12-25'), --white night 8
    (427,1,'zStandard','2019-07-24',3,3,'2025-12-26'), --curse white night 1
    (427,2,'zStandard','2019-08-28',3,3,'2025-12-26'), --curse white night 2
    (427,3,'zStandard','2019-09-25',3,3,'2025-12-26'), --curse white night 3
    (427,4,'zStandard','2019-10-23',3,3,'2025-12-26'), --curse white night 4
    (,1,'zStandard','2019-11-20',3,3,'2025-12-27'), --white night VF 1
    (427,5,'zStandard','2019-12-11',3,3,'2025-12-27'), --curse white night 5
    (427,6,'zStandard','2020-01-22',3,3,'2025-12-29'), --curse white night 6
    (427,7,'zStandard','2020-02-26',3,3,'2025-12-29'), --curse white night 7
    (427,8,'zStandard','2020-03-25',3,3,'2025-12-29'), --curse white night 8
    (517,1,'zStandard','2020-10-20',3,3,'2025-12-29'), --white night HQ 1
    (517,2,'zStandard','2020-11-24',3,3,'2025-12-29'), --white night HQ 2
    (517,3,'zStandard','2020-12-22',3,3,'2025-12-29'), --white night HQ 3
    (517,4,'zStandard','2021-01-26',3,3,'2025-12-29'), --white night HQ 4
    (517,5,'zStandard','2021-02-23',3,3,'2025-12-29'), --white night HQ 5
    (517,6,'zStandard','2021-03-23',3,3,'2025-12-29'), --white night HQ 6
    (419,1,'zStandard','2022-03-29',3,3,'2026-01-03'), --beyond white night 1
    (419,2,'zStandard','2022-04-26',3,3,'2026-01-12'), --beyond white night 2
    (419,3,'zStandard','2022-05-24',3,3,'2026-01-12'), --beyond white night 3
    (419,4,'zStandard','2022-06-28',3,3,'2026-01-12'), --beyond white night 4
    (403,1,'zStandard','2022-07-26',3,3,'2026-01-12'), --white night RH 1
    (403,2,'zStandard','2022-08-23',3,3,'2026-01-12'), --white night RH 2
    (419,5,'zStandard','2022-09-27',3,3,'2026-01-13'), --beyond white night 5
    (419,6,'zStandard','2022-10-25',3,3,'2026-01-19'), --beyond white night 6
    (419,7,'zStandard','2022-12-27',3,3,'2026-01-19'), --beyond white night 7
    (419,8,'zStandard','2023-02-14',3,3,'2026-01-20'), --beyond white night 8
    (518,1,'zStandard','2023-05-09',3,3,''), --white night GJ 1
    (518,2,'zStandard','2023-06-20',3,3,''), --white night GJ 2
    (518,3,'zStandard','2023-07-18',3,3,''), --white night GJ 3
    (518,4,'zStandard','2023-08-15',3,3,''), --white night GJ 4
    (518,5,'zStandard','2023-09-19',3,3,''), --white night GJ 5
    (518,6,'zStandard','2023-10-17',3,3,''); --white night GJ 6

UPDATE issues
SET read_date = '2026-01-02'
WHERE issue_id = ; --absolute GL 9

UPDATE issues
SET read_date = '2026-01-12'
WHERE issue_id = ; --absolute batman 15

UPDATE issues
SET read_date = '2026-01-16'
WHERE issue_id = ; --absolute flash 10

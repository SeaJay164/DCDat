--This file is for the creation of queries related to this DC Database

/*
CREATE VIEW result AS 
  (SELECT first.*, 
          second.f1, 
          second.f2, 
          second.f3 
   FROM   first 
          INNER JOIN second 
                  ON first.id = second.id);
*/

/* copy from csv file
COPY sample_table_name (col1, col2, ...)
FROM 'C:\sampledb\sample_data.csv'
DELIMITER ','
CSV HEADER;
*/

CREATE VIEW series_view AS 
    (SELECT series.series_title, 
        groups.group, 
        COUNT(volumes.*), 
        MIN(volumes.year_start),
        MAX(volumes.year_end)
    FROM series
        JOIN groups
            ON series.group_id = groups.group_id
        JOIN volumes
            ON series.series_id = volumes.series_id
    GROUP BY series.series_title
    ORDER BY article_sort(series.series_title) ASC);

CREATE VIEW volumes_view1 AS 
    (SELECT series.series_title || ' Vol. ' || volumes.volume_num AS volume_title, 
        volumes.year_start,
        volumes.year_end, 
        volumes.volume_name, 
        volumes.fan_vol,
        CASE
            WHEN volumes.year_end IS NULL THEN
                'Current'
            ELSE
                ''
        END AS current
    FROM volumes
        JOIN series
            ON volumes.series_id = series.series_id
    GROUP BY volume_title
    ORDER BY article_sort(series.series_title) ASC
    ORDER BY volumes.volume_num ASC);

CREATE VIEW volumes_view2 AS 
    (SELECT series.series_title,
        volumes.volume_num, 
        volumes.year_start,
        volumes.year_end, 
        volumes.volume_name,
        COUNT(issues.*),
        MIN(issues.release_date),
        series.series_title || ' Vol. ' || volumes.volume_num AS volume_title,
        volumes.fan_vol,
        CASE
            WHEN volumes.year_end IS NULL THEN
                'Current'
            ELSE
                ''
        END AS current
    FROM volumes
        JOIN series
            ON volumes.series_id = series.series_id
        JOIN issues
            ON volumes.volume_id = issues.volume_id
    GROUP BY volume_title
    ORDER BY article_sort(series.series_title) ASC,
        volumes.volume_num ASC);

CREATE VIEW issues_view AS
    (SELECT series.series_title,
        volumes.volume_num,
        issues.issue_num,
        issues.issue_type,
        issues.issue_title,
        series.series_title || ' Vol.' || volumes.volume_num|| issues.issue_type || ' # ' || issues.issue_num AS issue_vol_title,
        issues.release_date,
        COUNT(stories.*),
        issues.cover_month,
        issues.cover_year,
        date_sources.d_source_name
        issues.date_read
    FROM issues
        JOIN volumes
            ON issues.volume_id = volumes.volume_id
        Join series
            ON volumes.series_id = series.series_id
        Join date_sources
            ON issues.date_source_id = date_sources.date_source_id
    GROUP BY issue_vol_title
    ORDER BY article_sort(series.series_title) ASC,
        volumes.volume_num ASC,
        issues.release_date ASC);

CREATE VIEW stories_view AS

;

CREATE VIEW qry_char_stor AS

;

CREATE VIEW stories_duplicates AS

;
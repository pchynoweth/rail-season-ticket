SELECT 
    d.ticket_code, d.ticket_description, d.fare AS "Weekly", IF(d.ticket_code LIKE "7D_", d.fare * 40, NULL) AS "Yealy", d.crs, d.description, dl.crs, dl.description
FROM
    (SELECT 
        tmp.*, ol.crs, ol.description
    FROM
        (SELECT
            tf.*, flo.origin_code, flo.destination_code, flo.start_date, flo.end_date
        FROM
            (SELECT 
                f.*, tt.tkt_type, tt.description AS ticket_description
            FROM
                fare f
            INNER JOIN ticket_type tt USING (ticket_code)
            WHERE
                tt.tkt_type = 'N') tf
        INNER JOIN flow flo USING (flow_id)
        WHERE flo.start_date < now() AND now() < flo.end_date) tmp
    INNER JOIN location ol ON ol.nlc = tmp.origin_code) d
        INNER JOIN
    location dl ON dl.nlc = d.destination_code INTO OUTFILE '/var/lib/mysql-files/season-tickets.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

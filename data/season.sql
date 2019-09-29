SELECT 
    d.*, d.fare * 40 AS "Yealy", dl.crs, dl.description
FROM
    (SELECT 
        tmp.*, ol.crs, ol.description
    FROM
        (SELECT 
        tf.*, flo.origin_code, flo.destination_code
    FROM
        (SELECT 
        f.*, tt.tkt_type, tt.description AS 'Ticket Desc'
    FROM
        fare f
    INNER JOIN ticket_type tt USING (ticket_code)
    WHERE
        tt.tkt_type = 'N') tf
    INNER JOIN flow flo USING (flow_id)) tmp
    INNER JOIN location ol ON ol.nlc = tmp.origin_code) d
        INNER JOIN
    location dl ON dl.nlc = d.destination_code INTO OUTFILE '/var/lib/mysql-files/season-tickets.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

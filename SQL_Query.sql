WITH 
AB as (SELECT
    CASE
        WHEN A.dimension_1 is not null THEN A.dimension_1
        ELSE B.dimension_1
    END as dimension_1,
    CASE
        WHEN A.dimension_2 is not null THEN A.dimension_2
        ELSE B.dimension_2
    END as dimension_2,
    COALESCE(measure_1, 0) as measure_1,
    COALESCE(measure_2, 0) as measure_2
    FROM A FULL JOIN B ON A.dimension_1=B.dimension_1 AND A.dimension_2=B.dimension_2),
DMAP as (SELECT DISTINCT MAP.* FROM MAP)

SELECT AB.dimension_1, DMAP.dimension_2, measure_1, measure_2 
FROM DMAP JOIN AB ON DMAP.dimension_1=AB.dimension_1
ORDER BY AB.dimension_1;
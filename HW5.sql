/*Q1:*/
SELECT school_nam
FROM public."PublicSchools"
WHERE ST_Equals(ST_AsText(geom),
'POINT(413797.2016872928 124604.24301644415)');
/*Q2:*/
SELECT school_nam
FROM public."PublicSchools"
WHERE ST_DWithin(ST_AsText(geom),
'POINT(413797.2016872928 124604.24301644415)', 1000);
/*Q3:*/
SELECT geodesc,geom FROM public."PGCensusTract"
WHERE ST_Contains(geom, ST_GeomFromText('POINT(417108 129547)',26985));
/*Q4:*/
SELECT fename
FROM public."PGRoads"
WHERE ST_DWithin(geom, ST_GeomFromText('POINT(406286 124178)',26985), 5000);
/*Q5:*/
SELECT fename AS roads_name,
fetype AS roads_type
FROM public."PGRoads"
WHERE ST_DWithin(geom,'010100002069690000F6C62A2F8FA0194140AABBB051F0FA40', 1000)
ORDER BY roads_name;
/*Q6:*/
SELECT p.geodesc AS tract_id, COUNT(c.id) AS cntschools, p.geom
FROM public."PGCensusTract" p
JOIN public."PublicSchools" c
ON ST_Contains(p.geom, c.geom)
GROUP BY p.id
ORDER BY cntschools DESC;
/*Q7:*/
SELECT fename AS street, fetype AS type, school_nam,category,city,census.geodesc,census.population FROM public."PGRoads" AS roads
JOIN public."PublicSchools" AS schools
ON ST_DWithin(roads.geom, schools.geom, 10)
INNER JOIN public."PGCensusTract" AS census
ON schools.geodesc = census.geodesc
WHERE length > 0.5

/*GEOG655, Haogang Ji, April 19th, 2022. */
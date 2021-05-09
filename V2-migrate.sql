INSERT INTO Location (RegName, AreaName, TerTypeName, TerName)
SELECT DISTINCT REGNAME, AREANAME, TerTypeName, TERNAME
FROM Odata;

INSERT INTO Location (RegName, AreaName, TerName)
SELECT DISTINCT EORegName, EOAreaName, EOTerName
FROM Odata
WHERE EORegName IS NOT NULL
EXCEPT SELECT RegName, AreaName, TerName FROM Location;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT EONAME, REGNAME, EOAreaName, EOTerName
FROM Odata
WHERE EONAME IS NOT NULL ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT EONAME, REGNAME, EOAreaName, EOTerName
FROM Odata
WHERE UkrPTName IS NOT NULL AND UkrPTName NOT IN (SELECT EOName FROM EO) ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (histPTName) histPTName, histPTRegName, histPTAreaName, histPTTerName
FROM Odata
WHERE histPTName IS NOT NULL AND histPTName NOT IN (SELECT EOName FROM EO) ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (mathPTName) mathPTName, mathPTRegName, mathPTAreaName, mathPTTerName
FROM Odata
WHERE mathPTName IS NOT NULL AND mathPTName NOT IN (SELECT EOName FROM EO) ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (physPTName) physPTName, physPTRegName, physPTAreaName, physPTTerName
FROM Odata
WHERE physPTName IS NOT NULL AND physPTName NOT IN (SELECT EOName FROM EO) ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (chemPTName) chemPTName, chemPTRegName, chemPTAreaName, chemPTTerName
FROM Odata
WHERE chemPTName IS NOT NULL AND chemPTName NOT IN (SELECT EOName FROM EO)ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (bioPTName) bioPTName, bioPTRegName, bioPTAreaName, bioPTTerName
FROM Odata
WHERE bioPTName IS NOT NULL AND bioPTName NOT IN (SELECT EOName FROM EO)ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (geoPTName) geoPTName, geoPTRegName, geoPTAreaName, geoPTTerName
FROM Odata
WHERE geoPTName IS NOT NULL AND geoPTName NOT IN (SELECT EOName FROM EO) ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (engPTName) engPTName, engPTRegName, engPTAreaName, engPTTerName
FROM Odata
WHERE engPTName IS NOT NULL AND engPTName NOT IN (SELECT EOName FROM EO)ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (fraPTName) fraPTName, fraPTRegName, fraPTAreaName, fraPTTerName
FROM Odata
WHERE fraPTName IS NOT NULL AND fraPTName NOT IN (SELECT EOName FROM EO)ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (deuPTName) deuPTName, deuPTRegName, deuPTAreaName, deuPTTerName
FROM Odata
WHERE deuPTName IS NOT NULL AND deuPTName NOT IN (SELECT EOName FROM EO) ON CONFLICT DO NOTHING;

INSERT INTO EO(EOName, EORegName, EOAreaName, EOTerName)
SELECT DISTINCT on (spaPTName) spaPTName, spaPTRegName, spaPTAreaName, spaPTTerName
FROM Odata
WHERE spaPTName IS NOT NULL AND spaPTName NOT IN (SELECT EOName FROM EO)ON CONFLICT DO NOTHING;


INSERT INTO Person (OUTID, Birth, SexType, EOName, ClassProfileName, ClassLangName, location_id)
SELECT DISTINCT on (OUTID) OUTID, Birth, SEXTYPENAME, EONAME, ClassProfileNAME, ClassLangName, location_id
FROM Odata;


INSERT INTO Test (OUTID, SubjectName, TestYear, Status, Ball100, Ball12, Ball, AdaptScale, EOName)
SELECT DISTINCT OUTID, UkrTest, "YEAR", UkrTestStatus, UkrBall100, UkrBall12, UkrBall, UkrAdaptScale, UkrPTName
FROM Odata
WHERE UkrTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, histTest, "YEAR", HistLang, histTestStatus, histBall100, histBall12, histBall, histPTName
FROM Odata
WHERE histTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, mathTest, "YEAR", mathLang, mathTestStatus, mathBall100, mathBall12, mathBall, mathPTName
FROM Odata
WHERE mathTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, physTest, "YEAR", physLang, physTestStatus, physBall100, physBall12, physBall, physPTName
FROM Odata
WHERE physTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, chemTest, "YEAR", chemLang, chemTestStatus, chemBall100, chemBall12, chemBall, chemPTName
FROM Odata
WHERE chemTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, bioTest, "YEAR", bioLang, bioTestStatus, bioBall100, bioBall12, bioBall, bioPTName
FROM Odata
WHERE bioTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, geoTest, "YEAR", geoLang, geoTestStatus, geoBall100, geoBall12, geoBall, geoPTName
FROM Odata
WHERE geoTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, engTest, "YEAR", engLang, engTestStatus, engBall100, engBall12, engBall, engPTName
FROM Odata
WHERE engTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, fraTest, "YEAR", fraLang, fraTestStatus, fraBall100, fraBall12, fraBall, fraPTName
FROM Odata
WHERE fraTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, deuTest, "YEAR", deuLang, deuTestStatus, deuBall100, deuBall12, deuBall, deuPTName
FROM Odata
WHERE deuTest IS NOT NULL;

INSERT INTO Test (OUTID, SubjectName, TestYear, SubjectLang, Status, Ball100, Ball12, Ball, EOName)
SELECT DISTINCT OUTID, spaTest, "YEAR", spaLang, spaTestStatus, spaBall100, spaBall12, spaBall, spaPTName
FROM Odata
WHERE spaTest IS NOT NULL;

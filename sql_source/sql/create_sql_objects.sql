DROP TABLE features;

CREATE OR REPLACE TYPE feature_type AS OBJECT (
  feature_name      VARCHAR2(60),
  feature_type      VARCHAR2(12),
  feature_elevation NUMBER
);
/

CREATE TABLE features (
  feature_id        NUMBER,
  feature           feature_type,
  modification_date DATE
);


CREATE EXTENSION IF NOT EXISTS timescaledb;
CREATE EXTENSION IF NOT EXISTS postgis;
SELECT PostGIS_Full_Version();
CREATE TABLE IF NOT EXISTS airtemperature (
    the_geom geometry(Point,4326),
    wigos_id varchar(30),
    "time" timestamp without time zone NOT NULL,
    value real
);
CREATE INDEX IF NOT EXISTS airtemperature_gix ON airtemperature USING GIST (the_geom);
CREATE UNIQUE INDEX IF NOT EXISTS airtemperature_uqix ON lightning (wigos_id,"time");
SELECT create_hypertable('airtemperature', by_range('time'));
CREATE TABLE IF NOT EXISTS stations (
    the_geom geometry(Point,4326),
    wigos_id varchar (30) PRIMARY KEY,
    name varchar (60)
);
CREATE INDEX IF NOT EXISTS stations_gix ON stations USING GIST (the_geom);

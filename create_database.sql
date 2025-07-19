CREATE TABLE dim_date (
    date_id               SERIAL PRIMARY KEY,
    year                  INTEGER,
    month                 INTEGER,
    day_of_week           TEXT,
    is_christmas_period   BOOLEAN,
    is_easter_period      BOOLEAN
);

CREATE TABLE dim_time (
    time_id       SERIAL PRIMARY KEY,
    time_period   TEXT,
    time          TEXT
);

CREATE TABLE dim_location (
    location_id          SERIAL PRIMARY KEY,
    state                TEXT,
    sa4_name             TEXT,
    lga_name             TEXT,
    remoteness_area  TEXT
);

CREATE TABLE dim_road_type (
    road_type_id    SERIAL PRIMARY KEY,
    road_type       TEXT,
    speed_limit     INTEGER,
    speed_category  TEXT
);

CREATE TABLE dim_demographic (
    demographic_id   SERIAL PRIMARY KEY,
    gender           TEXT,
    age_group        TEXT,
    age              INTEGER,
    road_user        TEXT
);

CREATE TABLE dim_crash_details (
    crash_details_id              SERIAL PRIMARY KEY,
    crash_type                    TEXT,
    bus_involvement               BOOLEAN,
    heavy_rigid_truck_involvement BOOLEAN,
    articulated_truck_involvement BOOLEAN
);

CREATE TABLE dim_remoteness (
    remoteness_id        SERIAL PRIMARY KEY,
    remoteness_area      TEXT,
    population_2020      INTEGER,
    population_2021      INTEGER,
    population_2022      INTEGER,
    population_2023      INTEGER
);

CREATE TABLE dim_lga (
    lga_id           SERIAL PRIMARY KEY,
    lga_name         TEXT,
    dwelling_count   INTEGER,
    population_2020  INTEGER,
    population_2021  INTEGER,
    population_2022  INTEGER,
    population_2023  INTEGER,
    lga_code         TEXT
);

CREATE TABLE fact_crash_fatalities (
    fatality_id           INTEGER PRIMARY KEY,
    crash_id              INTEGER,
    number_of_fatalities  INTEGER,
    date_id               INTEGER REFERENCES dim_date(date_id),
    time_id               INTEGER REFERENCES dim_time(time_id),
    location_id           INTEGER REFERENCES dim_location(location_id),
    road_type_id          INTEGER REFERENCES dim_road_type(road_type_id),
    crash_details_id      INTEGER REFERENCES dim_crash_details(crash_details_id),
    demographic_id        INTEGER REFERENCES dim_demographic(demographic_id),
    remoteness_id         INTEGER REFERENCES dim_remoteness(remoteness_id),
    lga_id                INTEGER REFERENCES dim_lga(lga_id)
);


COPY dim_date(date_id, year, month, day_of_week, is_christmas_period, is_easter_period)
FROM '/private/tmp/csv_tables/dim_date.csv'
WITH (FORMAT csv, HEADER true);

COPY dim_time(time_id, time_period, time)
FROM '/private/tmp/csv_tables/dim_time.csv'
WITH (FORMAT csv, HEADER true);

COPY dim_location(location_id, state, sa4_name, lga_name, remoteness_area)
FROM '/private/tmp/csv_tables/dim_location.csv'
WITH (FORMAT csv, HEADER true);

COPY dim_road_type(road_type_id, road_type, speed_limit, speed_category)
FROM '/private/tmp/csv_tables/dim_road_type.csv'
WITH (FORMAT csv, HEADER true);

COPY dim_crash_details(crash_details_id, crash_type, bus_involvement,
                       heavy_rigid_truck_involvement, articulated_truck_involvement)
FROM '/private/tmp/csv_tables/dim_crash_details.csv'
WITH (FORMAT csv, HEADER true);

COPY dim_demographic(demographic_id, age_group, gender, age, road_user)
FROM '/private/tmp/csv_tables/dim_demographic.csv'
WITH (FORMAT csv, HEADER true);

COPY dim_remoteness(remoteness_id, remoteness_area, population_2020,
                    population_2021, population_2022, population_2023)
FROM '/private/tmp/csv_tables/dim_remoteness.csv'
WITH (FORMAT csv, HEADER true);

COPY dim_lga(lga_id, lga_name, dwelling_count, population_2020,
             population_2021, population_2022, population_2023, lga_code)
FROM '/private/tmp/csv_tables/dim_lga.csv'
WITH (FORMAT csv, HEADER true);

COPY fact_crash_fatalities(fatality_id, crash_id, number_of_fatalities,
                           date_id, time_id, location_id, road_type_id,
                           crash_details_id, demographic_id, remoteness_id, lga_id)
FROM '/private/tmp/csv_tables/fact_crash_fatalities.csv'
WITH (FORMAT csv, HEADER true);

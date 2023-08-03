-- This ensures that SQLite enforces FOREIGN KEY constraints
PRAGMA foreign_keys = 1;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS musicians;
DROP TABLE IF EXISTS bands;

CREATE TABLE bands (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100)
);

-- INSERT INTO band(id, name)
-- VALUES(1, "ACDC");

CREATE TABLE musicians (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100),
  band_id INTEGER,
 FOREIGN KEY (band_id) REFERENCES bands(id)
);

INSERT INTO musicians (first_name, last_name)
VALUES("led", "zep"),
      ("cam", "ron");

CREATE TABLE instruments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  type VARCHAR(100) NOT NULL
);
INSERT INTO instruments (type)
VALUES("guitar");
INSERT INTO instruments (type)
VALUES("base-guitar");

DROP TABLE IF EXISTS musicians_instruments;
CREATE TABLE musicians_instruments(
  instrument_id INTEGER,
  musician_id INTEGER,
  FOREIGN KEY (instrument_id) REFERENCES instruments(id)
  FOREIGN KEY (musician_id) REFERENCES musicians(id)


);


INSERT INTO musicians_instruments (musician_id, instrument_id)
VALUES(2, 2);

SELECT * FROM musicians_instruments;

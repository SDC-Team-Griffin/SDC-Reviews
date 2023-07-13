DROP TABLE IF EXISTS Reviews;

CREATE TABLE Reviews (
  id INTEGER NOT NULL DEFAULT NULL,
  product_id INTEGER NOT NULL DEFAULT NULL,
  Rating DECIMAL(3, 2) NOT NULL DEFAULT NULL,
  Date VARCHAR(26) NOT NULL DEFAULT 'NULL',
  Summary VARCHAR(500) NULL DEFAULT NULL,
  Body VARCHAR(1000) NOT NULL DEFAULT 'NULL',
  Recommend BOOLEAN NOT NULL DEFAULT NULL,
  Reported BOOLEAN NOT NULL DEFAULT NULL,
  Name VARCHAR(60) NOT NULL DEFAULT 'NULL',
  Email VARCHAR(60) NOT NULL DEFAULT 'NULL',
  Response VARCHAR(1000) NULL DEFAULT NULL,
  Helpfulness INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

COPY reviews_photos FROM '/Users/theresebataclan/Desktop/SDC-Data/reviews_photos.csv' DELIMITER ',' CSV HEADER;

DROP TABLE IF EXISTS Characteristics;

CREATE TABLE Characteristics (
  id INTEGER NOT NULL DEFAULT NULL,
  product_id INTEGER NOT NULL DEFAULT NULL,
  Name VARCHAR(36) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Characteristics_Values;

CREATE TABLE Characteristics_Values (
  id INTEGER NULL DEFAULT NULL,
  characteristic_id INTEGER NOT NULL DEFAULT NULL,
  review_id INTEGER NOT NULL DEFAULT NULL,
  Value DECIMAL(3, 2) NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Reviews_Photos;

CREATE TABLE Reviews_Photos (
  id INTEGER NULL DEFAULT NULL,
  review_id INTEGER NOT NULL DEFAULT NULL,
  url VARCHAR(200) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (id)
);

ALTER TABLE Characteristics Values ADD FOREIGN KEY (characteristic_id) REFERENCES Characteristics (id);
ALTER TABLE Characteristics Values ADD FOREIGN KEY (review_id) REFERENCES Reviews (id);
ALTER TABLE Reviews Photos ADD FOREIGN KEY (review_id) REFERENCES Reviews (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Reviews` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Characteristics Values` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Characteristics` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Reviews Photos` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Reviews` (`id`,`product_id`,`Rating`,`Date`,`Summary`,`Body`,`Recommend`,`Reported`,`Name`,`Email Address`,`Response`,`Helpfulness`) VALUES
-- ('','','','','','','','','','','','');
-- INSERT INTO `Characteristics Values` (`id`,`characteristic_id`,`review_id`,`Value`) VALUES
-- ('','','','');
-- INSERT INTO `Characteristics` (`id`,`product_id`,`Name`) VALUES
-- ('','','');
-- INSERT INTO `Reviews Photos` (`id`,`review_id`,`url`) VALUES
-- ('','','');
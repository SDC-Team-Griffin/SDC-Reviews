DROP TABLE IF EXISTS Reviews;

CREATE TABLE Reviews (
  id INTEGER NOT NULL DEFAULT NULL,
  product_id INTEGER NOT NULL DEFAULT NULL,
  Rating DECIMAL(3, 2) NOT NULL DEFAULT NULL,
  Date VARCHAR(26) NOT NULL DEFAULT NULL,
  Summary VARCHAR(500) NULL DEFAULT NULL,
  Body VARCHAR(1000) NOT NULL DEFAULT NULL,
  Recommend BOOLEAN NOT NULL DEFAULT NULL,
  Reported BOOLEAN NOT NULL DEFAULT NULL,
  Name VARCHAR(60) NOT NULL DEFAULT NULL,
  Email VARCHAR(60) NOT NULL DEFAULT NULL,
  Response VARCHAR(1000) NULL DEFAULT NULL,
  Helpfulness INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Characteristics;

CREATE TABLE Characteristics (
  id INTEGER NOT NULL DEFAULT NULL,
  product_id INTEGER NOT NULL DEFAULT NULL,
  Name VARCHAR(36) NOT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS Characteristic_Values;

CREATE TABLE Characteristic_Values (
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
  url VARCHAR(200) NOT NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE INDEX idx_product_id_date ON reviews (product_id, date DESC);
CREATE INDEX idx_product_id ON characteristics (product_id);
CREATE INDEX characteristic_id ON Characteristic_Values (characteristic_id);

CREATE INDEX idx_review_id ON Characteristic_Values (review_id);
CREATE INDEX idx_review_id_photos ON Reviews_Photos (review_id);
CREATE INDEX idx_product_id_helpful ON reviews (product_id, helpfulness DESC);
CREATE INDEX idx_product_id_recommend ON reviews (product_id, recommend);

ALTER TABLE Characteristic_Values ADD FOREIGN KEY (characteristic_id) REFERENCES Characteristics (id);
ALTER TABLE Characteristic_Values ADD FOREIGN KEY (review_id) REFERENCES Reviews (id);
ALTER TABLE Reviews_Photos ADD FOREIGN KEY (review_id) REFERENCES Reviews (id);
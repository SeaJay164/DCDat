--This file is for the creation of tables related to this DC Database

CREATE TABLE publishers (
  pubID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  publisher text
);

CREATE TABLE imprints (
  imprintID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  imprintName TEXT
);

CREATE TABLE groups (
  groupID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  groupName TEXT
);

CREATE TABLE series (
  seriesID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  seriesTitle TEXT
  --titleSort TEXT GENERATED ALWAYS AS (If(Left(seriesTitle,4)="The ",Right(seriesTitle,-4) || ", The",If(Left(seriesTitle,3)="An ",Right(seriesTitle,-3) || ", An",If(Left(seriesTitle,2)="A ",Right(seriesTitle,-2) || ", A",seriesTitle)))) VIRTUAL
  FOREIGN KEY(groupID) REFERENCES groups (groupID)
  FOREIGN KEY(imprintID) REFERENCES imprints (imprintID)
);

CREATE TABLE volumes (
  volumeID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  FOREIGN KEY(seriesID) REFERENCES series (seriesID)
  volumeNum INTEGER
  volumeName TEXT
  yearStart INTEGER
  yearEnd INTEGER
  fanVol INTEGER
  numFrom INTEGER REFERENCES volumes (volumeID)
  url TEXT
);

CREATE TABLE dateSource (
  dSourceID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  dSourceName text
);

CREATE TABLE issues (
  issueID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  FOREIGN KEY(volumeID) REFERENCES volumes (volumeID)
  issueNum integer
  issueType text
  issueTitle text
  coverMonth integer
  coverYear integer
  releaseDate date
  FOREIGN KEY(dateSource) REFERENCES dateSource (dSourceID)
  notes text
  FOREIGN KEY(pubID) REFERENCES publishers (pubID)
  url text
  FOREIGN KEY(legacyVolID) REFERENCES volumes (volumeID)
  issNumSubNumTitle
  tieIn text
  dateRead date
);

CREATE TABLE stories (
  storyID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  storyNum integer
  storyTitle text
  FOREIGN KEY(issueID) REFERENCES issues (issueID)
  reprintOf REFERENCES stories (storyID)
  readDate date
);

CREATE TABLE issStor (
  issStorID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  FOREIGN KEY(issueID) REFERENCES issues (issueID)
  FOREIGN KEY(storyID) REFERENCES stories (storyID)
);

CREATE TABLE arcs (
  arcID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  arc text
  event boolean
  issues text
);

CREATE TABLE tieIns (
  tieInID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
  arc text
  orderNum integer
  FOREIGN KEY(storyID) REFERENCES stories (storyID)
  FOREIGN KEY(issueID) REFERENCES issues (issueID)
  FOREIGN KEY(arcID) REFERENCES arc (arcID)
);

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
    volURL TEXT
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
    issURL text
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
    arcEvent boolean
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

CREATE TABLE eras (
    eraID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    era text
);

CREATE TABLE earths (
    earthID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    earth text
    descr text
    FOREIGN KEY(eraID) REFERENCES eras (eraID)
);

CREATE TABLE characters (
    characterID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    charName text
    FOREIGN KEY(groupID) REFERENCES groups (groupID)
    group text
    earthOrigin integer
    FOREIGN KEY(earthID) REFERENCES earths (earthID)
);

CREATE TABLE charStor (
    charStorID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(characterID) REFERENCES characters (characterID)
    FOREIGN KEY(storyID) REFERENCES stories (storyID)
);

CREATE TABLE codepullnum (
    cpnID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    codetimehour integer
    codetimemin integer
    codetimesec real
    codtimesecfull real
);

CREATE TABLE collected (
    collectedID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    collTitle text
    collType text
    readDate date
);

CREATE TABLE collections (
    collectionsID  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(collectedID) REFERENCES collected (collectedID)
    FOREIGN KEY(issueID) REFERENCES issues (issueID)
);

CREATE TABLE creators (
    creatorID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    firstName text
    lastName text
);

CREATE TABLE creaRoles (
    roleID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    roleTitle text
);

CREATE TABLE storCrea (
    storCreaID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    FOREIGN KEY(storyID) REFERENCES stories (storyID)
    FOREIGN KEY(creatorID) REFERENCES creators (creatorID)
    FOREIGN KEY(roleID) REFERENCES creaRoles (roleID)
);

CREATE TABLE bgOrder (
    bgOrderID  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    book TEXT
    date1 date
    story text
    dateNote text
);

CREATE TABLE flashpoint (
    fpID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    book text
);

CREATE TABLE fourthWorld (
    fwID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    book text
    issueNum integer
);

CREATE TABLE glOrder2 (
    gloID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    order integer
    age text
    book text
    annual/special text
    volumeNum integer
    issueNum integer
);

CREATE TABLE MAWoCDC (
    mawocdcID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    series text
    volNum integer
    issue text
    issNum text
    imprint text
    variant text
    note text
    printing text
    coverMonth text
    coverYear text
    releaseDate date
    owned integer
);

CREATE TABLE MAWoCDigital (
    mawocdID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    series text
    volNum integer
    issue text
    issNum text
    coverMonth text
    coverYear text
    releaseDate date
    owned integer
);

CREATE TABLE MAWoCPromo (
    mawocpID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    series text
    volNum integer
    issue text
    issNum text
    variant text
    note text
    coverMonth text
    coverYear text
    releaseDate date
    addNotes text
    owned integer
);

CREATE TABLE notes (
    notesID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    noteShort text
    noteLong text
);

CREATE TABLE sheet1 (
    issueID integer
    issURL text
);

CREATE TABLE triangle (
    triangleID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    triYear integer
    triNum integer
    FOREIGN KEY(issueID) REFERENCES issues (issueID)
    series text
    issueNum text
);

CREATE TABLE volType (
    volTypeID INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY
    volType text
);


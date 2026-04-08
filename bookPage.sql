CREATE TABLE authors (
    author_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    author_name TEXT
);

CREATE TABLE books (
    book_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book_title TEXT
);

CREATE TABLE edition_types (
    edition_type_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    edition_type TEXT
);

CREATE TABLE editions (
    edition_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book_id INTEGER REFERS TO books (book_id),
    edition_type_id INTEGER REFERS TO edition_types (edition_type_id),
    pub_date DATE,
    pages INTEGER,
    isbn_ten TEXT CHECK(LENGTH(isbn_ten) = 13),
    isbn_thirteen TEXT CHECK(LENGTH(isbn_thirteen) = 17),
    asin TEXT CHECK(LENGTH(asin) = 10)
);

CREATE TABLE book_authors (
    book_author_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book_id INTEGER REFERS TO books (book_id),
    author_id INTEGER REFERS TO authors (author_id)
);

CREATE TABLE ratings (
    rating_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book_id INTEGER REFERS TO books (book_id),
    rating INTEGER --out of 10
);

CREATE TABLE read_runs (
    read_run_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    book_id INTEGER REFERS TO books (book_id)
);

CREATE TABLE page_read (
    page_read_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    read_date DATE,
    read_run_id INTEGER REFERS TO read_runs (read_run_id),
    pages_read INTEGER
);

INSERT INTO authors (author_name)
VALUES
    ('Philip Pullman'),
    ('Suzanne Collins'),
    ('Joseph Fink'),
    ('Jeffrey Cranor'),
    ('Lloyd Alexander'),
    ('Cornelia Funke'),
    ('C.S. Lewis'),
    ('Sarah J. Maas'),
    ('Neil Gaiman'),
    ('Lev Grossman'),
    ('Douglas Adams'),
    ('Ernest Hemingway'),
    ('J.L. Carr'),
    ('Ellen Raskin'),
    ('Seanan McGuire'),
    ('Toshikazu Kawaguchi'),
    ('Agatha Christie'),
    ('Edgar Cantero'),
    ('Amal El-Mohtar'),
    ('Grady Hendrix'),
    ('T. Kingfisher'),
    ('Claire Keegan'),
    ('E.P. Clement'),
    ('Laura E. Mangi'),
    ('Caleb J. Pecue'),
    ('A. L. Davidson'),
    ('Jackson Robinson'),
    ('Tobin Elliot'),
    ('Lennox Rex'),
    ('Reece G. Donnell'),
    ('Mallory'),
    ('Danielle Robertson'),
    ('Emily Holman'),
    ('C. Mae Thomas'),
    ('Kaos Emslie'),
    ('Jason A. Jones'),
    ('Torrence Bryan'),
    ('Derek Heath'),
    ('Nadine Stewart'),
    ('Louie Sullivan'),
    ('Dr. Stuart Knott'),
    ('Jack Finn'),
    ('Billie Karras'),
    ('Julie Aaron'),
    ('Alex James Donne'),
    ('Sirius'),
    ('Todd Condit'),
    ('Loki DeWitt'),
    ('Jennifer Montgomery'),
    ('Nick Cutter'),
    ('Craig Davidson'),
    ('Dashiell Hammett'),
    ('Viet Thanh Nguyen'),
    ('Bram Stoker'),
    ('Shelby Van Pelt'),
    ('Emily Bronte'),
    ('Rick Riordan'),
    ('Andy Weir'),
    ('Terry Pratchett'),
    ('Pierce Brown');

INSERT INTO books (book_title)
VALUES
    ($$The Golden Compass$$),
    ($$The Ballad of Songbirds and Snakes$$),
    ($$The Faceless Old Woman Who Secretly Lives in Your Home$$),
    ($$The Castle of Llyr$$),
    ($$Taran Wanderer$$),
    ($$The High King$$),
    ($$Inkspell$$),
    ($$The Magician's Nephew$$),
    ($$The Lion, the Witch and the Wardrobe$$),
    ($$The Horse and His Boy$$),
    ($$Prince Caspian$$),
    ($$The Voyage of the Dawn Treader$$),
    ($$The Silver Chair$$),
    ($$The Last Battle$$),
    ($$A Court of Thorns and Roses$$),
    ($$Norse Mythology$$),
    ($$The Subtle Knife$$),
    ($$The Amber Spyglass$$),
    ($$The Magicians$$),
    ($$The Hitchhiker's Guide to the Galaxy$$),
    ($$The Restaurant at the End of the Universe$$),
    ($$Life, the Universe and Everything$$),
    ($$A Court of Mist and Fury$$),
    ($$The Old Man and the Sea$$),
    ($$A Month in the Country$$),
    ($$Out of the Silent Planet$$),
    ($$The Westing Game$$),
    ($$Every Heart a Doorway$$),
    ($$Before the Coffee Gets Cold$$),
    ($$Stardust$$),
    ($$The Mysterious Affar at Styles$$),
    ($$Meddling Kids$$),
    ($$This Is How You Lose the Time War$$),
    ($$The Final Girl Suppport Group$$),
    ($$A House with Good Bones$$),
    ($$Small Things Like These$$),
    ($$Doors of Darkness$$),
    ($$So Long, and Thanks for All the Fish$$),
    ($$A Court of Wings and Ruin$$),
    ($$The Troop$$),
    ($$The Saturday Night Ghost Club$$),
    ($$The Maltese Falcon$$),
    ($$The Sympathizer$$),
    ($$Dracula Daily$$),
    ($$Remarkably Bright Creatures$$),
    ($$A Court of Frost and Starlight$$),
    ($$Wuthering Heights$$)
    ($$The Lightning Thief$$),
    ($$The Sea of Monsters$$),
    ($$The Titan's Curse$$), ' --delete this apostrophe later
    ($$The Battle of the Labyrinth$$),
    ($$The Last Olympian$$),
    ($$The Martian$$)
    ($$Good Omens: The Nice and Accurate Prophecies of Agnes Nutter, Witch$$),
    ($$Project Hail Mary$$),
    ($$Red Rising$$),
    ($$Sunrise on the Reaping$$),
    ($$mistborn era 1: the final empire$$),
    ($$mistborn era 1: the well of ascension$$),
    ($$mistborn era 1: the hero of ages$$),
    ($$mistborn era 1: *the eleventh metal$$),
    ($$warbreaker$$),
    ($$tress of the emerald sea$$),
    ($$stormlight archive: the way of kings$$),
    ($$elantris$$),
    ($$*the hope of elantris$$),
    ($$*the emperor's soul$$), ' --delete this apostrophe later
    ($$stormlight archive: word of radiance$$),
    ($$*edgedancer$$),
    ($$mistborn era 2: the alloy of law$$),
    ($$mistborn era 2: *allomancer jak$$),
    ($$mistborn era 2: shadows of self$$),
    ($$mistborn era 2: the bands of mourning$$),
    ($$mistborn era 2: *mistborn: secret history$$),
    ($$mistborn era 2: the lot metal$$),
    ($$*arcanum unbounded essays$$),
    ($$*shadows for silence$$),
    ($$stormlight archive: oathbringer$$),
    ($$*dawnshard$$),
    ($$yumi and the nightmare painter$$),
    ($$white sand$$),
    ($$stormlight archive: rhythm of war$$),
    ($$(horneater)$$),
    ($$the sunlit man$$),
    ($$stormlight archive: wind and truth$$),
    ($$isles of the emberdark (includes *sixth of the dusk)$$),
    ($$The Hunger Games$$),
    ($$Catching Fire$$),
    ($$Mocking Jay$$);

INSERT INTO edition_types (edition_type)
VALUES
    ('Paperback'),
    ('Hardback'),
    ('Kindle'),
    ('Mass Market Paperback'),
    ('Substack');

INSERT INTO editions (book_id, edition_type_id, pub_date, pages, isbn_ten, isbn_thirteen, asin)
VALUES
    (1, 1, /*pub_date*/, 399, /*isbn10*/, /*isbn13*/, NULL), --The Golden Compass
    (2, 1, /*pub_date*/, 520, /*isbn10*/, /*isbn13*/, NULL), --The Ballad of Songbirds and Snakes
    (3, 2, /*pub_date*/, 292, /*isbn10*/, /*isbn13*/, NULL), --The Faceless Old Woman Who Secretly Lives in Your Home
    (4, 1, /*pub_date*/, 174, /*isbn10*/, /*isbn13*/, NULL), --The Castle of Llyr
    (5, 1, /*pub_date*/, 222, /*isbn10*/, /*isbn13*/, NULL), --Taran Wanderer
    (6, 1, /*pub_date*/, 253, /*isbn10*/, /*isbn13*/, NULL), --The High King
    (7, 1, /*pub_date*/, 236, /*isbn10*/, /*isbn13*/, NULL), --Inkspell
    (8, 1, /*pub_date*/, 202, /*isbn10*/, /*isbn13*/, NULL), --The Magician's Nephew
    (9, 1, /*pub_date*/, 189, /*isbn10*/, /*isbn13*/, NULL), --The Lion, the Witch and the Wardrobe
    (10, 1, /*pub_date*/, 224, /*isbn10*/, /*isbn13*/, NULL), --The Horse and His Boy
    (11, 1, /*pub_date*/, 130, /*isbn10*/, /*isbn13*/, NULL), --Prince Caspian
    (12, 3, /*pub_date*/, 140, /*isbn10*/, /*isbn13*/, 'B00ALKNFJC'), --The Voyage of the Dawn Treader
    (13, 3, /*pub_date*/, 260, /*isbn10*/, /*isbn13*/, 'B004DNWQ34'), --The Silver Chair
    (14, 3, /*pub_date*/, 234, /*isbn10*/, /*isbn13*/, '9780061974144'), --The Last Battle
    (15, 1, /*pub_date*/, 419, /*isbn10*/, /*isbn13*/, NULL), --A Court of Thorns and Roses
    (16, 1, /*pub_date*/, 301, /*isbn10*/, /*isbn13*/, NULL), --Norse Mythology
    (17, 1, /*pub_date*/, 384, /*isbn10*/, /*isbn13*/, NULL), --The Subtle Knife
    (18, 1, /*pub_date*/, 533, /*isbn10*/, /*isbn13*/, NULL), --The Amber Spyglass
    (19, 1, /*pub_date*/, 402, /*isbn10*/, /*isbn13*/, NULL), --The Magicians
    (20, 4, /*pub_date*/, 215, /*isbn10*/, /*isbn13*/, NULL), --The Hitchhiker's Guide to the Galaxy
    (21, 4, /*pub_date*/, 250, /*isbn10*/, /*isbn13*/, NULL), --The Restaurant at the End of the Universe
    (22, 4, /*pub_date*/, 240, /*isbn10*/, /*isbn13*/, NULL), --Life, the Universe and Everything
    (23, 1, /*pub_date*/, 626, /*isbn10*/, /*isbn13*/, NULL), --A Court of Mist and Fury
    (24, 3, /*pub_date*/, 128, /*isbn10*/, /*isbn13*/, 'B000FC0SH8'), --The Old Man and the Sea
    (25, 3, /*pub_date*/, 135, /*isbn10*/, /*isbn13*/, 'B0093UMLC8'), --A Month in the Country
    (26, 3, /*pub_date*/, 173, /*isbn10*/, /*isbn13*/, 'B006L8723I'), --Out of the Silent Planet
    (27, 3, /*pub_date*/, 204, /*isbn10*/, /*isbn13*/, 'B002VFPRTQ'), --The Westing Game
    (28, 3, /*pub_date*/, 174, /*isbn10*/, /*isbn13*/, 'B0DLSF7SYH'), --Every Heart a Doorway
    (29, 2, /*pub_date*/, 213, /*isbn10*/, /*isbn13*/, NULL), --Before the Coffee Gets Cold
    (30, 1, /*pub_date*/, 271, /*isbn10*/, /*isbn13*/, NULL), --Stardust
    (31, 1, /*pub_date*/, 212, /*isbn10*/, /*isbn13*/, NULL), --The Mysterious Affar at Styles
    (32, 3, /*pub_date*/, 322, /*isbn10*/, /*isbn13*/, 'B01M3WPB83'), --Meddling Kids
    (33, 3, /*pub_date*/, 198, /*isbn10*/, /*isbn13*/, 'B07MNG496J'), --This Is How You Lose the Time War
    (34, 3, /*pub_date*/, 342, /*isbn10*/, /*isbn13*/, 'B08MBQKTTQ'), --The Final Girl Suppport Group
    (35, 1, /*pub_date*/, 272, /*isbn10*/, /*isbn13*/, NULL), --A House with Good Bones
    (36, 2, /*pub_date*/, 114, /*isbn10*/, /*isbn13*/, NULL), --Small Things Like These
    (37, 1, /*pub_date*/, 320, /*isbn10*/, /*isbn13*/, NULL), --Doors of Darkness
    (38, 4, /*pub_date*/, 204, /*isbn10*/, /*isbn13*/, NULL), --So Long, and Thanks for All the Fish
    (39, 1, /*pub_date*/, 699, /*isbn10*/, /*isbn13*/, NULL), --A Court of Wings and Ruin
    (40, 1, /*pub_date*/, 355, /*isbn10*/, /*isbn13*/, NULL), --The Troop
    (41, 3, /*pub_date*/, 222, /*isbn10*/, /*isbn13*/, 'B07JW24LWW'), --The Saturday Night Ghost Club
    (42, 3, /*pub_date*/, 128, /*isbn10*/, /*isbn13*/, 'B004G5ZU32'), --The Maltese Falcon
    (43, 3, /*pub_date*/, 445, /*isbn10*/, /*isbn13*/, 'B00PSSG4MM'), --The Sympathizer
    (44, 5, /*pub_date*/, 111, /*isbn10*/, /*isbn13*/, NULL), --Dracula Daily
    (45, 2, /*pub_date*/, 368, /*isbn10*/, /*isbn13*/, NULL), --Remarkably Bright Creatures
    (46, 1, /*pub_date*/, 229, /*isbn10*/, /*isbn13*/, NULL), --A Court of Frost and Starlight
    (47, 2, /*pub_date*/, 316, /*isbn10*/, /*isbn13*/, NULL), --Wuthering Heights
    (48, 1, /*pub_date*/, 377, /*isbn10*/, /*isbn13*/, NULL), --The Lightning Thief
    (49, 1, /*pub_date*/, 279, /*isbn10*/, /*isbn13*/, NULL), --The Sea of Monsters
    (50, 1, /*pub_date*/, 352, /*isbn10*/, /*isbn13*/, NULL), --The Titan's Curse
    (51, 1, /*pub_date*/, 361, /*isbn10*/, /*isbn13*/, NULL), --The Battle of the Labyrinth
    (52, 1, /*pub_date*/, 381, /*isbn10*/, /*isbn13*/, NULL), --The Last Olympian
    (53, 1, /*pub_date*/, 384, /*isbn10*/, /*isbn13*/, NULL), --The Martian
    (54, 3, /*pub_date*/, 383, /*isbn10*/, /*isbn13*/, 'B0054LJGWS'), --Good Omens
    (55, 1, /*pub_date*/, 474, /*isbn10*/, /*isbn13*/, NULL), --Project Hail Mary
    (56, 1, /*pub_date*/, 382, /*isbn10*/, /*isbn13*/, NULL), --Red Rising
    (57, 2, /*pub_date*/, 382, /*isbn10*/, /*isbn13*/, NULL), --Sunrise on the Reaping
    (58, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (59, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (60, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (61, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (62, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (63, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (64, 1, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --The Way of Kings
    (65, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (66, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (67, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (68, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (69, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (70, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (71, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (72, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (73, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (74, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (75, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (76, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (77, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (78, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (79, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (80, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (81, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (82, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (83, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (84, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (85, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (86, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --
    (87, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --The Hunger Games
    (88, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --Catching Fire
    (89, /*edition_type*/, /*pub_date*/, NULL, /*isbn10*/, /*isbn13*/, NULL), --Mocking Jay
    (34, 3, /*pub_date*/, 342, /*isbn10*/, /*isbn13*/, NULL), --The Final Girl Suppport Group
    (52, /*edition_type*/, /*pub_date*/, 381, /*isbn10*/, /*isbn13*/, NULL); --The Last Olympian

INSERT INTO book_authors (book_id, author_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (4, 5),
    (5, 5),
    (6, 5),
    (7, 6),
    (8, 7),
    (9, 7),
    (10, 7),
    (11, 7),
    (12, 7),
    (13, 7),
    (14, 7),
    (15, 8),
    (16, 9),
    (17, 1),
    (18, 1),
    (19, 10),
    (20, 11),
    (21, 11),
    (22, 11),
    (23, 8),
    (24, 12),
    (25, 13),
    (26, 7),
    (27, 14),
    (28, 15),
    (29, 16),
    (30, 9),
    (31, 17),
    (32, 18),
    (33, 19),
    (34, 20),
    (35, 21),
    (36, 22),
    (37, 23),
    (37, 24),
    (37, 25),
    (37, 26),
    (37, 27),
    (37, 28),
    (37, 29),
    (37, 30),
    (37, 31),
    (37, 32),
    (37, 33),
    (37, 34),
    (37, 35),
    (37, 36),
    (37, 37),
    (37, 38),
    (37, 39),
    (37, 40),
    (37, 41),
    (37, 42),
    (37, 43),
    (37, 44),
    (37, 45),
    (37, 46),
    (37, 47),
    (37, 48),
    (37, 49),
    (38, 11),
    (39, 8),
    (40, 50),
    (41, 51),
    (42, 52),
    (43, 53),
    (44, 54),
    (45, 55),
    (46, 8),
    (47, 56),
    (48, 57),
    (49, 57),
    (50, 57),
    (51, 57),
    (52, 57),
    (53, 58),
    (54, 59),
    (54, 9),
    (55, 58),
    (56, 60),
    (57, 2);

INSERT INTO ratings (book_id, rating)
VALUES
    (40, 7.5),
    (46, 9.5),
    (55, 9.5),
    (56, 8);

INSERT INTO read_runs (edition_id)
VALUES
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9),
    (10),
    (11),
    (12),
    (13),
    (14),
    (15),
    (16),
    (17),
    (18),
    (19),
    (20),
    (21),
    (22),
    (23),
    (24),
    (25),
    (26),
    (27),
    (28),
    (29),
    (30),
    (31),
    (32),
    (33),
    (34),
    (35),
    (36),
    (37),
    (38),
    (39),
    (40),
    (41),
    (42),
    (43),
    (44),
    (45),
    (46),
    (55),
    (56),
    (57);

INSERT INTO page_read (read_date, read_run_id, pages_read)
VALUES
    ('2023-10-12', 1, 129),
    ('2023-10-17', 1, 34),
    ('2023-10-18', 1, 41),
    ('2023-10-23', 1, 195),
    ('2023-10-23', 2, 37),
    ('2023-10-24', 2, 102),
    ('2023-10-25', 2, 95),
    ('2023-10-26', 2, 128),
    ('2023-10-27', 2, 82),
    ('2023-10-31', 2, 76),
    ('2023-11-01', 3, 166),
    ('2023-11-02', 3, 126),
    ('2023-11-02', 4, 13),
    ('2023-11-06', 4, 77),
    ('2023-11-07', 4, 84),
    ('2023-11-07', 5, 45),
    ('2023-11-08', 5, 42),
    ('2023-11-09', 5, 88),
    ('2023-11-10', 5, 47),
    ('2023-11-10', 6, 16),
    ('2023-11-12', 6, 54),
    ('2023-11-13', 6, 121),
    ('2023-11-14', 6, 62),
    ('2023-11-15', 7, 47),
    ('2023-11-16', 7, 101),
    ('2023-11-17', 7, 88),
    ('2023-11-17', 8, 112),
    ('2023-11-18', 8, 90),
    ('2023-11-18', 9, 54),
    ('2023-11-19', 9, 71),
    ('2023-11-20', 9, 64),
    ('2023-11-20', 10, 36),
    ('2023-11-21', 10, 15),
    ('2023-11-22', 10, 72),
    ('2023-11-24', 10, 44),
    ('2023-11-25', 10, 22),
    ('2023-11-26', 10, 35),
    ('2023-11-26', 11, 41),
    ('2023-11-27', 11, 89),
    ('2023-11-29', 12, 63),
    ('2023-11-30', 12, 77),
    ('2023-11-30', 13, 102),
    ('2023-12-01', 13, 146),
    ('2023-12-03', 13, 114),
    ('2023-12-05', 14, 234),
    ('2023-12-07', 15, 47),
    ('2023-12-08', 15, 34),
    ('2023-12-11', 15, 127),
    ('2023-12-12', 15, 34),
    ('2023-12-14', 15, 26),
    ('2023-12-15', 15, 48),
    ('2023-12-23', 15, 21),
    ('2023-12-24', 15, 39),
    ('2023-12-25', 15, 43),
    ('2023-12-05', 16, 29),
    ('2023-12-06', 16, 42),
    ('2023-12-07', 16, 56),
    ('2023-12-08', 16, 28),
    ('2023-12-25', 16, 46),
    ('2023-12-26', 16, 30),
    ('2023-12-27', 16, 20),
    ('2023-12-28', 16, 50),
    ('2024-01-01', 17, 102),
    ('2024-01-02', 17, 153),
    ('2024-01-03', 17, 129),
    ('2024-01-03', 18, 10),
    ('2024-01-04', 18, 36),
    ('2024-01-05', 18, 20),
    ('2024-01-08', 18, 27),
    ('2024-01-09', 18, 19),
    ('2024-01-12', 18, 36),
    ('2024-01-14', 18, 51),
    ('2024-01-15', 18, 37),
    ('2024-01-16', 18, 41),
    ('2024-01-17', 18, 88),
    ('2024-01-18', 18, 54),
    ('2024-01-21', 18, 114),
    ('2024-01-26', 19, 18),
    ('2024-01-28', 19, 16),
    ('2024-01-29', 19, 72),
    ('2024-01-30', 19, 78),
    ('2024-01-31', 19, 218),
    ('2024-02-03', 20, 37),
    ('2024-02-05', 20, 178),
    ('2024-02-05', 21, 29),
    ('2024-02-07', 21, 42),
    ('2024-02-12', 21, 33),
    ('2024-02-13', 21, 43),
    ('2024-02-14', 21, 65),
    ('2024-03-02', 21, 38),
    ('2024-03-02', 22, 39),
    ('2024-03-04', 22, 21),
    ('2024-03-24', 22, 56),
    ('2024-03-27', 22, 49),
    ('2024-03-31', 22, 75),
    ('2024-04-01', 23, 43),
    ('2024-04-03', 23, 83),
    ('2024-04-05', 23, 31),
    ('2024-04-06', 23, 25),
    ('2024-04-10', 23, 32),
    ('2024-04-18', 23, 36),
    ('2024-04-22', 23, 112),
    ('2024-04-23', 23, 44),
    ('2024-04-24', 23, 37),
    ('2024-04-25', 23, 104),
    ('2024-04-26', 23, 79),
    ('2024-04-27', 24, 64),
    ('2024-04-28', 24, 64),
    ('2024-04-29', 25, 81),
    ('2024-04-30', 25, 54),
    ('2024-05-01', 26, 39),
    ('2024-05-06', 26, 41),
    ('2024-05-07', 26, 23),
    ('2024-05-09', 26, 22),
    ('2024-05-13', 26, 48),
    ('2024-05-14', 27, 120),
    ('2024-05-15', 27, 84),
    ('2024-05-16', 28, 174),
    ('2024-05-16', 29, 35),
    ('2024-05-17', 29, 46),
    ('2024-05-18', 29, 83),
    ('2024-05-19', 29, 49),
    ('2024-05-19', 30, 35),
    ('2024-05-20', 30, 138),
    ('2024-05-21', 30, 98),
    ('2024-05-22', 31, 27),
    ('2024-05-29', 31, 75),
    ('2024-05-31', 31, 110),
    ('2024-08-26', 32, 35),
    ('2024-08-27', 32, 20),
    ('2024-08-28', 32, 59),
    ('2024-09-01', 32, 127),
    ('2024-09-02', 32, 22),
    ('2024-09-03', 32, 59),
    ('2024-08-05', 33, 23),
    ('2024-08-07', 33, 32),
    ('2024-09-16', 33, 19),
    ('2024-09-17', 33, 52),
    ('2024-09-23', 33, 60),
    ('2024-09-24', 33, 10),
    ('2024-09-25', 33, 2),
    ('2024-09-25', 34, 39),
    ('2024-10-02', 34, 74),
    ('2024-10-03', 34, 144),
    ('2024-10-05', 34, 24),
    ('2024-10-06', 34, 61),
    ('2024-10-06', 35, 8),
    ('2024-10-07', 35, 17),
    ('2024-10-08', 35, 26),
    ('2024-11-04', 35, 6),
    ('2024-11-05', 35, 10),
    ('2024-11-06', 35, 42),
    ('2024-11-08', 35, 96),
    ('2024-11-09', 35, 67),
    ('2024-12-25', 36, 31),
    ('2025-01-10', 36, 30),
    ('2025-01-11', 36, 23),
    ('2025-01-12', 36, 30),
    ('2024-10-09', 37, 48),
    ('2024-10-11', 37, 37),
    ('2024-10-13', 37, 78),
    ('2024-11-04', 37, 15),
    ('2024-11-09', 37, 26),
    ('2024-11-10', 37, 12),
    ('2025-01-23', 37, 22),
    ('2025-01-24', 37, 15),
    ('2025-01-26', 37, 34),
    ('2025-02-07', 37, 33),
    ('2024-08-05', 38, 14),
    ('2025-02-08', 38, 88),
    ('2025-02-10', 38, 38),
    ('2025-02-12', 38, 34),
    ('2025-02-15', 38, 30),
    ('2025-02-15', 39, 99),
    ('2025-02-18', 39, 19),
    ('2025-02-19', 39, 25),
    ('2025-02-20', 39, 23),
    ('2025-02-22', 39, 72),
    ('2025-02-23', 39, 46),
    ('2025-02-24', 39, 12),
    ('2025-03-02', 39, 107),
    ('2025-05-14', 39, 45),
    ('2025-06-11', 39, 4),
    ('2025-08-16', 39, 37),
    ('2025-08-21', 39, 43),
    ('2025-08-23', 39, 25),
    ('2025-08-28', 39, 43),
    ('2025-08-30', 39, 30),
    ('2025-08-31', 39, 69),
    ('2025-09-23', 40, 65),
    ('2025-09-24', 40, 86),
    ('2025-09-25', 40, 37),
    ('2025-09-26', 40, 21),
    ('2025-09-29', 40, 34),
    ('2026-01-05', 40, 47),
    ('2026-01-06', 40, 65),
    ('2025-08-31', 41, 56),
    ('2024-11-13', 42, 7),
    ('2024-08-12', 43, 46),
    ('2024-09-04', 43, 46),
    ('2024-09-05', 43, 6),
    ('2024-09-06', 43, 6),
    ('2024-09-14', 43, 61),
    ('2024-09-15', 43, 8),
    ('2024-05-06', 44, 3),
    ('2024-05-07', 44, 1),
    ('2024-05-08', 44, 1),
    ('2024-05-13', 44, 3),
    ('2024-05-15', 44, 1),
    ('2024-05-16', 44, 1),
    ('2024-05-20', 44, 2),
    ('2024-05-24', 44, 1),
    ('2024-05-28', 44, 3),
    ('2024-05-31', 44, 1),
    ('2024-06-05', 44, 1),
    ('2024-06-17', 44, 1),
    ('2024-06-18', 44, 1),
    ('2024-06-24', 44, 1),
    ('2024-06-25', 44, 1),
    ('2024-07-09', 44, 4),
    ('2024-07-23', 44, 4),
    ('2024-07-29', 44, 5),
    ('2024-07-30', 44, 1),
    ('2024-09-03', 44, 11),
    ('2024-09-04', 44, 16),
    ('2024-09-05', 44, 1),
    ('2024-09-06', 44, 1),
    ('2024-09-07', 44, 1),
    ('2024-09-25', 44, 7),
    ('2024-10-03', 44, 4),
    ('2024-10-04', 44, 4),
    ('2024-10-08', 44, 1),
    ('2024-10-09', 44, 3),
    ('2024-10-14', 44, 1),
    ('2025-01-12', 44, 2),
    ('2024-05-11', 45, 10),
    ('2026-01-06', 46, 29),
    ('2026-01-07', 46, 15),
    ('2026-01-08', 46, 14),
    ('2026-01-12', 46, 4),
    ('2026-01-13', 46, 12),
    ('2026-01-14', 46, 155),
    ('2026-03-22', 47, 154.5),
    ('2026-03-23', 47, 104.5),
    ('2026-03-24', 47, 120),
    ('2026-03-25', 47, 95),
    ('2026-03-26', 48, 9),
    ('2026-03-28', 48, 25),
    ('2026-03-29', 48, 89),
    ('2026-03-30', 48, 39),
    ('2026-03-31', 48, 27),
    ('2026-04-01', 48, 92),
    ('2026-04-02', 48, 48),
    ('2026-04-03', 48, 53),
    ('2026-04-03', 49, 58),
    ('2026-04-04', 49, 8);


CREATE TABLE novel_series_series (
    novel_series_series_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    novel_series_series
);

CREATE TABLE novel_series (
    novel_series_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    novel_series
    novel_series_series_id INTEGER REFERS TO novel_series_series (novel_series_series_id)
);

CREATE TABLE reading_orders (
    reading_order_book_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    note TEXT,
    novel_series_series_id INTEGER REFERS TO novel_series_series (novel_series_series_id),
    novel_seriess_id INTEGER REFERS TO novel_series (novel_series_id)
);

CREATE TABLE reading_order_books (
    reading_order_book_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    reading_order_id INTEGER REFERS TO reading_orders (reading_order_id),
    book_id INTEGER REFERS TO books (book_id),
    order_num INTEGER
);

INSERT INTO novel_series_series (novel_series_series)
VALUES
    ('Cosmere'),
    ('Riordan'),
    ('Hunger Games');

INSERT INTO novel_series (novel_series, novel_series_series_id)
VALUES
    ('Mistborn Era 1', 1),
    ('The Stormlight Archive', 1),
    ('Mistborn Era 2', 1);

INSERT INTO reading_orders (note, novel_series_series_id, novel_series_id)
    VALUES
        ("Cosmere Chronological", 1, NULL),
        ("Riordan Release", 2, NULL),
        ("Hunger Games Release", 3, NULL),
        ("Hunger Games Chronological", 3, NULL);

INSERT INTO reading_order_books (novel_series_series_id, book_id, order_num)
VALUES
    (3, 87, 1),
    (3, 88, 2),
    (3, 89, 3),
    (3, 2, 4),
    (3, 57, 5),
    (4, 2, 1),
    (4, 57, 2),
    (4, 87, 3),
    (4, 88, 4),
    (4, 89, 5),
    (1, 58, 1),
    (1, 59, 2),
    (1, 60, 3),
    (1, 61, 4),
    (1, 62, 5),
    (1, 63, 6),
    (1, 64, 7),
    (1, 65, 8),
    (1, 66, 9),
    (1, 67, 10),
    (1, 68, 11),
    (1, 69, 12),
    (1, 70, 13),
    (1, 71, 14),
    (1, 72, 15),
    (1, 73, 16),
    (1, 74, 17),
    (1, 75, 18),
    (1, 76, 19),
    (1, 77, 20),
    (1, 78, 21),
    (1, 79, 22),
    (1, 80, 23),
    (1, 81, 24),
    (1, 82, 25),
    (1, 83, 26),
    (1, 84, 27),
    (1, 85, 28),
    (1, 86, 29);


--query for percent complete
-- update for editions
SELECT book_title, (SUM(pages_read)/pages*100) AS percent_complete, MAX(read_date) AS last_read
FROM books
JOIN page_read ON books.book_id = page_read.book_id
GROUP BY book_title, percent_complete, last_read
ORDER BY last_read DESC;

--query for percent complete active books
-- update for editions
SELECT book_title, (SUM(pages_read)/pages*100) AS percent_complete, MAX(read_date) AS last_read
FROM books
JOIN page_read ON books.book_id = page_read.book_id
GROUP BY book_title, percent_complete, last_read
ORDER BY last_read DESC
WHERE percent_complete < 100;

--for adding new book and authors at same time
--INSERT INTO books (book_title) VALUES ($$book title$$) RETURNING book_id INTO b_id;
--WITH new_authors AS (
--    INSERT INTO authors (author_name) VALUES ('author name') RETURNING author_id
--)
--DO
--$$
--DECLARE
--    a record;
--BEGIN
--    FOR a IN SELECT author_id
--        FROM new_authors
--    LOOP
--        INSERT INTO book_authors (book_id, author_id) VALUES (b_id, a.author_id);
--    END LOOP
--    INSERT INTO editions (book_id, edition_type_id, pub_date, pages, isbn_ten, isbn_thirteen, asin)
--    VALUES (b_id, /*edition_type_id*/, /*pub_date*/, /*pages*/, /*isbn_ten*/, /*isbn_thirteen*/, /*asin*/);
--END; $$;



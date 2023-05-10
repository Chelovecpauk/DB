CREATE TABLE Body_condition(
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE CHECK(name != ''),
	description varchar(50) NOT NULL UNIQUE CHECK(description != '')
);

CREATE TABLE Body(
	id serial PRIMARY KEY,
	condition_id int REFERENCES Body_condition
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
	name varchar(50) NOT NULL UNIQUE CHECK(name != ''),
	cause_of_condition varchar(50) NOT NULL CHECK(cause_of_condition != '')
);

CREATE TABLE Person(
	id serial PRIMARY KEY,
	body_id int REFERENCES Body 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	name varchar(50) NOT NULL UNIQUE CHECK(name != '')
);

CREATE TABLE Feeling(
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE CHECK(name != ''),
	description varchar(50) NOT NULL UNIQUE CHECK(description != '')
);

CREATE TABLE Person_Feeling(
	person_id int,
	feeling_id int,
	FOREIGN KEY(person_id) REFERENCES Person(id),
	FOREIGN KEY(feeling_id) REFERENCES Feeling(id),
	PRIMARY KEY(person_id,feeling_id)
);

CREATE TABLE HumanBehavior(
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE CHECK(name != ''),
	description varchar(50) NOT NULL UNIQUE CHECK(description != '')
);

CREATE TABLE Person_Behavior(
	person_id int,
	behavior_id int,
	FOREIGN KEY(person_id) REFERENCES Person(id),
	FOREIGN KEY(behavior_id) REFERENCES HumanBehavior(id),
	PRIMARY KEY(person_id, behavior_id)
);

CREATE TABLE Eyes(
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE CHECK(name != ''),
	position varchar(50) NOT NULL CHECK(position != '')
);

CREATE TABLE Head(
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE CHECK(name != ''),
	position varchar(50) NOT NULL CHECK(position != '')
);

CREATE TABLE Room(
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE CHECK(name != ''),
	location varchar(50) NOT NULL UNIQUE CHECK(location != '')
);

CREATE TABLE Dinosaur(
	id serial PRIMARY KEY,
	head_id int REFERENCES Head 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	eyes_id int REFERENCES Eyes 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	room_id int REFERENCES Room 
		ON DELETE SET NULL
		ON UPDATE CASCADE,
	name varchar(50) NOT NULL UNIQUE CHECK(name != '')
);

CREATE TABLE DinosaurBehavior(
	id serial PRIMARY KEY,
	name varchar(50) NOT NULL UNIQUE CHECK(name != ''),
	description varchar(50) NOT NULL UNIQUE CHECK(description != '')
);

CREATE TABLE Dinosaur_Behavior(
	dinosaur_id int,
	behavior_id int,
	FOREIGN KEY(dinosaur_id) REFERENCES Dinosaur(id),
	FOREIGN KEY(behavior_id) REFERENCES HumanBehavior(id),
	PRIMARY KEY(dinosaur_id, behavior_id)
);

INSERT INTO Body_condition(name, description)
VALUES
	('relax', 'when you chill'),
	('stress', 'when you feel bad ');

INSERT INTO Body(name, condition_id, cause_of_condition)
VALUES
	('body_1', 2, 'Over training'),
	('body_2', 1, 'After meal'),
	('body_3', 1, 'By eating sweets');

INSERT INTO Person(body_id, name)
VALUES
	(1, 'Sultan'),
	(2, 'Lester'),
	(3, 'Krid');

INSERT INTO Feeling(name, description)
VALUES
	('happy', 'when you smile'),
	('sadness', 'when you failed rubejku');

INSERT INTO Person_Feeling(person_id, feeling_id)
VALUES
	(1, 1),
	(3,1),
	(1, 2);

INSERT INTO HumanBehavior(name, description)
VALUES
	('jump', 'перемещение перпендикулярно касательной к планете'),
	('lookForward', 'ждать с нетерпением');

INSERT INTO Person_Behavior(person_id, behavior_id)
VALUES
	(2,1),
	(1,2);

INSERT INTO Room(name, location)
VALUES
	('room1', 'SM June'),
	('room2', 'SM Zebra');

INSERT INTO Eyes(name, position)
VALUES
	('eyes1', 'right'),
	('eyes2', 'left');

INSERT INTO Head(name, position)
VALUES
	('head1', 'right'),
	('head2', 'left');

INSERT INTO Dinosaur(name, room_id, eyes_id, head_id)
VALUES
	('dino1', 1, 1, 1),
	('dino2', 2, 2, 2);

INSERT INTO DinosaurBehavior(name, description)
VALUES
	('growl', 'make a saund'),
	('sleep', 'sleep is sleep');

INSERT INTO Dinosaur_Behavior(dinosaur_id, behavior_id)
VALUES
	(1, 2),
	(2, 1);


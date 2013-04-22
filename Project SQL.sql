CREATE TABLE EVENT
(
	EVENT_ID INT IDENTITY(1,1),
	EVENT_TITLE VARCHAR(50),
	EVENT_TIME DATETIME,
	EVENT_DESC VARCHAR(200),
	EVENT_SECTION VARCHAR(10),
	EVENT_LOCATION VARCHAR(100),
	EVENT_CUTOFF DATETIME,
	COURSE_ID INT
)

CREATE TABLE COURSE
(
	COURSE_ID INT IDENTITY(1,1),
	COURSE_NAME VARCHAR (50)
)

CREATE TABLE EVENT_REGISTRY
(
	EVENT_ID INT NOT NULL,
	STUDENT_ID INT NOT NULL,
	ER_COMMENT VARCHAR(200),
	ER_ATTENDING VARCHAR(10),
	ER_OWNER INT
)

CREATE TABLE STUDENT
(
	STUDENT_ID INT IDENTITY(1,1),
	STUDENT_FNAME VARCHAR(20),
	STUDENT_LNAME VARCHAR(20),
	STUDENT_PHNO VARCHAR(15),
	STUDENT_EMAIL VARCHAR(50) NOT NULL UNIQUE,
	STUDENT_PASS VARCHAR(50)
)

CREATE TABLE REGISTRY
(
	STUDENT_ID INT NOT NULL,
	COURSE_ID INT NOT NULL
)

ALTER TABLE EVENT
ADD CONSTRAINT PK_EVENT PRIMARY KEY(EVENT_ID)

ALTER TABLE COURSE
ADD CONSTRAINT PK_COURSE PRIMARY KEY(COURSE_ID)

ALTER TABLE EVENT_REGISTRY
ADD CONSTRAINT PK_EREG PRIMARY KEY(EVENT_ID,STUDENT_ID)

ALTER TABLE STUDENT
ADD CONSTRAINT PK_STUDENT PRIMARY KEY(STUDENT_ID)

ALTER TABLE REGISTRY
ADD CONSTRAINT PK_REG PRIMARY KEY(STUDENT_ID,COURSE_ID)

ALTER TABLE EVENT
ADD CONSTRAINT FK_COURSE FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID)

ALTER TABLE EVENT_REGISTRY
ADD CONSTRAINT FK_EREG_EVENT FOREIGN KEY(EVENT_ID) REFERENCES EVENT(EVENT_ID)

ALTER TABLE EVENT_REGISTRY
ADD CONSTRAINT FK_EREG_STUDENT FOREIGN KEY(STUDENT_ID) REFERENCES STUDENT(STUDENT_ID)

ALTER TABLE REGISTRY
ADD CONSTRAINT FK_REG_STUDENT FOREIGN KEY(STUDENT_ID) REFERENCES STUDENT(STUDENT_ID)

ALTER TABLE REGISTRY
ADD CONSTRAINT FK_REG_COURSE FOREIGN KEY(COURSE_ID) REFERENCES COURSE(COURSE_ID)

 
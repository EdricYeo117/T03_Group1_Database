CREATE TABLE Condo 
(
 	CondoID 		char(7)			NOT NULL,
 	CondoName 		varchar(50)		NULL,
 	CondoAddress 	varchar(100)	NULL,
	CONSTRAINT PK_Condo PRIMARY KEY (CondoID),
	CONSTRAINT CondoID_Format CHECK (CondoID LIKE 'CD[0-9][0-9][0-9][0-9][A-Za-z]')
);
CREATE TABLE Facility
(
	FacID		char(7)			NOT NULL,
	FacName		varchar(100)	NOT NULL,
	Deposit		smallmoney		NOT NULL,
	CondoID		char(7)			NOT NULL,
	CONSTRAINT PK_Facility PRIMARY KEY (FacID),
	CONSTRAINT FK_Facility_CondoID FOREIGN KEY (CondoID) REFERENCES Condo(CondoID),
	CONSTRAINT FacID_Format CHECK (FacID LIKE 'FA[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT Facility_CondoID_Format CHECK (CondoID LIKE'CD[0-9][0-9][0-9][0-9][A-Za-z]')
);

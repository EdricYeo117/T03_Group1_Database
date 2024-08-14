CREATE TABLE CondoMgmt
(
	CondoMgmtID		char(7)			NOT NULL,
	ContactPerson	varchar(20)		NULL,
	CtcPersonMobile	char(10)		NULL	UNIQUE,
	CONSTRAINT PK_CondoMgmt PRIMARY KEY (CondoMgmtID),
	CONSTRAINT FK_CondoMgmt_Account FOREIGN KEY (CondoMgmtID) REFERENCES Account(AccID),
	CONSTRAINT CondoMgmt_AccID_Format CHECK (CondoMgmtID LIKE 'AC[0-9][0-9][0-9][0-9][A-Za-z]'),
   	CONSTRAINT CtcPersonMobile_Format CHECK (CtcPersonMobile LIKE '65[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

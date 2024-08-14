CREATE TABLE Account
(
	AccID		char(7)			NOT NULL,
	AccName		varchar(30)		NOT NULL,
	AccAddress	varchar(100)	NOT NULL,
	AccCtcNo	char(10)		NULL	UNIQUE,
	AccEmail	varchar(50)		NULL	UNIQUE,
	CondoID		char(7)			NOT NULL,
	ApprovedBy	char(7)     	NULL,
	CONSTRAINT PK_Account PRIMARY KEY (AccID),
	CONSTRAINT FK_AccountApprovedBy_Staff FOREIGN KEY (ApprovedBy) REFERENCES Staff(StaffID),
	CONSTRAINT Account_AccID_Format CHECK (AccID LIKE 'AC[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT Account_AccCtcNo_Format CHECK (AccCtcNo LIKE '65[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT Account_ApprovedByStaff_Format CHECK (ApprovedBy LIKE 'ST[0-9][0-9][0-9][0-9][A-Z]')
);

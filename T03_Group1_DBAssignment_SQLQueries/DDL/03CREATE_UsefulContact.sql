CREATE TABLE UsefulContact
(
	UsefulCtcID		char(7)			NOT NULL,
	UsefulCtcName	varchar(50)		NOT NULL,
	UsefulCtcDesc	varchar(100)	NULL,
	UsefulCtcPhone	char(10)		NOT NULL,
	CtcCatID		char(7)			NULL,
	CONSTRAINT PK_UsefulContact PRIMARY KEY (UsefulCtcID),
	CONSTRAINT FK_UsefulContact_CtcCatID FOREIGN KEY (CtcCatID) REFERENCES	ContactCategory(CtcCatID),
	CONSTRAINT UsefulContact_UsefulCtcID_Format CHECK (UsefulCtcID LIKE 'UC[0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT UsefulCtcPhone_Format CHECK (UsefulCtcPhone LIKE'65[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT UsefulContact_CtcCatID_Format CHECK (CtcCatID LIKE 'CC[0-9][0-9][0-9][0-9][A-Z]')
);

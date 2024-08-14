CREATE TABLE ContactCategory
(
	CtcCatID	char(7)			NOT NULL,
	CtcCatDesc	varchar(100)	NOT NULL,
	CONSTRAINT PK_ContactCat PRIMARY KEY (CtcCatID),
	CONSTRAINT CtcCatID_Format CHECK (CtcCatID LIKE 'CC[0-9][0-9][0-9][0-9][A-Za-z]')
);

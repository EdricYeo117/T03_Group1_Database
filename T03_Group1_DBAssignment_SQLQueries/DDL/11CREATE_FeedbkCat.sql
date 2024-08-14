CREATE TABLE FeedbkCat
(
	FbkCatID	char(7)		NOT NULL,
	FbkCatDesc	varchar(20)	NOT NULL,
	CONSTRAINT PK_FeedbkCat PRIMARY KEY (FbkCatID),
	CONSTRAINT FeedbkCat_FbkCatID_Format CHECK (FbkCatID LIKE 'FC[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT FeedbkCat_FbkCatDesc_Format CHECK (FbkCatDesc IN ('Cleanliness','Security','Plumbing','Building Defects', 'Others'))
);

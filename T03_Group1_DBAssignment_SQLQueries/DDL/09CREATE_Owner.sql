CREATE TABLE Owner
(
	OwnerID			char(7)			NOT NULL,
	OwnStartDate	smalldatetime	NOT NULL,
	CheckedBy		char(7)			NULL,
	CONSTRAINT PK_Owner PRIMARY KEY (OwnerID),
	CONSTRAINT FK_Owner_CheckedByAcc FOREIGN KEY (CheckedBy) REFERENCES CondoMgmt(CondoMgmtID),
	CONSTRAINT Owner_OwnerID_Format CHECK (OwnerID LIKE 'AC[0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT Owner_CheckedByAcc_Format CHECK (CheckedBy LIKE 'AC[0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT OwnStartDate_Format CHECK (OwnStartDate <= GETDATE())
);

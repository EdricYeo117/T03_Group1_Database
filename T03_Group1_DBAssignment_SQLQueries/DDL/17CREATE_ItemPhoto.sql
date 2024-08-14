CREATE TABLE ItemPhoto
(
	ItemID		char(7)			NOT NULL,
	Photo		varchar(100)	NOT NULL,
	CONSTRAINT PK_ItemPhoto PRIMARY KEY (ItemID, Photo),
	CONSTRAINT FK_ItemPhoto_MsgID FOREIGN KEY (ItemID) REFERENCES Message(MsgID),
	CONSTRAINT ItemPhoto_ItemID_Format CHECK (ItemID LIKE 'MI[0-9][0-9][0-9][0-9][A-Za-z]')
);

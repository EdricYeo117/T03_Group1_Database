CREATE TABLE ItemRelated
(
	ItemID		char(7)		NOT NULL,
	ItemDesc	char(100)	NOT NULL,
	ItemPrice	smallmoney	NOT NULL,
	ItemStatus	varchar(15)	NOT NULL,
	SaleOrRent	varchar(10)	NOT NULL,
	ItemCatID	char(7)		NULL,
	CONSTRAINT PK_ItemRelated PRIMARY KEY (ItemID),
	CONSTRAINT FK_ItemRelated_ItemID FOREIGN KEY (ItemID) REFERENCES Message (MsgID),
	CONSTRAINT FK_ItemRelated_ItemCatID FOREIGN KEY (ItemCatID) REFERENCES ItemCategory (ItemCatID),
	CONSTRAINT ItemRelated_ItemCatID_FORMAT CHECK (ItemID LIKE 'MI[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT ItemRelated_ItemStatus CHECK (ItemStatus IN ('Available', 'Sold')),
	CONSTRAINT ItemRelated_SaleOrRent CHECK (SaleOrRent IN ('For Sale', 'For Rent')),
	CONSTRAINT ItemRelated_ItemCatID CHECK  (ItemCatID LIKE 'IC[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT ItemPrice_Check CHECK (ItemPrice = ROUND(ItemPrice, 2))
);

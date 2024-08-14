CREATE TABLE ItemCategory
(
	ItemCatID	char(7)		NOT NULL,
	ItemCatDesc	varchar(20)	NOT NULL,
	CONSTRAINT PK_ItemCategory PRIMARY KEY (ItemCatID),
	CONSTRAINT ItemCategory_ItemCatID_Format CHECK (ItemCatID LIKE 'IC[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT ItemCategory_ItemCatDesc_Format CHECK (ItemCatDesc IN ('Homeware', 'Fashion','Furniture', 'Electronics', 'Others'))
);

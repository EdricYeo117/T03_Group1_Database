CREATE TABLE TempVehLabel
(
	VehLblAppID		char(7)			NOT NULL,
	TempStartDate	smalldatetime	NOT NULL,
	TempExpiryDate	smalldatetime	NOT NULL,
	CONSTRAINT PK_TempVehLabel PRIMARY KEY (VehLblAppID),
	CONSTRAINT FK_TempVehLabel_VehLblAppID FOREIGN KEY (VehLblAppID) REFERENCES VehLabel(VehLblAppID),
	CONSTRAINT Owner_VehLblAppID_Format CHECK (VehLblAppID LIKE 'VL[0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT Owner_TempExpiryDate_Format CHECK (TempStartDate <= TempExpiryDate),
);

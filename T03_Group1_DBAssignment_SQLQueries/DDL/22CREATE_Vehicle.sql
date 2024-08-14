CREATE TABLE Vehicle
(
	VehicleNo	char(8)			NOT NULL,
	IUNo		char(10)		NULL,
	Ownership	varchar(30)		NOT NULL,
	Make		varchar(30)		NOT NULL,
	Model		varchar(30)		NOT NULL,
	CONSTRAINT PK_Vehicle PRIMARY KEY (VehicleNo),
	CONSTRAINT Vehicle_VehicleNo_Format CHECK (VehicleNo LIKE 'S[A-Za-z][A-Za-z][0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT Vehicle_IUNo_Format CHECK (IUNo IS NULL OR IUNo LIKE '%[0-9]%'),
	CONSTRAINT Vehicle_Ownership_Format CHECK (Ownership IN ('Own', 'Rent', 'Company', 'Others'))
);

CREATE TABLE VehLabel
(
	VehLblAppID		char(7)		NOT NULL,
	VehLblStatus	varchar(30)	NOT NULL,
	VehLblNum		varchar(10)	NULL,
	VehicleNo		char(8)		NOT NULL,
	AppliedBy		char(7)		NOT NULL,
	IssuedBy		char(7)		NULL,
	CONSTRAINT PK_VehLabel PRIMARY KEY(VehLblAppID),
	CONSTRAINT FK_VehLabel_VehicleNo FOREIGN KEY (VehicleNo) REFERENCES Vehicle(VehicleNo),
	CONSTRAINT FK_VehLabel_AppliedByAcc FOREIGN KEY (AppliedBy) REFERENCES Account(AccID),
	CONSTRAINT FK_VehLabel_IssuedByCondoMgmt FOREIGN KEY (IssuedBy) REFERENCES CondoMgmt(CondoMgmtID),
	CONSTRAINT VehLabel_VehLblAppID_Format CHECK (VehLblAppID LIKE 'VL[0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT VehLabel_VehLblStatus_Format CHECK (VehLblStatus IN ('Pending', 'Approved','Rejected')),
	CONSTRAINT VehLabel_VehLblNum_Format CHECK (VehLblNum IS NULL OR VehLblNum LIKE '%[0-9]%'),
	CONSTRAINT VehLabell_VehLblNum_Format CHECK (VehicleNo LIKE 'S[A-Za-z][A-Za-z][0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT VehicleLabel_AppliedByAcc_Format CHECK (AppliedBy LIKE 'AC[0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT VehicleLabel_IssuedByAcc_Format CHECK (IssuedBy LIKE 'AC[0-9][0-9][0-9][0-9][A-Z]')
);

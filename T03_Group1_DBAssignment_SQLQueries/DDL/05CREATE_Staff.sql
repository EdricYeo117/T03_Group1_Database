CREATE TABLE Staff
(
	StaffID			char(7)			NOT NULL,
	StaffName		varchar(30)		NOT NULL,
	StaffContactNo	char(10)		NOT NULL	UNIQUE,
	StaffDateJoined	smalldatetime	NOT NULL,
	StaffRole		varchar(20)		NOT NULL,
	CONSTRAINT PK_Staff PRIMARY KEY (StaffID),
	CONSTRAINT Staff_StaffID_Format CHECK (StaffID LIKE 'ST[0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT Staff_StaffContactNo_Format CHECK (StaffContactNo LIKE'65[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CONSTRAINT Staff_StaffDateJoined CHECK (StaffDateJoined <= GETDATE()),
	CONSTRAINT Staff_StaffRole CHECK (StaffRole IN ('Admin', 'Customer Service', 'Tech Support'))
);

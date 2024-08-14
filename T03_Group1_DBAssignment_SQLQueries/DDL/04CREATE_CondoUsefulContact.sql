CREATE TABLE CondoUsefulContact
(
	CondoID		char(7)		NOT NULL,
	UsefulCtcID	char(7)		NOT NULL,
	CONSTRAINT PK_CondoUsefulContact PRIMARY KEY (CondoID, UsefulCtcID),
	CONSTRAINT FK_CondoUsefulContact_CondoID FOREIGN KEY (CondoID) REFERENCES Condo(CondoID),
	CONSTRAINT FK_CondoUsefulContact_UsefulCtcID FOREIGN KEY (UsefulCtcID) REFERENCES UsefulContact(UsefulCtcID),
	CONSTRAINT CondoUsefulContact_CondoID_Format CHECK (CondoID LIKE 'CD[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT CondoUsefulContact_UsefulCtcID_Format CHECK (UsefulCtcID LIKE 'UC[0-9][0-9][0-9][0-9][A-Za-z]')
);

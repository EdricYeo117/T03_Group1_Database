CREATE TABLE FacTimeSlot
(
	FacID		char(7)			NOT NULL,
	TimeSlotSN	integer			NOT NULL,
	SlotDesc	varchar(100)	NOT NULL,
	CONSTRAINT PK_FacTimeSlot PRIMARY KEY (FacID, TimeSlotSN),
	CONSTRAINT FK_FacTimeSlot_FacID FOREIGN KEY (FacID) REFERENCES Facility(FacID),
	CONSTRAINT FacTimeSlot_FacID_Format CHECK (FacID LIKE 'FA[0-9][0-9][0-9][0-9][A-Za-z]'),
);

CREATE TABLE BookSlot
(
	FacID		char(7)			NOT NULL,
	TimeSlotSN	integer			NOT NULL,
	SlotDate	smalldatetime	NOT NULL,
	SlotStatus	char(1)			NOT NULL,
	CONSTRAINT PK_BookSlot PRIMARY KEY (FacID, TimeSlotSN, SlotDate),
	CONSTRAINT FK_BookSlot_FacTimeSlot FOREIGN KEY (FacID, TimeSlotSN) REFERENCES FacTimeSlot(FacID, TimeSlotSN),
	CONSTRAINT BookSlot_FacID_Format CHECK (FacID LIKE 'FA[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT BookSlot_SlotStatus_Format CHECK (SlotStatus IN ( 'A', 'B', 'M', 'R'))
);

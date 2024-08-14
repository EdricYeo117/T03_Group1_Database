CREATE TABLE Booking
(
	BookingID		char(7)			NOT NULL,
	BookingDate		varchar(20)		NOT NULL,
	BookingStatus	varchar(100)	NOT NULL,
	AccID 			char(7)			NOT NULL,
	FacID			char(7)			NULL,
	TimeSlotSN		integer			NULL,
	SlotDate		smalldatetime	NULL,
	CONSTRAINT PK_Booking PRIMARY KEY (BookingID),
	CONSTRAINT FK_Booking_AccID FOREIGN KEY (AccID) REFERENCES Account(AccID),
	CONSTRAINT FK_Booking_BookSlot FOREIGN KEY (FacID, TimeSlotSN, SlotDate) REFERENCES BookSlot(FacID, TimeSlotSN, SlotDate),
	CONSTRAINT Booking_BookingID_Format CHECK (BookingID LIKE 'BK[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT Booking_BookingStatus_Format CHECK (BookingStatus IN ('Pending Payment', 'Confirmed', 'Cancelled'))
);

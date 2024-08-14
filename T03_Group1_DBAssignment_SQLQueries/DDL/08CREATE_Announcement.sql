CREATE TABLE Announcement
(
	AnnID			char(7)			NOT NULL,
	AnnText			varchar(1000)	NOT NULL,
	AnnStartDate	smalldatetime	NOT NULL,
	AnnEndDate		smalldatetime	NOT NULL,
	CondoMgmtID		char(7)			NOT NULL,
	CONSTRAINT PK_Announcement PRIMARY KEY (AnnID),
	CONSTRAINT FK_Announcement_AnnouncedByCondoMgmt FOREIGN KEY (CondoMgmtID)
	REFERENCES CondoMgmt(CondoMgmtID),
	CONSTRAINT AnnStartDate_Check CHECK (AnnStartDate < AnnEndDate),
	CONSTRAINT AnnID_Format CHECK (AnnID LIKE 'AN[0-9][0-9][0-9][0-9][A-Za-z]')
);


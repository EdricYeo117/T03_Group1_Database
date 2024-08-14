CREATE TABLE Feedback
(
	FbkID		char(7)			NOT NULL,
	FbkDesc		varchar(2000)	NOT NULL,
	FbkDateTime	smalldatetime	NOT NULL,
	FbkStatus	varchar(15)		NOT NULL,
	ByAccID		char(7)			NOT NULL,
	FbkCatID	char(7)			NOT NULL,
	CondoMgmtID	char(7)			NULL,
	CONSTRAINT PK_Feedback PRIMARY KEY (FbkID),
	CONSTRAINT FK_Feedback_AccID FOREIGN KEY (ByAccID) REFERENCES Account(AccID),
	CONSTRAINT FK_Feedback_FbkCatID FOREIGN KEY (FbkCatID) REFERENCES FeedbkCat(FbkCatID),
	CONSTRAINT FK_Feedback_CondoMgmtID FOREIGN KEY (CondoMgmtID) REFERENCES CondoMgmt(CondoMgmtID),
	CONSTRAINT Feedback_FbkID_Format CHECK (FbkID LIKE 'FB[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT Feedback_FbkDateTime_Format CHECK (FbkDateTime <= GETDATE()),
	CONSTRAINT Feedback_AccID_Format CHECK (ByAccID LIKE 'AC[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT Feedback_FbkStatus_Format CHECK (FbkStatus IN ('Sent','In Progress', 'Attended')),
	CONSTRAINT Feedback_FbkCatID_Format CHECK (FbkCatID LIKE 'FC[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT Feedback_CondoMgmtID_Format CHECK (CondoMgmtID LIKE 'AC[0-9][0-9][0-9][0-9][A-Za-z]')
);

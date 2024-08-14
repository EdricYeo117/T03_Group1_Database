CREATE TABLE Likes
(
	AccID		char(7)		NOT NULL,
	MessageID	char(7)		NOT NULL,
	CONSTRAINT PK_Likes PRIMARY KEY (AccID, MessageID),
	CONSTRAINT FK_Likes_AccID FOREIGN KEY (AccID) REFERENCES Account(AccID),
	CONSTRAINT FK_Likes_MessageID FOREIGN KEY (MessageID) REFERENCES Message(MsgID),
	CONSTRAINT Likes_AccID_Format CHECK (AccID LIKE 'AC[0-9][0-9][0-9][0-9][A-Za-z]'),
	CONSTRAINT Likes_MessageID_Format CHECK (MessageID LIKE 'MI[0-9][0-9][0-9][0-9][A-Za-z]'),
);

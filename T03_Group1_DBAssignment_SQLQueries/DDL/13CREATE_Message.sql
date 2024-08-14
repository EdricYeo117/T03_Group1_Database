CREATE TABLE Message
(
	MsgID		char(7)			NOT NULL,
	MsgText		varchar(100)	NOT NULL,
	MsgType		varchar(20)		NOT NULL,
	PostedBy	char(7)			NOT NULL,
	ReplyTo		char(7)			NULL,
	CONSTRAINT PK_Message PRIMARY KEY (MsgID),
	CONSTRAINT FK_Message_PostedByAcc FOREIGN KEY (PostedBy) REFERENCES Account (AccID),
	CONSTRAINT FK_Message_ReplyToAcc FOREIGN KEY (ReplyTo) REFERENCES Account (AccID),
	CONSTRAINT Message_MsgType_Format CHECK (MsgType IN ('CB','GS','FB')),
	CONSTRAINT Message_PostedByAcc_Format CHECK (PostedBy LIKE 'AC[0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT Message_ReplyToAcc_Format CHECK (ReplyTo LIKE 'AC[0-9][0-9][0-9][0-9][A-Z]')
);

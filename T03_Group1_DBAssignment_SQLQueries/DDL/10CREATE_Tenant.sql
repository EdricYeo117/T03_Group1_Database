CREATE TABLE Tenant
(
	TenantID			char(7)			NOT NULL,
	ContractStartDate	smalldatetime	NOT NULL,
	ContractEndDate		smalldatetime	NOT NULL,
	VerifiedBy			char(7)			NULL,
	CONSTRAINT PK_Tenant PRIMARY KEY (TenantID),
	CONSTRAINT FK_Tenant_TenantID FOREIGN KEY (TenantID) REFERENCES Account(AccID),
	CONSTRAINT FK_Tenant_VerifiedByCondoMgmt FOREIGN KEY (VerifiedBy) REFERENCES CondoMgmt(CondoMgmtID),
	CONSTRAINT Tenant_TenantID_Format CHECK (TenantID LIKE 'AC[0-9][0-9][0-9][0-9][A-Z]'),
	CONSTRAINT Tenant_ContractStartDate_Format CHECK (ContractStartDate <= GETDATE()),
	CONSTRAINT Tenant_ContactEndDate_Format CHECK (ContractStartDate < ContractEndDate),
	CONSTRAINT Tenant_VerifiedBy_Format CHECK (VerifiedBy LIKE 'AC[0-9][0-9][0-9][0-9][A-Z]')
);

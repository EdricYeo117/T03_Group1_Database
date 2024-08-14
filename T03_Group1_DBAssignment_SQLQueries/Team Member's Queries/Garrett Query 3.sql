SELECT
    c.CondoID,
    c.CondoName AS 'Condominium',
    COUNT(t.TenantID) AS 'NumberOfTenants',
    AVG(DATEDIFF(DAY, t.ContractStartDate, t.ContractEndDate)) 
    AS 'Average Tenancy Duration (DAYS)'
FROM 
    Condo c
INNER JOIN 
    Account ac ON c.CondoID = ac.CondoID
INNER JOIN 
    Tenant t ON ac.AccID = t.TenantID
GROUP BY 
    c.CondoID, c.CondoName;

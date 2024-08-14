SELECT
    Condominium,
    COUNT(TenantID) AS "Number of Tenants",
    MAX("Condo Manager") AS "Condo Manager",
    MAX("Condo Management Contact No.") AS "Condo Management Contact No.",
    MAX("Condo Management Personnel Email") AS "Condo Management Personnel Email",
    MAX("Condo Management Personnel Contact No.") AS "Condo Management Personnel Contact No."
FROM (
    SELECT
        condo.CondoName AS Condominium,
        tenant.tenantID AS TenantID,
        condomgmtaccount.AccName AS "Condo Manager",
        condomgmt.ContactPerson AS "Condo Management Contact No.",
        condomgmtaccount.AccEmail AS "Condo Management Personnel Email",
        condomgmtaccount.AccCtcNo AS "Condo Management Personnel Contact No."
    FROM 
        Account account
    INNER JOIN
        Condo condo ON account.CondoID = condo.CondoID
    INNER JOIN
        Tenant tenant ON account.AccID = tenant.TenantID
    INNER JOIN
        CondoMgmt condomgmt ON tenant.VerifiedBy = condomgmt.CondoMgmtID
    INNER JOIN 
        Account condomgmtaccount ON condomgmt.CondoMgmtID = condomgmtaccount.AccID
    WHERE
        (DATEDIFF(MONTH, tenant.ContractStartDate, tenant.ContractEndDate) < 3
        OR tenant.ContractEndDate < GETDATE())
) AS Subquery
GROUP BY
    Condominium
ORDER BY
    "Number of Tenants" DESC;

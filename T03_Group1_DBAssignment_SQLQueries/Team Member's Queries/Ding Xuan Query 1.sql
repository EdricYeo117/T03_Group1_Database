SELECT
    account.AccID AS 'Announcement ID',
    announcement.AnnText AS 'Announcement Text',
    announcement.AnnStartDate AS 'Announcement Start Date',
    announcement.AnnEndDate AS 'Announcement End Date',
    ABS (DATEDIFF(DAY, announcement.AnnEndDate, announcement.AnnStartDate)) AS 'Duration (Days)',
    account.AccName AS 'Condo Manager',
    condomgmt.ContactPerson AS 'Condo Management Contact'
FROM
    Announcement announcement
INNER JOIN 
    CondoMgmt condomgmt ON announcement.CondoMgmtID = condomgmt.CondoMgmtID
INNER JOIN 
    Account account ON condomgmt.CondoMgmtID = account.AccID
WHERE
    YEAR(announcement.AnnStartDate) = 2024
    AND MONTH(announcement.AnnStartDate) = 2
GROUP BY 
    account.AccID,
    announcement.AnnText,
    announcement.AnnStartDate,
    announcement.AnnEndDate,
DATEDIFF(DAY, announcement.AnnEndDate, announcement.AnnStartDate),
    account.AccName,
    condomgmt.ContactPerson;

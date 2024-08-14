SELECT 
    condo.CondoName AS Condominium,
    feedback.FbkStatus AS Status,
    ABS(DATEDIFF(DAY, GETDATE(), feedback.FbkDateTime)) AS "Days Overdue",
    feedback.FbkID AS 'Feedback ID',
    account.AccName AS "Feedback Provider",
    account.AccCtcNo AS "Contact No.",
    feedbackcat.FbkCatDesc AS "Feedback Category",
    (SELECT COUNT(*) 
     FROM Feedback sub_feedback
     WHERE sub_feedback.FbkCatID = feedback.FbkCatID
       AND sub_feedback.FbkStatus IN ('Sent', 'In Progress')
       AND sub_feedback.FbkDateTime < GETDATE() 
       AND DATEDIFF(Month, sub_feedback.FbkDateTime, GETDATE()) > 1) AS "Total Overdue in Category",
    condomgmt.ContactPerson AS "Condo Mgmt Contact Person",
    condomgmt.CtcPersonMobile AS "Condo Mgmt Contact No."
FROM Feedback feedback
INNER JOIN FeedbkCat feedbackcat ON feedback.FbkCatID = feedbackcat.FbkCatID
INNER JOIN Account account ON feedback.ByAccID = account.AccID
INNER JOIN Condo condo ON account.CondoID = condo.CondoID
INNER JOIN CondoMgmt condomgmt ON feedback.CondoMgmtID = condomgmt.CondoMgmtID
WHERE
    feedback.FbkStatus IN ('Sent', 'In Progress')
    AND feedback.FbkDateTime < GETDATE() 
    AND DATEDIFF(Month, feedback.FbkDateTime, GETDATE()) > 1
GROUP BY
    condo.CondoName,
    feedback.FbkStatus,
    ABS(DATEDIFF(DAY, GETDATE(), feedback.FbkDateTime)),
     feedback.FbkID,
    account.AccName,
    account.AccCtcNo,
    feedbackcat.FbkCatDesc,
    feedback.FbkCatID,
    condomgmt.ContactPerson,
    condomgmt.CtcPersonMobile
HAVING
    ABS(DATEDIFF(DAY, GETDATE(), feedback.FbkDateTime)) > 0
ORDER BY
    Status,
    "Feedback Category",
    "Days Overdue";

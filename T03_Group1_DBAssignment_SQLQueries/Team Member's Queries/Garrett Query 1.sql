SELECT  
    c.CondoID,
    c.CondoName AS 'Condominium', 
    c.CondoAddress AS 'Address' , 
    uc.UsefulCtcName AS 'Hospital Name',
    uc.UsefulCtcPhone AS 'Hospital Number'
FROM 
    Condo c
INNER JOIN 
    CondoUsefulContact cu ON c.CondoID = cu.CondoID
INNER JOIN 
    UsefulContact uc ON cu.UsefulCtcID = uc.UsefulCtcID
INNER JOIN 
    ContactCategory cc ON uc.CtcCatID = cc.CtcCatID
WHERE 
    cc.CtcCatDesc = 'Medical/Emergency'
GROUP BY 
    c.CondoID, 
    c.CondoName, 
    c.CondoAddress, 
    uc.UsefulCtcName, 
    uc.UsefulCtcPhone
ORDER BY 
    c.CondoID;

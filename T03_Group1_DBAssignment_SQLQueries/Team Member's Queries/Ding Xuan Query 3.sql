SELECT
    account.AccID AS 'Name of Poster',
    message.MsgID AS 'Message ID',
    message.MsgText AS 'Messsage Text',
    itemcategory.ItemCatDesc AS 'Item Category',
    itemrelated.ItemDesc AS 'Item Description',
    itemrelated.ItemPrice AS 'Item Price'
FROM
    Message message
INNER JOIN
    Account account ON message.PostedBy = account.AccID
INNER JOIN
    ItemRelated itemrelated ON message.MsgID = itemrelated.ItemID
INNER JOIN
    ItemCategory itemcategory ON itemrelated.ItemCatID = itemcategory.ItemCatID
INNER JOIN
    ItemPhoto itemphoto ON itemrelated.ItemID = itemphoto.ItemID
WHERE
    message.MsgType = 'GS'
    AND itemcategory.ItemCatDesc= 'Electronics'
GROUP BY
    account.AccID,
    message.MsgID,
    message.MsgText,
itemcategory.ItemCatDesc,
    itemrelated.ItemDesc,
    itemrelated.ItemPrice
ORDER BY
    account.AccID ASC;

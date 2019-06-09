DELETE FROM buy
WHERE VIRTUAL_ACCOUNT = 
   (SELECT virtual_account
   FROM buy
   WHERE pur_num = 10);
SELECT ITEMSETID FROM prline

update maxattributecfg set classname = 'com.byas.field.Receiving' where objectname = 'MATRECTRANS' and attributename = 'ACTUALDATE'

update maxattribute set classname = 'com.byas.field.Receiving' where objectname = 'MATRECTRANS' and attributename = 'ACTUALDATE'


SELECT * FROM maxattributecfg WHERE objectname = 'MATRECTRANS' and attributename = 'ACTUALDATE'

SELECT * FROM maxattribute WHERE objectname = 'POLINE' and attributename = 'ITEMNUM' --and classname like 'byas' -- 

SELECT * FROM maxattribute WHERE objectname = 'PO' and attributename = 'FOLLOWUPDATE'



--psdi.app.common.purchasing.FldPurItemNum


select value from alndomain where domainid = 'atarih'


update maxattributecfg set classname = 'com.byas.field.Ptwo' where objectname = 'POLINE' and attributename = 'ITEMNUM'

update maxattribute set classname = 'com.byas.field.Ptwo' where objectname = 'POLINE' and attributename = 'ITEMNUM'

-- Prline goes rigt here 

update maxattributecfg set classname = 'com.byas.field.ParcaBDHesabi' where objectname = 'PRLINE' and attributename = 'ITEMNUM'

update maxattribute set classname = 'com.byas.field.ParcaBDHesabi' where objectname = 'PRLINE' and attributename = 'ITEMNUM'

select * from maxrelationship where parent = 'chartofaccounts' and child = 'PRLINE'


SELECT chartofaccounts.ch4, prline.itemnum, prline.rl8 FROM chartofaccounts, prline where chartofaccounts.glaccount = prline.gldebitacct 


select * from prline

select gldebitacct from prline

select glaccount from chartofaccounts

select * from maxrelationship where parent='ITEM' and child='PRLINE'


SELECT * FROM PRLINE

--GldemirbasPO

update maxattributecfg set classname = 'com.byas.field.GldemirbasPO' where objectname = 'POLINE' and attributename = 'GLDEBITACCT'

update maxattribute set classname = 'com.byas.field.GldemirbasPO' where objectname = 'POLINE' and attributename = 'GLDEBITACCT'



update maxattributecfg set classname = 'com.byas.field.GldemirbasPR' where objectname = 'PRLINE' and attributename = 'GLDEBITACCT'

update maxattribute set classname = 'com.byas.field.GldemirbasPR' where objectname = 'PRLINE' and attributename = 'GLDEBITACCT'


select * from item
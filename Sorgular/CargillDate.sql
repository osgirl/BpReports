SELECT ITEMSETID FROM prline

update maxattributecfg set classname = 'com.byas.field.Receiving' where objectname = 'MATRECTRANS' and attributename = 'ACTUALDATE'

update maxattribute set classname = 'com.byas.field.Receiving' where objectname = 'MATRECTRANS' and attributename = 'ACTUALDATE'

SELECT * FROM maxattributecfg WHERE objectname = 'MATRECTRANS' and attributename = 'ACTUALDATE'

SELECT * FROM maxattribute WHERE objectname = 'PRLINE' and attributename = 'ITEMNUM'

SELECT * FROM maxattribute WHERE objectname = 'PO' and attributename = 'FOLLOWUPDATE'

select * from wostatus where WONUM = '53493'

select * from dbo.workorder

--psdi.app.common.purchasing.FldPurItemNum

select * from prline, item where prline.itemnum = item.itemnum and prline.itemsetid = item.itemsetid



select value from alndomain where domainid = 'atarih'


update maxattributecfg set classname = 'com.byas.field.Ptwo' where objectname = 'POLINE' and attributename = 'ITEMNUM'

update maxattribute set classname = 'com.byas.field.Ptwo' where objectname = 'POLINE' and attributename = 'ITEMNUM'

select * from maxsequence where tbname = 'workorder'


select workorderid from workorder order by desc


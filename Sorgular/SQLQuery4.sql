select * from item where itemnum = 'TEST12'

select * from poline where ponum = '1069'

select * from maxattribute where domainid in (select domainid from crossoverdomain )
select * from crossoverdomain 

select wonum, description,status, assetnum, reportdate from workorder where 1=1
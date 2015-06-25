select wonum,siteid,location,classstructureid,  
(select person.displayname from person where person.personid = (select top 1 jobplan.supervisor from jobplan, workorder where jobplan.jpnum=workorder.jpnum and jobplan.siteid=workorder.siteid )) as owner,  
(select top 1 asset.priority from asset, workorder where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid ) as priority,  
(select top 1 site.description from site, workorder where site.siteid=workorder.siteid ORDER BY description desc  ) as sdescription,  
(select top 1 worktype.wtypedesc from worktype, workorder where worktype.worktype=workorder.worktype ) as worktype,  
coalesce( (select min(priority) from asset, workorder where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid),(select min(priority) from asset, workorder where asset.location=workorder.location and asset.siteid=workorder.siteid and workorder.wopriority=5), (select min(asset.priority) from asset, workorder where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid)) as minpriority,  
(select top 1 jobplan.description from jobplan, workorder where jobplan.jpnum=workorder.jpnum ) as jdescription,
targstartdate,targcompdate,assetnum,description as description,wopriority,jpnum   
from workorder  
where workorder.worktype='100' and workorder.wopriority=10 and workorder.parent = 'NULL' and workorder.assetnum is not null and workorder.location is not null and orgid='YARORG' --and " + params["where"]





select parent from workorder 

select site.description from site, workorder where site.siteid=workorder.siteid ORDER BY description DESC
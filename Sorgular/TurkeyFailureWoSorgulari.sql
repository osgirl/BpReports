select wonum,siteid,location,classstructureid,  
(select person.displayname from person where person.personid = (select top 1 jobplan.supervisor from jobplan, workorder where jobplan.jpnum=workorder.jpnum and jobplan.siteid=workorder.siteid )) as owner,  
(select asset.priority from asset, workorder where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid ) as priority,  
(select site.description from site where site.siteid=workorder.siteid ) as sdescription,  
(select worktype.wtypedesc from worktype where worktype.worktype=workorder.worktype ) as worktype,  
coalesce( (select min(priority) from asset where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid),(select min(priority) from asset where asset.location=workorder.location and asset.siteid=workorder.siteid and workorder.wopriority=5), (select asset.priority from asset where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid)) as minpriority,  
(select description from jobplan where jobplan.jpnum=workorder.jpnum ) as jdescription,
targstartdate,targcompdate,assetnum,description as description,wopriority,jpnum   
from workorder  
where workorder.worktype='100' and workorder.wopriority=10 and workorder.parent is null and workorder.assetnum is not null and workorder.location is not null and orgid='YARORG' --and " + params["where"]


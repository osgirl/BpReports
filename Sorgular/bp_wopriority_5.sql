select wonum,worktype,owner,siteid,location,priority,sdescription,pdescription,minpriority,reportdate,schedstart,schedfinish,assetnum,description,wopriority,route,jpnum from
(select workorder.worktype,workorder.owner,workorder.siteid,wonum,workorder.location, 
(select top 2 asset.priority from asset where asset.assetnum=workorder.assetnum ) as priority, 
(select top 2 site.description from site where site.siteid=workorder.siteid ) as sdescription, 
(select top 2 pm.description from pm where pm.pmnum=workorder.pmnum ) as pdescription, 
coalesce((select min(priority) from asset where assetnum in (select assetnum from route_stop where route=workorder.route)),wopriority) as minpriority, 
ltrim(convert(varchar(10), getdate(),120)) as reportdate,  
ltrim(Convert(varchar(10),coalesce(targstartdate, getdate(),120))) as schedstart,
ltrim(Convert(varchar(10),coalesce(targcompdate, getdate(), 120))) as schedfinish,  
workorder.assetnum,workorder.description as description,workorder.wopriority,workorder.route,workorder.jpnum 
from workorder 
where wopriority=5  --and " +params["where"]
) workorder
group by wonum,worktype,owner,siteid,location,priority,sdescription,pdescription,minpriority,reportdate,schedstart,schedfinish,assetnum,description,wopriority,route,jpnum




select workorder.wonum,workorder.description, 
(select jobplan.priority from jobplan where jobplan.jpnum=workorder.jpnum and ((jobplan.orgid=workorder.orgid and
 jobplan.siteid=workorder.siteid) or (jobplan.orgid=workorder.orgid and jobplan.siteid is null) or (jobplan.orgid is null and jobplan.siteid is null)) ) as jpriority, 
(select site.description from site where site.siteid=workorder.siteid) as siteid , 
 workorder.targstartdate,workorder.targcompdate,workorder.actfinish,workorder.actfinish-workorder.targcompdate as delay 
 from workorder where workorder.orgid='YARORG'  and workorder.parent is null

 --114219

 select * from workorder where parent is null
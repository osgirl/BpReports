select wonum, worktype, owner, siteid, location, priority, sdescription, pdescription,jdescription,minpriority,reportdate,schedstart,schedfinish,assetnum,description,wopriority,route,jpnum from 
(select workorder.siteid,wonum,workorder.location,workorder.supervisor as owner  
(select top 2 worktype.wtypedesc from worktype where worktype.worktype=workorder.worktype and worktype.orgid=workorder.orgid) as worktype,  
(select top 2 jobplan.description from jobplan where jobplan.jpnum=workorder.jpnum and jobplan.siteid=workorder.siteid) as jdescription,  
(select top 2 asset.priority from asset where asset.assetnum=workorder.assetnum) as priority,  
(select top 2 site.description from site where site.siteid=workorder.siteid) as sdescription,  
(select top 2 pm.description from pm where pm.pmnum=workorder.pmnum) as pdescription,  
coalesce( (select min(priority) from asset where assetnum in (select assetnum from route_stop where route=workorder.route)),wopriority) as minpriority,  
ltrim(convert(varchar(10), getdate(),120) as reportdate,  
ltrim(Convert(varchar(10),coalesce(targstartdate, getdate(),120))) as schedstart,  
ltrim(Convert(varchar(10),coalesce(targcompdate, getdate(), 120))) as schedfinish,  
workorder.assetnum,workorder.description as description,workorder.wopriority,workorder.route,workorder.jpnum   
from workorder  
where wopriority=4 --and  " +params["where"]
) workorder 
group by wonum,worktype,owner,siteid,location,priority,sdescription,pdescription,minpriority,reportdate,schedstart,schedfinish,assetnum,description,wopriority,route,jpnum

select wonum, worktype, owner, siteid, location, priority, sdescription, pdescription, jdescription, minpriority, reportdate, schedstart, schedfinish, assetnum, description, wopriority, route, jpnum from 
(select workorder.siteid, wonum, workorder.location, workorder.supervisor as owner,  
(select top 2 worktype.wtypedesc from worktype where worktype.worktype = workorder.worktype and worktype.orgid = workorder.orgid) as worktype,  
(select top 2 jobplan.description from jobplan where jobplan.jpnum = workorder.jpnum and jobplan.siteid = workorder.siteid) as jdescription,  
(select top 2 asset.priority from asset where asset.assetnum = workorder.assetnum) as priority,  
(select top 2 site.description from site where site.siteid = workorder.siteid) as sdescription,  
(select top 2 pm.description from pm where pm.pmnum = workorder.pmnum) as pdescription,  
coalesce( (select min(priority) from asset where assetnum in (select assetnum from route_stop where route=workorder.route)),wopriority) as minpriority,  
ltrim(convert(varchar(10), getdate(),120)) as reportdate, 
ltrim(Convert(varchar(10),coalesce(targstartdate, getdate(),120))) as schedstart,  
ltrim(Convert(varchar(10),coalesce(targcompdate, getdate(), 120))) as schedfinish,  
workorder.assetnum,workorder.description as description,workorder.wopriority,workorder.route,workorder.jpnum   
 from workorder  
where wopriority=4 --and  " +params["where"]
) workorder 
group by wonum,worktype,owner,siteid,location,priority,sdescription,pdescription,jdescription,minpriority,reportdate,schedstart,schedfinish,assetnum,description,wopriority,route,jpnum
















SELECT 
	wonum
FROM
	WORKORDER
WHERE 1=1
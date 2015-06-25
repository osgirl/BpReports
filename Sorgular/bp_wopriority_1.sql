select wonum,worktype,owner,siteid,location,priority,sdescription,pdescription,minpriority,reportdate,schedstart,schedfinish,assetnum,description,wopriority,route,jpnum from
(select workorder.worktype,workorder.owner,workorder.siteid,wonum,workorder.location,
(select top 2 asset.priority from asset where asset.assetnum=workorder.assetnum) as priority,
(select top 2 site.description from site where site.siteid=workorder.siteid) as sdescription,
(select top 2 pm.description from pm where pm.pmnum=workorder.pmnum) as pdescription,
coalesce( (select min(priority) from asset where assetnum in (select assetnum from route_stop where route=workorder.route)),wopriority) as minpriority,
ltrim(convert(varchar(10), getdate(),120)) as reportdate,
ltrim(Convert(varchar(10),coalesce(targstartdate, getdate(),120))) as schedstart,
ltrim(Convert(varchar(10),coalesce(targcompdate, getdate(), 120))) as schedfinish,
workorder.assetnum,workorder.description as description,workorder.wopriority,workorder.route,workorder.jpnum
from workorder
where wopriority=1 and 1=1 
) workorder
group by wonum,worktype,owner,siteid,location,priority,sdescription,pdescription,minpriority,reportdate,schedstart,schedfinish,assetnum,description,wopriority,route,jpnum

--and siteid like 'YARIMCA'
--
select 
	(select top 2 priority from asset where asset.assetnum=route_stop.assetnum) as priority,
	(select top 2 description from asset where asset.assetnum=route_stop.assetnum) as radescription,
	route_stop.route as rroute, route_stop.assetnum as rassetnum,
	coalesce(route_stop.location,(select top 2 asset.location from asset where assetnum=route_stop.assetnum )) as rlocation,
	(select longdescription.ldtext from longdescription where longdescription.ldkey =  (select top 2 assetid from asset where assetnum=route_stop.assetnum ) and ldownertable='ASSET' ) as aldescription,
(select top 2 routes.description from routes where routes.route=route_stop.route ) as rdescription
from route_stop
where route_stop.route='R101' and route_stop.siteid= 'YARIMCA'  order by priority desc

SELECT * FROM route_stop










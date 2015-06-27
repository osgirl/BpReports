--// Add query to sqlText variable.
--sqlText = " select wonum,siteid,location,pmnum,  "
--+ " (select person.displayname from person where person.personid = (select jobplan.supervisor from jobplan where jobplan.jpnum=workorder.jpnum and jobplan.siteid=workorder.siteid and rownum<2)) as owner,  "
--+ " (select asset.priority from asset where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid and rownum<2) as priority,  "
--+ " (select site.description from site where site.siteid=workorder.siteid and rownum<2) as sdescription,  "
--+ " (select pm.description from pm where pm.pmnum=workorder.pmnum and pm.siteid=workorder.siteid and rownum<2) as pdescription,  "
--+ " (select worktype.wtypedesc from worktype where worktype.worktype=workorder.worktype and rownum<2) as worktype,  "
--+ " coalesce( (select min(priority) from asset where assetnum in (select assetnum from route_stop where route_stop.route=workorder.route and route_stop.siteid=workorder.siteid) and asset.siteid=workorder.siteid),(select min(priority) from asset where asset.location=workorder.location and asset.siteid=workorder.siteid and workorder.wopriority=5), (select asset.priority from asset where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid and rownum<2)) as minpriority,  "
--+ " targstartdate,targcompdate,assetnum,description as description,wopriority,route,jpnum   "
--+ " from workorder  "
--//+ " where " + params["where"]
--+ " where (woclass = 'WORKORDER' or woclass = 'ACTIVITY') and PARENT IS NULL AND historyflag = 0 and istask = 0 and status not in ('COMP','CLOSE','CAN') and orgid = 'BP-TURK' and " + params["where"]

select	wonum, 
		siteid, 
		location, 
		pmnum,
		(select person.displayname from person where person.personid = (select jobplan.supervisor from jobplan where jobplan.jpnum=workorder.jpnum and jobplan.siteid=workorder.siteid and ROW_NUMBER() 2)) as owner,
		(select asset.priority from asset where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid and ROW_NUMBER()<2) as priority,
		(select site.description from site where site.siteid=workorder.siteid and ROW_NUMBER()<2) as sdescription,
		(select pm.description from pm where pm.pmnum=workorder.pmnum and pm.siteid=workorder.siteid and ROW_NUMBER()<2) as pdescription,
		(select worktype.wtypedesc from worktype where worktype.worktype=workorder.worktype and ROW_NUMBER()<2) as worktype, 
		coalesce( (select min(priority) from asset where assetnum in (select assetnum from route_stop where route_stop.route=workorder.route and route_stop.siteid=workorder.siteid) and asset.siteid=workorder.siteid),(select min(priority) from asset where asset.location=workorder.location and asset.siteid=workorder.siteid and workorder.wopriority=5), (select asset.priority from asset where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid and rownum<2)) as minpriority,
		targstartdate,targcompdate,assetnum,description as description,wopriority,route,jpnum
from workorder
where (woclass = 'WORKORDER' OR woclass = 'ACTIVITY') AND PARENT IS NULL AND historyflag = 0 AND istask = 0 and status not in ('COMP', 'CLOSE', 'CAN') AND orgid = 'YARORG' 


select wonum, description, (select asset.priority from asset where asset.assetnum = workorder.assetnum) from workorder


 select wonum,siteid,location,pmnum,  
 (select person.displayname from person where person.personid = (select top 2 jobplan.supervisor from jobplan where jobplan.jpnum=workorder.jpnum and jobplan.siteid=workorder.siteid)) as owner,
 (select top 2 asset.priority from asset where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid ) as priority,
 (select top 2 site.description from site where site.siteid=workorder.siteid) as sdescription,
 (select top 2 pm.description from pm where pm.pmnum=workorder.pmnum and pm.siteid=workorder.siteid) as pdescription,
 (select top 2 worktype.wtypedesc from worktype where worktype.worktype=workorder.worktype) as worktype,
 coalesce( (select min(priority) from asset where assetnum in (select assetnum from route_stop where route_stop.route=workorder.route and route_stop.siteid=workorder.siteid) and asset.siteid=workorder.siteid),(select min(priority) from asset where asset.location=workorder.location and asset.siteid=workorder.siteid and workorder.wopriority=5), (select top 2 asset.priority from asset where asset.assetnum=workorder.assetnum and asset.siteid=workorder.siteid)) as minpriority,
 targstartdate,targcompdate,assetnum,description as description,wopriority,route,jpnum 
 from workorder
 where (woclass = 'WORKORDER' or woclass = 'ACTIVITY') and (PARENT IS NULL or parent = 'NULL') AND historyflag = 0 and istask = 0 and status not in ('COMP','CLOSE','CAN') and orgid = 'YARORG'

  select top 2 asset.description,asset.assetnum from asset
 where asset.assetnum = 'YDT0007' and asset.siteid= 'YARIMCA'

 SELECT * FROM locations WHERE siteid = 'YARIMCA'

 select jobtask.jptask, jobplan.description as jdescription,jobtask.jpnum,jobtask.description as description from jobplan join jobtask on jobplan.jobplanid=jobtask.jobplanid
 and jobplan.jpnum = 'B0010' and jobplan.siteid= 'YARIMCA'

 select top 2 locations.description,locations.location from locations  
 where locations.location = 'L10201' and locations.siteid= 'YARIMCA'

 select   (select top 2 priority from asset where asset.assetnum=route_stop.assetnum and asset.siteid=route_stop.siteid) as priority ,
 (select top 2 description from asset where asset.assetnum=route_stop.assetnum and asset.siteid=route_stop.siteid)as radescription, 
 route_stop.route as rroute,route_stop.assetnum as rassetnum,
 coalesce(route_stop.location,(select top 2 asset.location from asset where asset.assetnum=route_stop.assetnum and asset.siteid=route_stop.siteid)) as rlocation, 
 (select longdescription.ldtext from longdescription where longdescription.ldkey=  (select top 2assetuid from asset where asset.assetnum=route_stop.assetnum and asset.siteid=route_stop.siteid) and ldownertable='ASSET' ) as aldescription,
 coalesce((select top 2 locations.description from locations where locations.location=(select top 2 asset.location from asset where asset.assetnum=route_stop.assetnum and asset.siteid=route_stop.siteid) and locations.siteid=route_stop.siteid),(select top 2 locations.description from locations where locations.location=route_stop.location and locations.siteid=route_stop.siteid )) as ldescription,
 (select top 2 routes.description from routes where routes.route=route_stop.route and routes.siteid=route_stop.siteid) as rdescription 
  from route_stop
  where route_stop.route='" +rows[0]["route"]+"' and route_stop.siteid= '" +rows[0]["siteid"]+"'  order by priority



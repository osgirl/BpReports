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
select wonum,worktype,owner,siteid,location,priority,sdescription,pdescription,minpriority,reportdate,schedstart,schedfinish,assetnum,description,wopriority,route,jpnum from
(select workorder.worktype,workorder.owner,workorder.siteid,wonum,workorder.location,
(select TOP 2 asset.priority from asset where asset.assetnum=workorder.assetnum ) as priority,
(select top 2 site.description from site where site.siteid=workorder.siteid ) as sdescription,
(select top 2 pm.description from pm where pm.pmnum=workorder.pmnum) as pdescription,
coalesce( (select min(priority) from asset where assetnum in (select assetnum from route_stop where route=workorder.route)),wopriority) as minpriority,
ltrim(convert(varchar(10), getdate(),120)) as reportdate,
ltrim(Convert(varchar(10),coalesce(targstartdate, getdate(),120))) as schedstart,
ltrim(Convert(varchar(10),coalesce(targcompdate, getdate(), 120))) as schedfinish,
workorder.assetnum,workorder.description as description,workorder.wopriority,workorder.route,workorder.jpnum
from workorder
where wopriority=3
) workorder
group by wonum,worktype,owner,siteid,location,priority,sdescription,pdescription,minpriority,reportdate,schedstart,schedfinish,assetnum,description,wopriority,route,jpnum

--jqsubsecdataset
select jobplan.description as jdescription, jobtask.jpnum, jobtask.description as description 
from jobplan join jobtask on jobplan.jobplanid=jobtask.jobplanid and jobplan.jpnum = 'B0010' and jobplan.siteid= 'YARIMCA'

---A DATA SET 
select 
	TOP 2 locations.description,
	locations.location 
from 
	locations 
 where  
	locations.location = 'L123' and locations.siteid= 'YARIMCA'

SELECT * FROM JOBPLAN where siteid = 'YARIMCA'
SELECT * FROM LOCATIONS WHERE SITEID = 'YARIMCA'

select workorder.wonum, workorder.JPNUM from workorder, jobtask where workorder.jpnum is not null and workorder.siteid = 'YARIMCA' and jptask in ( select jptask from jobtask where jptask is not null)


select wonum, JPNUM from workorder where jpnum in (select jpnum from jobplan where siteid='YARIMCA')  AND siteid = 'YARIMCA' and wopriority=3

select distinct (JPNUM) from workorder where jpnum not in (select jpnum from jobplan where siteid='YARIMCA')  AND siteid = 'YARIMCA' --and wopriority=3
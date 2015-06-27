select workorder.wonum, workorder.description,
(select top 1 jobplan.priority from jobplan, workorder where jobplan.jpnum=workorder.jpnum and ((jobplan.orgid=workorder.orgid and jobplan.siteid=workorder.siteid) or (jobplan.orgid = workorder.orgid and jobplan.siteid is null) or (jobplan.orgid is null and jobplan.siteid is null)) ) as jpriority, 
(select top 1 site.description from site, workorder where site.siteid=workorder.siteid) as siteid , 
workorder.targstartdate,workorder.targcompdate,workorder.actfinish,workorder.actfinish-workorder.targcompdate as delay 
from workorder 
where --" + params["where"] and 
workorder.orgid='YARORG' and (workorder.parent = 'NULL' or workorder.parent is null) and workorder.jpnum is not null and workorder.targstartdate is not null and workorder.targcompdate is not null 
and workorder.targcompdate <= '01/01/15'--" + MXReportSqlFormat.getEndDayTimestampFunction(params["enddate"])
and workorder.targstartdate >= '01/01/09'--" + MXReportSqlFormat.getStartDayTimestampFunction(params["startdate"])


select workorder.wonum, 
	workorder.description,  
	(select top 1 jobplan.priority from jobplan, workorder where jobplan.jpnum=workorder.jpnum and ((jobplan.orgid=workorder.orgid and jobplan.siteid=workorder.siteid) or (jobplan.orgid = workorder.orgid and jobplan.siteid is null) or (jobplan.orgid is null and jobplan.siteid is null)) ) as jpriority,   
	(select top 1 site.description from site, workorder where site.siteid=workorder.siteid) as siteid ,   
	workorder.targstartdate,workorder.targcompdate,workorder.actfinish,workorder.actfinish-workorder.targcompdate as delay   
from workorder  
where 1=1  
	and workorder.orgid='YARORG' 
	and (workorder.parent = 'NULL' or workorder.parent is null) 
	and workorder.jpnum is not null 
	and workorder.targstartdate is not null 
	and workorder.targcompdate is not null  
	and workorder.targcompdate <= '01/01/15' 
	and workorder.targstartdate >= '01/01/09'

	
select workorder.wonum, workorder.description,  
(select top 1 jobplan.priority from jobplan, workorder where jobplan.jpnum=workorder.jpnum and ((jobplan.orgid=workorder.orgid and jobplan.siteid=workorder.siteid) or (jobplan.orgid = workorder.orgid and jobplan.siteid is null) or (jobplan.orgid is null and jobplan.siteid is null)) ) as jpriority,  
(select top 1 site.description from site, workorder where site.siteid=workorder.siteid) as siteid ,  
workorder.targstartdate,workorder.targcompdate,workorder.actfinish,workorder.actfinish-workorder.targcompdate as delay   
from workorder  
where 1=1 and ((workorder.siteid like '%YARIMCA%')) and workorder.orgid='YARORG' and (workorder.parent = 'NULL' or workorder.parent is null) and workorder.jpnum is not null and workorder.targstartdate is not null and workorder.targcompdate is not null  and workorder.targcompdate <= { ts '2015-01-01 23:59:59.998' } and workorder.targstartdate >= { ts '2009-01-01 00:00:00.000' }


0542 308 20 52 ercan ekıcı 




select * from workorder where reportdate < '01/01/15'
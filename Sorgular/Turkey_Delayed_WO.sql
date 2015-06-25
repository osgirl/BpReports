select 
	workorder.wonum,
	workorder.description,
	(select 
		jobplan.priority 
	from 
		jobplan, workorder 
	where 
		jobplan.jpnum = workorder.jpnum 
		and (
			(jobplan.orgid=workorder.orgid 
				and jobplan.siteid=workorder.siteid) 
			or 
			(jobplan.orgid=workorder.orgid 
				and jobplan.siteid is null) 
			or (
				jobplan.orgid is null 
					and jobplan.siteid is null)
			) and jobplan.orgid='YARORG'
	) as jpriority,
	(select distinct(site.description) from site, workorder where site.siteid=workorder.siteid and site.orgid='YARORG') as siteid,
	workorder.targstartdate,
	workorder.targcompdate,
	workorder.actfinish,
	workorder.actfinish-workorder.targcompdate as delay
from 
	workorder 
	where workorder.wonum='TR3021579'

where --" + params["where"] and 
	workorder.orgid = 'YARORG' and workorder.parent is null and workorder.jpnum is not null and workorder.targstartdate is not null and workorder.targcompdate is not null
	and workorder.targcompdate <= '01/01/2009'   --" + MXReportSqlFormat.getEndDayTimestampFunction(params["enddate"]
	and workorder.targstartdate >= '01/01/2009'  --" + MXReportSqlFormat.getStartDayTimestampFunction(params["startdate"])

select distinct(site.description) from site, workorder where site.siteid=workorder.siteid and workorder.wonum='TR3021579'

select 
		jobplan.priority 
	from 
		jobplan, workorder 
	where 
		jobplan.jpnum = workorder.jpnum 
		and (
			(jobplan.orgid=workorder.orgid 
				and jobplan.siteid=workorder.siteid) 
			or 
			(jobplan.orgid=workorder.orgid 
				and jobplan.siteid is null) 
			or (
				jobplan.orgid is null 
					and jobplan.siteid is null)
			) and jobplan.orgid='YARORG' and workorder.wonum='TR3021579'
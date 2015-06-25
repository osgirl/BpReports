select 	workorder.parent, workorder.wonum, workorder.description, workorder.assetnum, workorder.classstructureid, workorder.siteid, s.description siteDesc, wl.description summary, ld.ldtext wldescription from workorder, site as s, worklog as wl, longdescription as ld where 1=1 and workorder.worktype='100' and workorder.wopriority=10 and workorder.orgid='YARORG' and workorder.targcompdate <= { ts '2015-01-05 23:59:59.998' } and workorder.targstartdate >= { ts '2014-01-05 00:00:00.000' } and workorder.siteid = s.siteid and workorder.wonum = wl.RECORDKEY and workorder.siteid = wl.SITEID and 1 = wl.clientviewable and wl.WORKLOGID = ld.ldkey 

--SELECT * FROM WORKORDER WHERE ORGID = 'YARORG'

--SELECT * FROM dbo.longdescription

--select * from workorder where parent is null and wopriority = 10

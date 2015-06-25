select workorder.wonum, workorder.description, workorder.assetnum, workorder.classstructureid, workorder.siteid,
   s.description siteDesc, wl.description summary, ld.ldtext wldescription,
    s.siteid abc,wl.recordkey,wl.siteid,wl.clientviewable,
   ld.ldkey  from workorder, site s,
    worklog wl, longdescription ld where 1=1 and workorder.worktype='100' and workorder.wopriority=10 
    and workorder.parent is null and workorder.orgid='BP-TURK' and workorder.siteid = abc (+) and 
    workorder.wonum = wl.RECORDKEY (+)
 and workorder.siteid = wl.SITEID (+) and 1 = wl.clientviewable (+) and wl.WORKLOGID = ld.ldkey (+)
 
 
 select workorder.wonum, workorder.description, workorder.assetnum, workorder.classstructureid, 
 workorder.siteid,   s.description siteDesc, wl.description summary, ld.ldtext wldescription
   from workorder, site s, worklog wl, longdescription ld where 1=1 and workorder.worktype='100' 
   and workorder.wopriority=10 and workorder.parent is null and
  workorder.orgid='BP-TURK' and workorder.siteid = s.siteid and workorder.wonum = wl.RECORDKEY 
  and workorder.siteid = wl.SITEID and 1 = wl.clientviewable and wl.WORKLOGID = ld.ldkey 
  
  select workorder.wonum, workorder.description, workorder.assetnum, workorder.classstructureid, workorder.siteid, 
    s.description siteDesc, wl.description summary, ld.ldtext wldescription  from workorder, site s, worklog wl, 
    longdescription ld where 1=1 and workorder.siteid = s.siteid and workorder.wonum = wl.RECORDKEY 
     and workorder.siteid = wl.SITEID and 1 = wl.clientviewable and wl.WORKLOGID = ld.ldkey 
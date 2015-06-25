
insert into jobtask 
	(jpnum,jptask,description,orgid,siteid,
	 taskduration, jobtaskid, jobplanid, langcode, hasld,
	 flowcontrolled, 
	 suspendflow, flowactionassist, pluscjprevnum, pluscnestedjprevnum, apptrequired, inctasksinsched)
values 
	('ACILAY',10,'Acil aydinlatmanin enerjisi kesilir',
	'BP','GEMLIK', 0, 2283, 110, 'EN', 0, 0, 0,0, 0,0,0,1)	--BPTR	GEMLIK
	
select * from jobtask

delete from jobplan





INSERT INTO WORKORDER (WONUM , PARENT , STATUS  , WORKTYPE, DESCRIPTION, ASSETNUM, LOCATION, JPNUM, CHANGEBY, ORGID, SITEID, ROUTE, lms, statusdate,estdur, estlabhrs , estmatcost, estlabcost, esttoolcost, actlabhrs, actmatcost, actlabcost, acttoolcost, haschildren, outlabcost, outmatcost, outtoolcost, historyflag, downtime, chargestore, estservcost, actservcost, disabled, estatapprlabhrs, estatapprlabcost, estatapprmatcost, estatapprtoolcost, estatapprservcost, hasfollowupwork, istask, woclass, woacceptscharges, parentchgsstatus, workorderid, langcode, interruptible, hasld, woisswap, newchildclass, suspendflow, flowcontrolled, flowactionassist, ignoresrmavail, ignorediavail, pluscismobile,pluscloop, inctasksinsched, nestedjpinprocess, reqasstdwntime, apptrequired, aos, ams, los) VALUES('TR2994092','TR2994061','COMP','60','YDT0424 PIKNIK DOLUM KANTAR','YDT0424','L10301','B0250','ATESH1','BP-TURK','YDT-1','R117','0','2015-05-12 12:46:05.087','0'  ,'0','0.00','0.00','0.00', '0', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0.00', '0', '0', '0', '0.00', '0.00', '0', '0', '0.00', '0.00', '0.00', '0.00','0', '0', 'ACTIVITY', '1', '1' , '9998', 'EN','0', '0', '0', 'WORKORDER', '0', '0', '0', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0','0');



select wonum,workorderid from workorder where wonum in ('TR2994091', 'TR2994092')



















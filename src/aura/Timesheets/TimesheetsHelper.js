({
	getLastTimesheets : function(component,timesheets) {
        var id="";        
        var lastT=component.get("v.lasttimesheets");
        for(var ts of timesheets ){
            if(ts.Employee__r.Id!=id){
               id= ts.Employee__r.Id;
               lastT.push(ts);
            }
        }        
        component.set("v.lasttimesheets",lastT);
    }
})
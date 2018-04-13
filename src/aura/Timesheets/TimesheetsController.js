({
	doInit : function(component, event, helper) {
	   // Create the action
	   component.set("v.listmode","all");	   
	   helper.getAllTimesheets(component);	
	},
	switchListHandler: function(component, event, helper){
		
		var param = event.getParam("mode");
		component.set("v.listmode",param);
		helper.getAllTimesheets(component);
		
	},
	submitHandler: function(component, event, helper){
        debugger;
		var timesheets= event.getParam("timesheets");
		if(timesheets.length >0)
		  helper.submitCheckedTimesheets(component,timesheets);		
	}
})
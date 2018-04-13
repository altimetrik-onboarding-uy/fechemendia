({
	doInit : function(component, event, helper) {
	   // Create the action
	   component.set("v.listmode","all");	   
	   helper.getAllTimesheets(component);	
	},
	switchListHandler: function(component, event, helper){
		debugger;
		var mode = event.getParam("mode");
		var filter = event.getParam("filter");
		component.set("v.listmode",mode);
		component.set("v.filter",filter);
		helper.getAllTimesheets(component);
		
	},
	submitHandler: function(component, event, helper){
       
		var timesheets= event.getParam("timesheets");
		if(timesheets.length >0)
		  helper.submitCheckedTimesheets(component,timesheets);		
	}
})
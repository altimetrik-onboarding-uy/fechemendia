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
		
	}
})
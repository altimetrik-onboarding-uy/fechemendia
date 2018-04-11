({
	doInit : function(component, event, helper) {
	   // Create the action
	   var action = component.get("c.getTimesheets");
	   // Add callback behavior for when response is received
	   action.setCallback(this, function(response) {
		   var state = response.getState();
		   if (state === "SUCCESS") {
               
			   var timesheets=response.getReturnValue();
			   component.set("v.alltimesheets", timesheets);
			   component.set("v.currentimesheets",timesheets);
			   helper.getLastTimesheets(component,timesheets);
			   console.log(timesheets);
		   }
		   else {
			   console.log("Failed with state: " + state);
		   }
	   });
	   // Send action off to be executed
	   $A.enqueueAction(action);	
	},
	switchListHandler: function(component, event, helper){
		
		var param = event.getParam("mode");
		if(param=="all"){
			var arr=component.get("v.alltimesheets"); 
			component.set("v.currentimesheets",arr);
		}
		else{
			var arr=component.get("v.lasttimesheets"); 
			component.set("v.currentimesheets",arr);
		}
		console.log(param);
	}
})
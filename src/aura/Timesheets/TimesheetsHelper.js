({
	
    getAllTimesheets : function(component) {
        // Create the action
       var action = component.get("c.getTimesheets");
       var mode = component.get("v.listmode"); 
       var filter = component.get("v.filter");
       action.setParams({
        "mode" : mode,
        "filter" : filter
      });
	   // Add callback behavior for when response is received
	   action.setCallback(this, function(response) {

		   var state = response.getState();
		   if (state === "SUCCESS") {
               
               var mode = component.get("v.listmode"); 
               var timesheets=response.getReturnValue();
               component.set("v.currentimesheets",timesheets);			  			   
		   }
		   else {
			   console.log("Failed with state: " + state);
		   }
	   });
	   // Send action off to be executed
	   $A.enqueueAction(action);
    },
    submitCheckedTimesheets: function(component,tslist){
      
       var action = component.get("c.submitTimesheets");
       action.setParams({
         "timesheets" : tslist
       });
       action.setCallback(this, function(response) {

            var state = response.getState();
            if (state === "SUCCESS") {           	   
            this.getAllTimesheets(component);            
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);         
    }
})
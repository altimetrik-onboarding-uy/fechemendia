({
	
    getAllTimesheets : function(component) {
        // Create the action
       var action = component.get("c.getTimesheets");
       
	   // Add callback behavior for when response is received
	   action.setCallback(this, function(response) {

		   var state = response.getState();
		   if (state === "SUCCESS") {
               
               var mode = component.get("v.listmode"); 
               var timesheets=response.getReturnValue();
               
               if(mode=="all"){                    
                    component.set("v.currentimesheets",timesheets);
                }
                else{
                    
                    var id="";        
                    var lastT=[];
                    for(var ts of timesheets ){
                        if(ts.Employee__r.Id!=id){
                           id= ts.Employee__r.Id;
                           lastT.push(ts);
                        }
                    }        
                    component.set("v.currentimesheets",lastT);
                }			   
			  			   
		   }
		   else {
			   console.log("Failed with state: " + state);
		   }
	   });
	   // Send action off to be executed
	   $A.enqueueAction(action);
    }
})
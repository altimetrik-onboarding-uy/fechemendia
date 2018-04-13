({
	editEmployee: function(component, event, helper) {
		var edit=$A.get("e.force:editRecord");		
		var id=event.target.id;
		edit.setParams({
            "recordId":id
		});
		edit.fire();
	},
	checkChange: function(component, event, helper) {
				
		var tsId  = event.getSource().get("v.value");
		var selectedCheckBoxes =  component.get("v.selectedTimesheets");
		if(selectedCheckBoxes.indexOf(tsId) > -1){            
		    selectedCheckBoxes.splice(selectedCheckBoxes.indexOf(tsId), 1);           
		}
		else{
		    selectedCheckBoxes.push(tsId);
		}
		component.set("v.selectedCheckBoxes", selectedCheckBoxes); 		  
	},
	submitHandler: function(component, event, helper) {
		debugger;
		var selectedCheckBoxes =  component.get("v.selectedTimesheets");
		var viewEvent= component.getEvent("submit");
		viewEvent.setParams({"timesheets":selectedCheckBoxes});
		viewEvent.fire();
        
	}
})
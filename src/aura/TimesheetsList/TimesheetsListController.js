({
	editEmployee: function(component, event, helper) {
		var edit=$A.get("e.force:editRecord");		
		var id=event.target.id;
		edit.setParams({
            "recordId":id
		});
		edit.fire();
	}
})
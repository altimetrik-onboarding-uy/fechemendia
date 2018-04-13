({
	switchList : function(component, event, helper) {

		var viewType= component.get("v.viewtype")?"last":"all";		
		var viewEvent= component.getEvent("switchList");
		viewEvent.setParams({"mode":viewType});
		viewEvent.fire();
	}
})
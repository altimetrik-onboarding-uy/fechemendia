({
	fireRefreshTable : function(component) {
		debugger;
		var viewType= component.get("v.viewtype")?"last":"all";	
		var filter= component.get("v.value");		
		var viewEvent= component.getEvent("switchList");
		viewEvent.setParams({"mode":viewType,"filter":filter});
		viewEvent.fire();	
	}
})
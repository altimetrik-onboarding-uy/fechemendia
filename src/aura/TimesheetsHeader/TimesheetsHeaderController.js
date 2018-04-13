({
	switchList : function(component, event, helper) {

		helper.fireRefreshTable(component);
	},
	submitButtonClick : function(component, event, helper) {
      	
		  var appEvent = $A.get("e.c:onSubmitSelected");
		  appEvent.setParams({ "param" : "test" });
		  appEvent.fire();
   },
    handleChange : function(component, event, helper) {
        
		  helper.fireRefreshTable(component);
   }
		
})
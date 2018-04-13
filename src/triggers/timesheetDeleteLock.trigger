trigger timesheetDeleteLock on Timesheet__c (before delete) {
    
   for(Timesheet__c ts:Trigger.Old){
      if( ts.Statuss__c =='submitted'){
         ts.addError('A submitted timesheet can not be updated or deleted');
      }
    }
}
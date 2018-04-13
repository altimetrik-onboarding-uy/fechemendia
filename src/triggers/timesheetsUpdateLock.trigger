trigger timesheetsUpdateLock on Timesheet__c (before update) {    
       
   for(Timesheet__c ts:Trigger.New){
      if( ts.Statuss__c =='submitted'){
         ts.addError('A submitted timesheet can not be updated or deleted');
      }
    }
}
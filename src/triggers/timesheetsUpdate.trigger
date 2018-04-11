trigger timesheetsUpdate on Timesheet__c (before insert, before update) {
          for(Timesheet__c ts : Trigger.New) {
              if(ts.Statuss__c =='NOT SUBMITTED'&& ts.Submitted__c){
                  ts.Statuss__c ='SUBMITTED';
              }             
    }             
}
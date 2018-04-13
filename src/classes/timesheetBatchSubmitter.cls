global class timesheetBatchSubmitter implements Database.Batchable<sObject>, Database.Stateful {
    
    global Integer timesheetsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id,Submitted__c FROM Timesheet__c WHERE Submitted__c = false AND Gross_Pay__c >5000');    
    }
    global void execute(Database.BatchableContext bc, List<Timesheet__c> timesheets){
        // process each batch of records
        List<Timesheet__c> aux=new List<Timesheet__c>();
        for(Timesheet__c ts:timesheets){
           ts.Submitted__c = true;
           timesheetsProcessed = timesheetsProcessed + 1;
           aux.add(ts);
        }
        update aux; 
    }    
    global void finish(Database.BatchableContext bc){
        System.debug('cantidad de timesheet automaticamente submiteadas :'+ timesheetsProcessed);
    } 
}
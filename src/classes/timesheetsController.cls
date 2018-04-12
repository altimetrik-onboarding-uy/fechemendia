public class timesheetsController {

    @AuraEnabled
    public static List<sObject> getTimesheets(String mode){
       List<sObject> tslist=new List<sObject>();
       List<Timesheet__c> aux=[SELECT ID,Name, Employee__r.Name,Employee__r.Id, Employee__r.Birthdate, Start_Date__c,End_Date__c, Total_Hours__c,Gross_Pay__c,Taxes__c,Type__c,Submitted__c FROM Timesheet__c ORDER BY Employee__r.Name, Name DESC ];
      
       if(mode=='all'){
          tslist=aux;
       }
       else{
           Id ids;
           for(Timesheet__c obj:aux){
             if(obj.Employee__r.Id!=ids){
                 ids=obj.Employee__r.Id;
                tslist.add(obj);
             }
           }
       }
       return tslist;
    }
     @AuraEnabled
    public static void submitTimesheets(List<String> timesheets){
        System.debug(timesheets); 
       List<Timesheet__c> tslist= [SELECT ID,Submitted__c FROM Timesheet__c WHERE ID IN:timesheets ];
       for(Timesheet__c ts:tslist){
           ts.Submitted__c = true;
       }
       update tslist;
    }
   
}
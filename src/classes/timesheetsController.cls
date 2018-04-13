public class timesheetsController {

    @AuraEnabled
    public static List<sObject> getTimesheets(String mode, String filter){

       List<sObject> tslist=new List<sObject>();
       List<Timesheet__c> aux;
        if(mode=='all'){
           if(filter=='all'){
                aux=[SELECT ID,Name, Employee__r.Name,Employee__r.Id, Employee__r.Birthdate, Start_Date__c,
                    End_Date__c, Total_Hours__c,Gross_Pay__c,Taxes__c,Type__c,Submitted__c
                    FROM Timesheet__c ORDER BY Employee__r.Name, Name DESC ];
           }
            else{
                Boolean fil=(filter=='submitted')? true:false;
                aux=[SELECT ID,Name, Employee__r.Name,Employee__r.Id, Employee__r.Birthdate, Start_Date__c,
                    End_Date__c, Total_Hours__c,Gross_Pay__c,Taxes__c,Type__c,Submitted__c
                    FROM Timesheet__c WHERE Submitted__c=:fil ORDER BY Employee__r.Name, Name DESC ];
            }  
        }
        else{
             AggregateResult[] t=[SELECT  MAX(Name) FROM Timesheet__c GROUP BY Employee__r.ID];

            List<String> l=new List<String>();
            for(AggregateResult r: t){
                l.add(String.valueOf(r.get('expr0')));
            }

            if(filter=='all'){
                aux=[SELECT ID,Name, Employee__r.Name,Employee__r.Id, Employee__r.Birthdate, Start_Date__c,
                    End_Date__c, Total_Hours__c,Gross_Pay__c,Taxes__c,Type__c,Submitted__c
                    FROM Timesheet__c WHERE Name IN:l ];
           }
            else{
                Boolean fil=(filter=='submitted')? true:false;
                aux=[SELECT ID,Name, Employee__r.Name,Employee__r.Id, Employee__r.Birthdate, Start_Date__c,
                    End_Date__c, Total_Hours__c,Gross_Pay__c,Taxes__c,Type__c,Submitted__c
                    FROM Timesheet__c WHERE Name IN:l AND Submitted__c=:fil ];
            }  
        }      
       return aux;
    }
     @AuraEnabled
    public static void submitTimesheets(List<String> timesheets){
       
       List<Timesheet__c> tslist= [SELECT ID,Submitted__c FROM Timesheet__c WHERE ID IN:timesheets ];
       for(Timesheet__c ts:tslist){
           ts.Submitted__c = true;
       }
       update tslist;
    }
   
}
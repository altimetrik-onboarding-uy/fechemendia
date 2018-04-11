public class timesheetsController {

    @AuraEnabled
    public static List<sObject> getTimesheets(){
       List<sObject> tslist= [SELECT ID,Name, Employee__r.Name,Employee__r.Id, Employee__r.Birthdate, Start_Date__c,End_Date__c, Total_Hours__c,Gross_Pay__c,Taxes__c,Type__c,Submitted__c FROM Timesheet__c ORDER BY Employee__r.Name, Name DESC ];
       return tslist;
    }

}
@isTest
public class TestDataFactory {
    
    public static List<Timesheet__c> createTimesheets(Integer numTimesheets, Boolean status,Integer hourRate,Integer hourPerDay){
        
         Contact c=new Contact();
         c.FirstName='Jeff';
         c.LastName='Morris';
         insert c; 
        
        List<Timesheet__c> l=new List<Timesheet__c>();
         for(Integer i=0;i<numTimesheets;i++) {
            Timesheet__c t=new Timesheet__c();
            t.Employee__c=c.Id;
            t.Submitted__c=status;
            t.Monday__c=hourPerDay;
            t.Tuesday__c=hourPerDay;
            t.Wednesday__c=hourPerDay;
            t.Thursday__c=hourPerDay;
            t.Friday__c=hourPerDay;
            t.Hour_Rate__c=hourRate;

            l.add(t);
        }
       insert l;   
      return l; 
    }
 
}
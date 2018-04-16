@isTest
public class timesheetsControllerTest {

   @isTest static void testGetTimesheetsAllAll(){

     TestDataFactory.createTimesheets(1, false,70,8);
       
     Test.startTest();
     List<sObject> ts=timesheetsController.getTimesheets('all','all');
     Test.stopTest();
     
     System.assertEquals(1,ts.size());  
   } 
   @isTest static void testGetTimesheetsAllSubmitted(){

     TestDataFactory.createTimesheets(1, true,70,8);
       
     Test.startTest();
     List<sObject> ts=timesheetsController.getTimesheets('all','submitted');
     Test.stopTest();
     
     System.assertEquals(1,ts.size());  
   }
    @isTest static void testGetTimesheetsLastAll(){
        
      TestDataFactory.createTimesheets(2, false,70,8);   
      Test.startTest();
      List<sObject> ts=timesheetsController.getTimesheets('last','all');
      Test.stopTest();
        
      System.assertEquals(1,ts.size());  
   }
    @isTest static void testGetTimesheetsLastSubmitted(){
        
     Test.startTest();   
     TestDataFactory.createTimesheets(3, true,70,8); 
     Test.stopTest();  
     List<sObject> ts=timesheetsController.getTimesheets('last','submitted');
        
     System.assertEquals(1,ts.size());  
   }
    @isTest static void testSubmittTimeSheets(){ 
        
     Test.startTest();   
     List<sObject> ts =TestDataFactory.createTimesheets(2, false,70,8); 
     Test.stopTest(); 
      List<String> up = new List<String>();
      for(Integer i=0;i<ts.size();i++)   
        up.add(ts.get(i).Id);
      timesheetsController.submitTimesheets(up);
     
     List<Timesheet__c> tsl=[SELECT ID,Name FROM Timesheet__c WHERE Submitted__c=true ];   
     System.assertEquals(2,tsl.size());  
   }
}
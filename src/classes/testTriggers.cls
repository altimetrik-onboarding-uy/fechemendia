@isTest
public class testTriggers {
   @isTest static void testNotificacitonTrigger(){

     TestDataFactory.createTimesheets(2, false,90,9);      
     Test.startTest();     
     Integer emailInvocations = Limits.getEmailInvocations();
     Test.stopTest();
     
     system.assertEquals(0, emailInvocations);
   } 

   @isTest static void testDeleteLockTrigger(){

    List<Timesheet__c> l=  TestDataFactory.createTimesheets(2, true,90,9);
       
     Test.startTest();
     Database.DeleteResult[] results = Database.delete(l, false);
     Test.stopTest();
     
     for(Database.DeleteResult dr : results) {
            System.assert(!dr.isSuccess());
        }
   }

   @isTest static void testMailManager(){
    
     Test.startTest();
     EmailManager.sendMail('fher.cuba@gmail.com','Probando','Otro');        
     Integer emailInvocations = Limits.getEmailInvocations();
     Test.stopTest();
     
     system.assertEquals(1, emailInvocations);
   } 

   @isTest static void testUpdateBatch(){
    
     TestDataFactory.createTimesheets(2, false,90,12); 
     Test.startTest();
     timesheetBatchSubmitter batch = new timesheetBatchSubmitter();
     DataBase.executeBatch(batch);
     Test.stopTest();
     
     List<Timesheet__c> tsl=[SELECT ID,Name FROM Timesheet__c WHERE Submitted__c=true ];   
     System.assertEquals(2,tsl.size());
   }    

}
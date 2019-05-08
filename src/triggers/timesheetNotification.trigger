trigger timesheetNotification on Timesheet__c (before insert) {    
   
       for(Timesheet__c ts : Trigger.New) {
           if((ts.Gross_Pay__c>=2000) || (ts.Total_Hours__c>40)){
               Contact c= [SELECT Email from Contact where id=:ts.Employee__c LIMIT 1];             
               
               String templateString = 'A timesheed has been registered for you with the following information: '
                   +'\nStar Date: {0}'
                   +'\nEnd Date: {1}'
                   +'\nType: {2}'
                   +'\nRate: {3}'
                   +'\nGross Pay: {4}'
                   +'\nTaxes: {5}'
                   +'\nStatus: {6}'
                   +'\nComments: {7}';               
               String[] arguments = new String[] {
                   String.valueOfGmt(ts.Start_Date__c)
                   ,String.valueOfGmt(ts.End_Date__c)
                   ,ts.Type__c
                   ,String.valueOf(ts.Hour_Rate__c)
                   ,String.valueOf(ts.Gross_Pay__c)
                   ,String.valueOf(ts.Taxes__c)
                   ,ts.Statuss__c
                   ,ts.Comments__c};              
              String formattedString = String.format(templateString, arguments);
             
              if(c.Email!=null)
                EmailManager.sendMail(c.Email, 'Timesheet', formattedString);
           }          
    }          
}
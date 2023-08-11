@isTest
public class TestAccountTrigger{
	@isTest
      private static void testBeforeInsertAccount() {
        List<Account> accList = new List<Account>();
        Account a1= new Account ( NAME='Account ABC', Phone='(61)245783214.');
        accList.add(a1);
        Account a2 = new Account (NAME='Account DEF', Phone='61-490-490-479.');
        accList.add(a2);
        Account a3 = new Account (NAME='Account XYZ', Phone='61-1300907987');
        accList.add(a3);
          
        Test.startTest();
          insert accList;
        Test.stopTest();
          
         Account a4= [SELECT NAME, Phone FROM Account where Id=:a1.Id];
         Account a5= [SELECT NAME, Phone FROM Account where Id=:a2.Id];
         Account a6= [SELECT NAME, Phone FROM Account where Id=:a3.Id];
         System.assertEquals('+61 2 4578 3214',a4.phone);
         System.assertEquals('+61 490 490 479',a5.phone);
      }
    
    @isTest
      private static void testBeforeUpdateAccount() {
        List<Account> accList = new List<Account>();
        Account a1= new Account(Name='Account1', Phone='(61)245783214.');
        accList.add(a1);
        Account a2 = new Account (NAME='Account DEF', Phone='61-490-490-479.');
        accList.add(a2);
        Account a3 = new Account (NAME='Account XYZ', Phone='61-1300907987');
        accList.add(a3);

        Test.startTest();
        insert accList;
        
        a1.Phone = '397863457';
        update a1;
        Test.stopTest();
          
        Account retrivedAcc= [SELECT NAME, Phone FROM Account where Id=:a1.Id];
        System.assertEquals('+61 3 9786 3457',retrivedAcc.phone);
      }
}
@isTest
public class TestLeadTrigger {
	 @isTest
      private static void testBeforeInsertUpdateLead() {
        List<Lead> leadList = new List<Lead>();
        Lead l1= new Lead ( lastNAME='Lead ABC', Phone='(61)1800908909.', MobilePhone='0 490490490', Company='ABC',Status='Open - Not Contacted' );
        leadList.add(l1);
        Lead l2 = new Lead (lastNAME='Lead DEF', Phone='61-245783214', MobilePhone='61 490490491', Company='DEF',Status='Open - Not Contacted');
        leadList.add(l2);
        Test.startTest();
        	insert leadList;
        Test.stopTest();
        Lead l3= [SELECT Id, Phone, MobilePhone FROM Lead where Id=:l1.Id];
        Lead l4= [SELECT Id, Phone, MobilePhone FROM Lead where Id=:l2.Id];
        System.assertEquals('+61 490 490 490',l3.MobilePhone);
        System.assertEquals('+61 2 4578 3214',l4.phone);
        System.assertEquals('+61 490 490 491',l4.MobilePhone);
          
        l3.phone = '0412345678';
        update l3;
        Lead l5= [SELECT Id, Phone, MobilePhone FROM Lead where Id=:l3.Id];
        System.assertEquals('+61 412 345 678',l5.phone);  
      }
}
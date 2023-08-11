@isTest
public class TestContactTrigger {
	@isTest
    public static void testBeforeInsertUpdate(){
        List<Contact> contList = new List<Contact>();
        Contact c1= new Contact ( lastNAME='CONTACT ABC', npe01__WorkPhone__c='(61)245783214.', MobilePhone='0 490490490', HomePhone='290490491');
        contList.add(c1);
        Contact c2 = new Contact (lastNAME='CONTACT DEF', npe01__WorkPhone__c='61-490-490-479.', MobilePhone='61 490490491', HomePhone='(061)1300134544');
        contList.add(c2);
        Test.startTest();
        Insert contList;
        Test.stopTest();
        Contact c3= [SELECT Id,NAME, npe01__WorkPhone__c, MobilePhone, HomePhone FROM CONTACT where Id=:c1.Id];
        Contact c4= [SELECT Id,NAME, npe01__WorkPhone__c, MobilePhone, HomePhone FROM CONTACT where Id=:c2.Id];
       //Phone, NPSP will update Phone as Mobile Phone based on NPSP settings.
        System.assertEquals('+61 2 4578 3214',c3.npe01__WorkPhone__c);
        System.assertEquals('+61 490 490 490',c3.MobilePhone);
        System.assertEquals('+61 2 9049 0491',c3.HomePhone);
        System.assertEquals('+61 490 490 479',c4.npe01__WorkPhone__c);
        System.assertEquals('+61 490 490 491',c4.MobilePhone);
        System.assertEquals('1300 134 544',c4.HomePhone);
            
        c3.MobilePhone = '0412342345';
        update c3;
        
        Contact c5= [SELECT NAME, MobilePhone FROM CONTACT where Id=:c3.Id];
        System.assertEquals('+61 412 342 345',c5.MobilePhone);
    }
}
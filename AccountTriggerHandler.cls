public class AccountTriggerHandler {
    public static void updatePhoneNumbers(List<Account> records){ 
        System.debug('Before Insert');
        for(Account acc:records){
             if (acc.Phone != null && !acc.phone.startsWith('+61')){
                    acc.Phone=PhoneUtility.formatNumber(acc.Phone);
                }
                if(acc.npo02__HouseholdPhone__c!=null && !acc.npo02__HouseholdPhone__c.startsWith('+61')){
                    acc.npo02__HouseholdPhone__c=PhoneUtility.formatNumber(acc.npo02__HouseholdPhone__c);
                }
        }
    }
    
     public static void updatePhoneNumbers(Map<Id,Account> newMap, Map<Id,Account> oldMap){ 
         System.debug('Before Update');
        for(Account newRecord:newMap.values()){
            Account oldRecord = oldMap.get(newRecord.Id);
            if(newRecord.Phone !=oldRecord.Phone || newRecord.npo02__HouseholdPhone__c != oldRecord.npo02__HouseholdPhone__c){
               if (newRecord.Phone != null && !newRecord.phone.startsWith('+61')){
                 	newRecord.Phone=PhoneUtility.formatNumber(newRecord.Phone);
             	}
             	if(newRecord.npo02__HouseholdPhone__c!=null && !newRecord.npo02__HouseholdPhone__c.startsWith('+61')){
                	newRecord.npo02__HouseholdPhone__c=PhoneUtility.formatNumber(newRecord.npo02__HouseholdPhone__c);
             	} 
            }
        }
    }

}
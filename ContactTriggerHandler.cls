public class ContactTriggerHandler {
	
    public static void updatePhoneNumbers(List<Contact> records){ 
        for(Contact c:records){
             if (c.Phone != null && !c.phone.startsWith('+61')){
                    c.Phone=PhoneUtility.formatNumber(c.Phone);
                }
                if(c.MobilePhone!=null && !c.MobilePhone.startsWith('+61')){
                    c.MobilePhone=PhoneUtility.formatNumber(c.MobilePhone);
                }
            	if(c.HomePhone != null && !c.HomePhone.startsWith('+61')){
                    c.HomePhone=PhoneUtility.formatNumber(c.HomePhone);
                }
                if(c.npe01__WorkPhone__c != null && !c.npe01__WorkPhone__c.startsWith('+61')){
                    c.npe01__WorkPhone__c=PhoneUtility.formatNumber(c.npe01__WorkPhone__c);
                }
                if(c.OtherPhone != null && !c.OtherPhone.startsWith('+61')){
                    c.OtherPhone=PhoneUtility.formatNumber(c.OtherPhone);
                }
        }
    }
    
     public static void updatePhoneNumbers(Map<Id,Contact> newMap, Map<Id,Contact> oldMap){ 
        for(Contact newRecord:newMap.values()){
            Contact oldRecord = oldMap.get(newRecord.Id);
            if( newRecord.Phone !=oldRecord.Phone
               || newRecord.MobilePhone != oldRecord.MobilePhone 
               || newRecord.HomePhone != oldRecord.HomePhone
               || newRecord.npe01__WorkPhone__c != oldRecord.npe01__WorkPhone__c
               || newRecord.OtherPhone != oldRecord.OtherPhone
              ){
               if (newRecord.Phone != null && !newRecord.phone.startsWith('+61')){
                 	newRecord.Phone=PhoneUtility.formatNumber(newRecord.Phone);
             	}
             	if(newRecord.MobilePhone!=null && !newRecord.MobilePhone.startsWith('+61')){
                	newRecord.MobilePhone=PhoneUtility.formatNumber(newRecord.MobilePhone);
             	} 
                if(newRecord.HomePhone != null && !newRecord.HomePhone.startsWith('+61')){
                    newRecord.HomePhone=PhoneUtility.formatNumber(newRecord.HomePhone);
                }
                if(newRecord.npe01__WorkPhone__c != null && !newRecord.npe01__WorkPhone__c.startsWith('+61')){
                    newRecord.npe01__WorkPhone__c=PhoneUtility.formatNumber(newRecord.npe01__WorkPhone__c);
                }
                if(newRecord.OtherPhone != null && !newRecord.OtherPhone.startsWith('+61')){
                    newRecord.OtherPhone=PhoneUtility.formatNumber(newRecord.OtherPhone);
                }
            }
        }
    }
}
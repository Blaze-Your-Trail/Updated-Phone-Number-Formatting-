public class LeadTriggerHandler {
	public static void updatePhoneNumbers(List<Lead> records){ 
        for(Lead newRecord:records){
             if (newRecord.Phone != null && !newRecord.phone.startsWith('+61')){
                    newRecord.Phone=PhoneUtility.formatNumber(newRecord.Phone);
                }
                if(newRecord.MobilePhone!=null && !newRecord.MobilePhone.startsWith('+61')){
                    newRecord.MobilePhone=PhoneUtility.formatNumber(newRecord.MobilePhone);
                }
        }
    }
    
     public static void updatePhoneNumbers(Map<Id,Lead> newMap, Map<Id,Lead> oldMap){ 
        for(Lead newRecord:newMap.values()){
            Lead oldRecord = oldMap.get(newRecord.Id);
            if(newRecord.Phone !=oldRecord.Phone || newRecord.MobilePhone != oldRecord.mobilePhone){
               if (newRecord.Phone != null && !newRecord.phone.startsWith('+61')){
                    newRecord.Phone=PhoneUtility.formatNumber(newRecord.Phone);
                }
                if(newRecord.MobilePhone!=null && !newRecord.MobilePhone.startsWith('+61')){
                    newRecord.MobilePhone=PhoneUtility.formatNumber(newRecord.MobilePhone);
                }
            }
        }
    }

}
trigger AccountTrigger on Account (before insert,before update) {
    if (Trigger.isBefore  && Trigger.isInsert) {
    	AccountTriggerHandler.updatePhoneNumbers(Trigger.New);
    }
    
    if (Trigger.isBefore  && Trigger.isUpdate) {
        AccountTriggerHandler.updatePhoneNumbers(Trigger.newMap,Trigger.oldMap);
    }
}
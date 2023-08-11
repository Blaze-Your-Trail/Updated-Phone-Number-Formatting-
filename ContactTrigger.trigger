trigger ContactTrigger on Contact (before insert,before update) {
        if(Trigger.isBefore && Trigger.isInsert){
            ContactTriggerHandler.updatePhoneNumbers(Trigger.New);
        } 
        if(Trigger.isBefore && Trigger.isUpdate){
            ContactTriggerHandler.updatePhoneNumbers(Trigger.newMap,Trigger.oldMap);
        }
}
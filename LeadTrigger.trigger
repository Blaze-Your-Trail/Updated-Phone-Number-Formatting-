trigger LeadTrigger on Lead (before insert, before update) {
  	if(Trigger.isInsert && Trigger.isBefore){
       	LeadTriggerHandler.updatePhoneNumbers(Trigger.New);
    } 
    if(Trigger.isBefore && Trigger.isUpdate){
    	LeadTriggerHandler.updatePhoneNumbers(Trigger.newMap,Trigger.oldMap);
    }  
}
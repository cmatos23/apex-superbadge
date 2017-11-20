/**
 * Created by ChrisMatos on 11/20/2017.
 */

trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        ClosedOpportunityHelper.createFollowUpTask(Trigger.new, Trigger.oldMap);
    }
}
/**
 * Created by ChrisMatos on 11/20/2017.
 */

public with sharing class ClosedOpportunityHelper {
    public static void createFollowUpTask(List<Opportunity> newOpportunities, Map<Id, Opportunity> oldMap){
        List<Task> followUpTasks = new List<Task>();

        for(Opportunity opp : newOpportunities){
            if(opp.StageName == 'Closed Won' && (oldMap == null || oldMap.get(opp.Id).StageName != opp.StageName)){
                Task followUp = new Task();
                followUp.WhatId = opp.Id;
                followUp.Subject = 'Follow Up Test Task';
                followUpTasks.add(followUp);
            }
        }

        if(followUpTasks.size() > 0){
            insert followUpTasks;
        }
    }
}
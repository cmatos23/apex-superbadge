/**
 * Created by ChrisMatos on 11/20/2017.
 */

global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([SELECT id, LeadSource FROM Lead]);
    }
    global void execute(Database.BatchableContext BC, List<Lead> leads){


        for(Lead theLead : leads){
            theLead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
    global void finish(Database.BatchableContext BC){

    }
}
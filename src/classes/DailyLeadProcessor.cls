/**
 * Created by ChrisMatos on 11/20/2017.
 */

global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext SC) {
        Lead[] leadsBlankSource = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = NULL LIMIT 200];
        for(Lead lead : leadsBlankSource){
            lead.LeadSource = 'Dreamforce';
        }
        update leadsBlankSource;
    }
}
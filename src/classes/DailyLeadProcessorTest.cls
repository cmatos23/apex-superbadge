/**
 * Created by ChrisMatos on 11/20/2017.
 */
@IsTest
public with sharing class DailyLeadProcessorTest {
    @IsTest
    public static void itShouldUpdateLeadSourceSchedule(){
        insert RandomLeadFactory.generateRandomLeads(200, 'Test', 'Test Company');
        Test.startTest();
        DailyLeadProcessor sh1 = new DailyLeadProcessor();
        String sch = '0 0 23 * * ?';
        System.schedule('Test Daily  Lead Processor', sch, sh1);
        Test.stopTest();

        for(Lead lead : [SELECT id, LeadSource FROM Lead]){
            if(lead.LeadSource != 'Dreamforce'){
                System.assert(false);
            }
        }
    }
}
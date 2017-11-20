/**
 * Created by ChrisMatos on 11/20/2017.
 */
@IsTest
public with sharing class LeadProcessorTest {
    @IsTest
    public static void itShouldUpdateLeads(){
        insert RandomLeadFactory.generateRandomLeads(200, 'Test', 'SMBHD');
        Test.startTest();
        Database.executeBatch(new LeadProcessor());
        Test.stopTest();
        for(Lead lead : [SELECT id, LeadSource FROM Lead]){
            if(lead.LeadSource != 'Dreamforce'){
                System.assert(false);
            }
        }
    }
}
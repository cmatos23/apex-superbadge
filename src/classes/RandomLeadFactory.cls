/**
 * Created by ChrisMatos on 11/20/2017.
 */

public with sharing class RandomLeadFactory {
    public static List<Lead> generateRandomLeads(Integer numLeads, String lastName, String companyName){
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < numLeads; ++i){
            Lead lead = new Lead();
            lead.FirstName = 'Test ' + i;
            lead.LastName = lastName;
            lead.Company = companyName;
            leads.add(lead);
        }

        return leads;
    }
}
/**
 * Created by ChrisMatos on 11/20/2017.
 */

public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        if(accountIds == null || accountIds.size() == 0){
            return;
        }
        Account[] accountList = [SELECT id, Number_of_Contacts__c, (SELECT id FROM Contacts) FROM Account WHERE Id IN :accountIds];
        for(Account acc : accountList){
            acc.Number_of_Contacts__c = acc.Contacts.size();
        }

        update accountList;
    }
}
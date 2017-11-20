/**
 * Created by ChrisMatos on 11/20/2017.
 */
@IsTest
public with sharing class AccountProcessorTest {
    @IsTest
    public static void itShouldUpdateNumContacts(){


        Account acc = new Account();
        acc.Name = 'Test Name';
        insert acc;
        Integer numContacts = 10;
        insert RandomContactFactory.generateRandomContactsWithAccount(acc.Id, numContacts, 'Test');
        Test.startTest();

        AccountProcessor.countContacts(new List<Id>());

        AccountProcessor.countContacts(new List<Id>{acc.Id});

        Test.stopTest();

        System.assertEquals(numContacts, [SELECT Number_of_Contacts__c FROM Account WHERE Id = :acc.Id].Number_of_Contacts__c);

    }
}
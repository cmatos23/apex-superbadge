/**
 * Created by ChrisMatos on 11/30/2017.
 */
@IsTest
public with sharing class AccountManagerTest {
    @IsTest
    public static void testRestService(){
        RestRequest request = new RestRequest();
        Account[] accounts = RandomAccountFactory.generateRandomAccounts(1);

        insert accounts;

        insert RandomContactFactory.generateRandomContactsWithAccount(accounts[0].Id, 1, 'Test');

        request.requestURI = 'https://na73.salesforce.com/services/apexrest/Accounts/' + accounts[0].Id + '/contacts';

        request.httpMethod = 'GET';
        RestContext.request = request;

        Account theAccount = AccountManager.getAccount();

        System.assert(theAccount != null);
        System.assertEquals(accounts[0].Id, theAccount.Id);
        System.assertEquals(1, theAccount.Contacts.size());

        request = new RestRequest();
        request.requestURI = 'https://na73.salesforce.com/services/apexrest/Accounts/contacts5';
        RestContext.request = request;

        System.assert(AccountManager.getAccount() == null);

    }
}
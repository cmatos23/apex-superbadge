/**
 * Created by ChrisMatos on 11/20/2017.
 */
@IsTest
public with sharing class AddPrimaryContactTest {
    @IsTest
    public static void itShouldAddPrimaryContacts(){
        List<Account> accountsNY = RandomAccountFactory.generateRandomAccounts(50);

        for(Account acc : accountsNY){
            acc.BillingState = 'NY';
        }

        insert accountsNY;

        List<Account> accountsCA = RandomAccountFactory.generateRandomAccounts(50);
        for(Account acc : accountsCA){
            acc.BillingState = 'CA';
        }

        insert accountsCA;
        Contact con = new Contact();
        con.LastName = 'Primary';
        Test.startTest();
        System.enqueueJob(new AddPrimaryContact(con, 'CA'));
        Test.stopTest();

        System.assertEquals(50, [SELECT id FROM Contact WHERE Account.BillingState = 'CA'].size());
    }
}
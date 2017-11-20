/**
 * Created by ChrisMatos on 11/20/2017.
 */

public with sharing class RandomAccountFactory {
    public static final Integer DML_LIMIT_INSERT = 10000;
    public static List<Account> generateRandomAccounts(Integer numAccounts){
        if(numAccounts > DML_LIMIT_INSERT || numAccounts < 0){
            System.debug('invalid number of accounts');
            return null;
        }
        List<Account> accountList = new List<Account>();
        for(Integer i = 0; i < numAccounts; i++){
            accountList.add(new Account(Name = 'Test Account ' + i));
        }

        return accountList;
    }
}
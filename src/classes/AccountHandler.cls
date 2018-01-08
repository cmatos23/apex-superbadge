/**
 * Created by ChristopherMatos on 1/8/2018.
 */

public with sharing class AccountHandler {
    public static Account insertNewAccount(String accountName){
        if(String.isBlank(accountName)){
            return null;
        }
        Account newAccount = new Account();
        newAccount.Name = accountName;
        try{
            insert newAccount;
        }
        catch(DMLException e){
            return null;
        }
        return newAccount;
    }
}
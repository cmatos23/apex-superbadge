/**
 * Created by ChrisMatos on 11/20/2017.
 */

public with sharing class AccountAddressHelper {

    /*Checks checkbox on Account, moves over Postal Code if true*/
    public static void matchPostalCodes(List<Account> newAccounts, Map<Id, Account> oldMap){

        for(Account acc : newAccounts){
            if(acc.Match_Billing_Address__c == TRUE && (oldMap == null || oldMap.get(acc.Id).Match_Billing_Address__c != acc.Match_Billing_Address__c)){
                if(acc.BillingPostalCode != null){
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
            }
        }

    }
}
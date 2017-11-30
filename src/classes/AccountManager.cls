/**
 * Created by ChrisMatos on 11/29/2017.
 */
@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        if(request.requestURI.endsWith('/contacts')){
            String requestUrI = request.requestURI.substringBefore('/contacts');
            String accountId = requestUrI.substring(requestUrI.lastIndexOf('/') + 1);
            Account returnAccount;
            if(String.isNotBlank(accountId)){
                returnAccount = [SELECT Id, Name, (Select Id, Name FROM Contacts) FROM Account WHERE Id = :accountId LIMIT 1];
            }
            return returnAccount;
        }
        else{
            System.debug('invalid request');
            return null;
        }
    }

//    public class AccountResponse{
//        public String Id;
//        public String Name;
//        public ContactResponse[] contacts;
//    }
//    public class ContactResponse{
//        public String Id;
//        public String Name;
//    }
}
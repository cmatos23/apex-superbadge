/**
 * Created by ChrisMatos on 11/20/2017.
 */

public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String lastName){
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < numContacts; ++i){
            Contact con = new Contact();
            con.FirstName = 'Test ' + i;
            con.LastName = lastName;
            contacts.add(con);
        }
        return contacts;
    }
    public static List<Contact> generateRandomContactsWithAccount(Id accountId, Integer numContacts, String lastName){
        List<Contact> contacts = generateRandomContacts(numContacts, lastName);

        for(Contact c : contacts){
            c.AccountId = accountId;
        }

        return contacts;
    }

}
/**
 * Created by ChristopherMatos on 1/8/2018.
 */

public with sharing class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailPostalCode){
        return [SELECT Name FROM Contact WHERE LastName = :lastName AND MailingPostalCode = :mailPostalCode];
    }
}
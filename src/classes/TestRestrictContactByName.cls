/**
 * Created by ChrisMatos on 11/20/2017.
 */
@IsTest
public with sharing class TestRestrictContactByName {
    @IsTest
    public static void itShouldRestrictContact(){
        Contact contactWithBadName = new Contact();
        contactWithBadName.LastName = 'INVALIDNAME';

        Boolean didFail = false;
        try{
            insert contactWithBadName;
        }
        catch(Exception e){
            didFail = true;
        }
        System.assert(didFail);



    }
}
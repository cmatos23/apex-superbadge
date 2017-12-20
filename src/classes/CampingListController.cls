/**
 * Created by ChristopherMatos on 12/19/2017.
 */

public with sharing class CampingListController {

    @AuraEnabled
    public static Camping_Item__c[] getItems(){
        return [SELECT Id, Name, Price__c, Quantity__c, Packed__c FROM Camping_Item__c];
    }
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c item){
        try{
            if(item == null){
                throw new AuraHandledException('No Item Provided in saveItem');
            }
            upsert item;
            return item;
        }
        catch(Exception e){
            throw new AuraHandledException(e.getMessage());
            return null;
        }
    }
}
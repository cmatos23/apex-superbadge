/**
 * Created by ChrisMatos on 11/20/2017.
 */

trigger AccountAddressTrigger on Account (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)){
//        AccountAddressHelper.matchPostalCodes(Trigger.new, Trigger.oldMap);
    }
}
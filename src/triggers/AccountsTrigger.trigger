/**
 * Created by ChristopherMatos on 1/10/2018.
 */

trigger AccountsTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    fflib_SObjectDomain.triggerHandler(Accounts.class);
}
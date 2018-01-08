/**
 * Created by ChristopherMatos on 1/8/2018.
 */

public with sharing class NotificationController {
    @AuraEnabled
    public static String getSessionId() {
        return UserInfo.getSessionId();
    }

}
/**
 * Created by ChristopherMatos on 1/9/2018.
 */

global with sharing class CaseService {
    global static void closeCases(Set<Id> caseIds, String closeReason){
        if(caseIds == null || caseIds.size() == 0){
            throw new CaseServiceException('No Case Ids specified for close cases');
        }
        List<Case> cases = new List<Case>();
        for(Id caseId : caseIds){
            cases.add(new Case(Id = caseId, Reason = closeReason, Status = 'Closed'));
        }
        Savepoint sp = Database.setSavepoint();
        try{
            update cases;
        }
        catch(Exception e){
            Database.rollback(sp);
            throw e;
        }
    }

    public class CaseServiceException extends Exception{}
}
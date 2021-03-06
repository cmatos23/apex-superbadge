public class Opportunities extends fflib_SObjectDomain {

    public Opportunities(List<Opportunity> sObjectList) {
        super(sObjectList);
    }

    public override void onValidate() {

        // Validate Opportunities
        for(Opportunity opp : (List<Opportunity>) Records) {
            if(opp.Type.startsWith('Existing') && opp.AccountId == null) {
                opp.AccountId.addError('You must provide an Account when ' +
                        'creating Opportunities for existing Customers.');
            }
        }
    }

    public override void onValidate(Map<Id,SObject> existingRecords) {

        // Validate changes to Opportunities
        for(Opportunity opp : (List<Opportunity>) Records) {
            Opportunity existingOpp = (Opportunity) existingRecords.get(opp.Id);
            if(opp.Type != existingOpp.Type) {
                opp.Type.addError('You cannot change the Opportunity type once it has been created');
            }
        }
    }

    public override void onAfterInsert() {
        // Related Accounts
        List<Id> accountIds = new List<Id>();
        for(Opportunity opp : (List<Opportunity>) Records) {
            if(opp.AccountId!=null) {
                accountIds.add(opp.AccountId);
            }
        }

        // Update last Opportunity activity on related Accounts via the Accounts domain class
        fflib_SObjectUnitOfWork uow =
                new fflib_SObjectUnitOfWork(
                        new Schema.SObjectType[] { Account.SObjectType });
        Accounts accounts = new Accounts([select Id from Account
        where id in :accountIds]);
        accounts.updateOpportunityActivity(uow);
        uow.commitWork();

    }



    public override void onApplyDefaults() {

        // Apply defaults to Opportunities
        for(Opportunity opportunity : (List<Opportunity>) Records) {
//            if(opportunity.DiscountType__c == null) {
//                opportunity.DiscountType__c = OpportunitySettings__c.getInstance().DiscountType__c;
//            }
        }
    }


    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Opportunities(sObjectList);
        }
    }
}

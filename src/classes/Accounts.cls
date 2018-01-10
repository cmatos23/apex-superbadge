public class Accounts extends fflib_SObjectDomain {

    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }


    public override void onBeforeUpdate(Map<Id,SObject> existingRecords){
        for(Account account : (List<Account>) Records){
            account.AnnualRevenue = AccountsService.DOMAIN_CLASSES_ROCK.getLevenshteinDistance(account.Description);
        }
    }
    public override void onApplyDefaults() {
        // Apply defaults to Opportunities
        for(Account account : (List<Account>) Records){
            if(account.Description == null) {
                account.Description = AccountsService.DOMAIN_CLASSES_ROCK;
            }
        }
    }
}

public class AccountsSelector extends fflib_SObjectSelector {
    public List<Account> selectById(Set<Id> idSet) {
        // This method simply runs in the sharing context of the caller
        // ...
        return (List<Account>) selectSObjectsById(idSet);
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
                Account.Description,
                Account.Name,
                Account.AnnualRevenue
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Account.sObjectType;
    }
}

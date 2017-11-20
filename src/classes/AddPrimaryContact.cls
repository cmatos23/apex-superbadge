/**
 * Created by ChrisMatos on 11/20/2017.
 */

global class AddPrimaryContact implements Queueable{
    private String stateAbreviation;
    private Contact contact;
    global AddPrimaryContact(Contact theContact, String stateAbv){
        this.contact = theContact;
        this.stateAbreviation = stateAbv;
    }
    global void execute(QueueableContext context){
        Account[] accountsWithStateAbv = [SELECT id FROM Account WHERE BillingState = :stateAbreviation LIMIT 200];
        Contact[] contactsToInsert = new List<Contact>();
        for(Account acc : accountsWithStateAbv){
            Contact con = contact.clone();
            con.AccountId = acc.Id;
            contactsToInsert.add(con);
        }

        insert contactsToInsert;
    }
}
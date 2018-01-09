/**
 * Created by ChristopherMatos on 1/9/2018.
 */
@IsTest
private class UnitOfWorkTest {
    @IsTest
    private static void challengeComplete(){

        // Create a Unit Of Work
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
                new Schema.SObjectType[] {
                        Account.SObjectType,
                        Contact.SObjectType,
                        Note.SObjectType
                }
        );



        for(Integer i = 0; i < 100; i++){
            Account acc = new Account();
            acc.Name = 'Test ' + i;
            uow.registerNew(acc);
            for(Integer j = 0; j < 5; j++){
                Contact con = new Contact();
                con.LastName = 'Test';
                uow.registerNew(con, Contact.AccountId, acc);

                Note aNote = new Note();
                aNote.Body = 'test Body';
                aNote.Title = 'Test Title';
                aNote.IsPrivate = false;
                uow.registerNew(aNote, Note.ParentId, con);
            }
        }

        uow.commitWork();


        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());
    }
}
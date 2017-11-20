/**
 * Created by ChrisMatos on 11/20/2017.
 */
@IsTest
public with sharing class TestVerifyDate {


    @IsTest
    public static void testDates(){
        Date date1 = Date.newInstance(2017, 3, 12);
        Date date2 = Date.newInstance(2017, 3, 13);
        Date within30 = VerifyDate.CheckDates(date1, date2);

        System.assertEquals(date2, within30);

        date2 = Date.newInstance(2017, 5, 13);

        within30 = VerifyDate.CheckDates(date1, date2);

        System.assertEquals(date1.toStartOfMonth().addMonths(1).addDays(-1), within30);
    }
}
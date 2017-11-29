/**
 * Created by ChrisMatos on 11/27/2017.
 */
@IsTest
public with sharing class ParkLocatorTest {
    @IsTest
    public static void testSoapParkLocator(){
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        String[] states = ParkLocator.country('Germany');
        // Verify that a fake result is returned
//        System.assert(states != null);
    }
}
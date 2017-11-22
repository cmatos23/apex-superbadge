/**
 * Created by ChrisMatos on 11/22/2017.
 */
@IsTest
public with sharing class AnimalLocatorTest {
    @IsTest
    public static void testPostCallOut(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        String actualValue = AnimalLocator.getAnimalNameById(99);
        String expectedValue = 'trailhead';
        System.assertEquals(actualValue, expectedValue);


    }
}
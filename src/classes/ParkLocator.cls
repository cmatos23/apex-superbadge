/**
 * Created by ChrisMatos on 11/22/2017.
 */

public with sharing class ParkLocator {
    public static String[] country(String countryName){
        ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
        return parkService.byCountry(countryName);
    }
}
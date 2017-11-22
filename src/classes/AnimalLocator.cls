/**
 * Created by ChrisMatos on 11/22/2017.
 */

public class AnimalLocator {
    public static final String animalURL = 'https://th-apex-http-callout.herokuapp.com/animals/';
    public static String getAnimalNameById(Integer Id){

        // Instantiate a new http object
        Http h = new Http();

        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint(animalURL + Id);
        req.setMethod('GET');

        // Send the request, and return a response
        HttpResponse res = h.send(req);
        String animalName;
        if (res.getStatusCode() == 200) {
            AnimalResponse animalResp = AnimalResponse.parse(res.getBody());
            if(animalResp != null && animalResp.animal != null){
                animalName = animalResp.animal.name;
            }

        }

        return animalName;
    }


}
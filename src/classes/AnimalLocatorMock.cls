/**
 * Created by ChrisMatos on 11/22/2017.
 */
@IsTest
global class AnimalLocatorMock implements HttpCalloutMock{
    global HttpResponse respond(HTTPRequest request){
        // Create a fake response

        HttpResponse response = new HttpResponse();

        response.setHeader('Content-Type', 'application/json');

        response.setBody('{"animal":{"id":99,"name":"trailhead","eats":"burritos","says":"more badgers"}}');

        response.setStatusCode(200);
        return response;
    }


}